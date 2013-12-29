require 'mram-phpbb_hash'

module PhpbbAuthenticatable
  class Failure < StandardError; end

  class CustomStrategy < Devise::Strategies::Authenticatable
    def valid?
      password && username
    end

    def authenticate!
      PhpbbUser.verify_password(username: username, password: password)

      success! mapping.to.find_or_create_by(username: username.downcase)
    rescue PhpbbAuthenticatable::Failure
      fail! I18n.t('devise.failure.invalid')
    end

  private
    def password
      scope_params[:password]
    end

    def username
      scope_params[:username]
    end

    def scope_params
      params[scope] || {}
    end
  end

  class PhpbbUser < ActiveRecord::Base
    establish_connection :phpbb
    self.table_name = 'phpbb_users'

    def self.verify_password(args)
      hash = fetch_password_hash(args[:username])

      unless Mram::PhpbbHash.check_hash(args[:password], hash)
        raise PhpbbAuthenticatable::Failure
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

Warden::Strategies.add :phpbb_authenticatable, PhpbbAuthenticatable::CustomStrategy
Devise.add_module :phpbb_authenticatable, :strategy => true, :controller => :sessions, :route => :session
