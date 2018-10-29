require 'rails_helper'

RSpec.describe IdeasController, type: :controller do

  describe "#new" do
    it "renders new page" do
      get(:new)
      expect(response).to render_template(:new)
    end

    it "creates an empty idea instance variable" do
      get(:new)
      expect(assigns(:idea)).to be_a_new(Idea)
    end
  end

  describe "#create" do
    context " with valid parameters" do
      def valid_request
        post(:create, params:{idea: FactoryBot.attributes_for(:idea)})
      end

      it "creates new idea in db" do
        before_count = Idea.count
        valid_request
        after_count = Idea.count
        expect(after_count).to eq(before_count+1)
      end

      it "redirects to idea show page" do
        valid_request
        idea = Idea.last
        expect(response).to redirect_to(idea_path(idea))
      end
    end

    context "without valid parameters" do
      def invalid_request
        post(:create, params:{idea: {title: "title"}})
      end

      it "does not create new idea" do
        before_count = Idea.count
        invalid_request
        after_count = Idea.count
        expect(after_count).to eq(before_count)
      end

      it "rendes to new page" do
        invalid_request
        expect(response).to render_template(:new)
      end

      it "assigns the invalid parameters to an instance var."do
        invalid_request
        idea = assigns(:idea)
        expect(idea).to be_a(Idea)
        expect(idea.valid?).to eq false
      end
    end
  end
end
