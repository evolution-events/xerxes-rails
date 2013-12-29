# ============ PHPBB INTEGRATION =====================
# If you wish to integrate with a PhpBB 3.x forum-database:
#   * provide a 'phpbb' connection configuration in database.yml
#     as shown in the database.yml.example file.
#   * uncomment the following lines:
#
# Xerxes::Application.config.to_prepare do
#   User.devise :phpbb_authenticatable
#
#   Devise::SessionsController.prepend_before_filter do
#     devise_parameter_sanitizer.for(:sign_in) do |params|
#       params.permit(:username)
#     end
#   end
# end

