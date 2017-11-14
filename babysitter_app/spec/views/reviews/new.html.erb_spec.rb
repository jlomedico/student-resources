require 'rails_helper'

RSpec.describe "reviews/new", type: :view do
  before(:each) do
    assign(:review, Review.new(
      :body => "MyText",
      :rating => 1,
      :babysitter => nil
    ))
  end

  it "renders new review form" do
    render

    assert_select "form[action=?][method=?]", reviews_path, "post" do

      assert_select "textarea#review_body[name=?]", "review[body]"

      assert_select "input#review_rating[name=?]", "review[rating]"

      assert_select "input#review_babysitter_id[name=?]", "review[babysitter_id]"
    end
  end
end
