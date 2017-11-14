require 'rails_helper'

RSpec.describe "reviews/edit", type: :view do
  before(:each) do
    @review = assign(:review, Review.create!(
      :body => "MyText",
      :rating => 1,
      :babysitter => nil
    ))
  end

  it "renders the edit review form" do
    render

    assert_select "form[action=?][method=?]", review_path(@review), "post" do

      assert_select "textarea#review_body[name=?]", "review[body]"

      assert_select "input#review_rating[name=?]", "review[rating]"

      assert_select "input#review_babysitter_id[name=?]", "review[babysitter_id]"
    end
  end
end
