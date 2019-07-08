require 'rails_helper'

RSpec.describe "volumes/show", type: :view do
  before(:each) do
    @volume = assign(:volume, Volume.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
