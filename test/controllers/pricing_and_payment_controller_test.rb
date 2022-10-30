require "test_helper"

class PricingAndPaymentControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pricing_and_payment_index_url
    assert_response :success
  end
end
