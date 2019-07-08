require 'rails_helper'

RSpec.describe "volumes/index", type: :view do
  before(:each) do
    assign(:volumes, [
      Volume.create!(),
      Volume.create!()
    ])
  end

  it "renders a list of volumes" do
    render
  end
end
