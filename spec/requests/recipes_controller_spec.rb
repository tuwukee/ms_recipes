require "rails_helper"

RSpec.describe RecipesController, type: :request do
  let(:ms_service) { double() }

  describe "GET /index" do
    before(:each) do
      allow(ms_service).to receive(:get_recipes).and_return([])
      allow_any_instance_of(described_class).to receive(:ms_service).and_return(ms_service)
    end

    it do
      get("/recipes")

      expect(response).to have_http_status :ok
      expect(assigns(:recipes)).to eq []
    end
  end

  describe "GET /show" do
    let(:recipe_id) { "best-recipe" }
    let(:recipe) do
      double(id: recipe_id, title: "tea", description: "with mint", fields: {}, photo: nil)
    end

    context "recipe exists" do
      before(:each) do
        allow(ms_service).to receive(:get_recipe).and_return(recipe)
        allow_any_instance_of(described_class).to receive(:ms_service).and_return(ms_service)
      end

      it do
        get("/recipes/#{recipe_id}")

        expect(response).to have_http_status :ok
        expect(assigns(:recipe)).to eq recipe
      end
    end

    context "recipe does not exist" do
      before(:each) do
        allow(ms_service).to receive(:get_recipe).and_return(nil)
        allow_any_instance_of(described_class).to receive(:ms_service).and_return(ms_service)
      end

      it do
        get("/recipes/#{recipe_id}")

        expect(response).to have_http_status :not_found
      end
    end

    context "modal view" do
      before(:each) do
        allow(ms_service).to receive(:get_recipe).and_return(recipe)
        allow_any_instance_of(described_class).to receive(:ms_service).and_return(ms_service)
      end

      it "includes modal body turbo_frame" do
        get("/recipes/#{recipe_id}?modal=true")

        expect(response).to have_http_status :ok
        expect(response.body).to include '<turbo-frame id="modal-body">'
      end

      it "does not include modal body turbo_frame" do
        get("/recipes/#{recipe_id}")

        expect(response).to have_http_status :ok
        expect(response.body).to_not include '<turbo-frame id="modal-body">'
      end
    end
  end
end
