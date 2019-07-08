require 'rails_helper'

RSpec.describe "volumes/new", type: :view do
  before(:each) do
    assign(:volume, Volume.new())
  end

  it "renders new volume form" do
    render

    assert_select "form[action=?][method=?]", volumes_path, "post" do
    end
  end
end
