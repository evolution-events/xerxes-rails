require 'mram-phpbb_hash'

module Authentication
  module PhpBB
    class Failure < StandardError; end

    class User < ActiveRecord::Base
      establish_connection :phpbb
      self.table_name = 'phpbb_users'

      def self.verify_password(args)
        hash = fetch_password_hash(args[:username])

        unless Mram::PhpbbHash.check_hash(args[:password], hash)
          raise Authentication::PhpBB::Failure
        end
      end

    private
      def self.fetch_password_hash(username)
        user = find_by_sql([
          "SELECT user_password FROM phpbb_users WHERE LOWER(username)=LOWER(?)", username
        ]).first

        user.presence && user.user_password
      end
    end
  end
end
