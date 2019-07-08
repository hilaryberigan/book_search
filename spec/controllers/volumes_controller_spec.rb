
require 'rails_helper'


RSpec.describe VolumesController, type: :controller do

  describe "GET #index" do
    subject { get :index }

    it "renders the index template" do
      expect(subject).to render_template(:index)
      expect(subject).to render_template("index")
      expect(subject).to render_template("volumes/index")
    end

    it "does not render a different template" do
      expect(subject).to_not render_template("volumes/show")
    end
  end

  describe "GET #search" do
    subject { get :search, params: { search: { input: 'cats'}} }

    it "renders the index template" do
      expect(subject).to render_template(:search)
      expect(subject).to render_template("search")
      expect(subject).to render_template("volumes/search")
    end

    it "does not render a different template" do
      expect(subject).to_not render_template("volumes/show")
    end

  end



end
