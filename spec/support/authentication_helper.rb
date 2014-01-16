module AuthenticationHelper
  module ForControllerTests
    def login
      @user ||= User.create
      login_as(@user)
    end

    def login_as(user)
      user.class.devise
      sign_in(user)
    end
  end
end

RSpec.configure do |config|
  config.include Devise::TestHelpers, :type => :controller
  config.include AuthenticationHelper::ForControllerTests, type: :controller
end
