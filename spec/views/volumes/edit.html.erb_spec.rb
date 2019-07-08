require 'rails_helper'

RSpec.describe "volumes/edit", type: :view do
  before(:each) do
    @volume = assign(:volume, Volume.create!())
  end

  it "renders the edit volume form" do
    render

    assert_select "form[action=?][method=?]", volume_path(@volume), "post" do
    end
  end
end
