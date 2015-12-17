require 'test_helper'

class QuotesControllerTest < ActionController::TestCase
  test "quote show page" do
    quote = FactoryGirl.create(:quote)
    get :show, :id => quote.id
    assert_response :success
  end

  test "quote show page, not found" do
    get :show, :id => 'OMG'
    assert_response :not_found
  end

  test "create a quote success" do
    assert_difference 'Quote.count' do
      post :create, :quote => {
        :author => 'Yoda',
        :saying => 'Do. Or do not. There is no try'
      }
    end

    assert_redirected_to root_path
  end

  test "create a quote validation error" do
    assert_no_difference "Quote.count" do
      post :create, :quote => {
        :author => '',
        :saying => '',
      }

      assert_redirected_to root_path
    end
  end
end
