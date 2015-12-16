require 'test_helper'

class QuoteTest < ActiveSupport::TestCase
  test "unique_tag" do
    quote = Quote.create(:author => 'Sean Lovinger', :saying => 'Never put twinkies on your pizza!')
    expected = 'SL#' + quote.id.to_s
    actual = quote.unique_tag
    assert_equal expected, actual
  end
end
