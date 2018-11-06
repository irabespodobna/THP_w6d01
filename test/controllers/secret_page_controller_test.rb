require 'test_helper'

class SecretPageControllerTest < ActionDispatch::IntegrationTest
 test "should get show" do
   get secret_page_show_path
   assert_response :success
 end

end