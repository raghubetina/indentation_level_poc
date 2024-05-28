require "rails_helper"

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/run_units", type: :request do
  # This should return the minimal set of attributes required to create a valid
  # RunUnit. As you add validations to RunUnit, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      RunUnit.create! valid_attributes
      get run_units_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      run_unit = RunUnit.create! valid_attributes
      get run_unit_url(run_unit)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_run_unit_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      run_unit = RunUnit.create! valid_attributes
      get edit_run_unit_url(run_unit)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new RunUnit" do
        expect {
          post run_units_url, params: {run_unit: valid_attributes}
        }.to change(RunUnit, :count).by(1)
      end

      it "redirects to the created run_unit" do
        post run_units_url, params: {run_unit: valid_attributes}
        expect(response).to redirect_to(run_unit_url(RunUnit.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new RunUnit" do
        expect {
          post run_units_url, params: {run_unit: invalid_attributes}
        }.to change(RunUnit, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post run_units_url, params: {run_unit: invalid_attributes}
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested run_unit" do
        run_unit = RunUnit.create! valid_attributes
        patch run_unit_url(run_unit), params: {run_unit: new_attributes}
        run_unit.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the run_unit" do
        run_unit = RunUnit.create! valid_attributes
        patch run_unit_url(run_unit), params: {run_unit: new_attributes}
        run_unit.reload
        expect(response).to redirect_to(run_unit_url(run_unit))
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        run_unit = RunUnit.create! valid_attributes
        patch run_unit_url(run_unit), params: {run_unit: invalid_attributes}
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested run_unit" do
      run_unit = RunUnit.create! valid_attributes
      expect {
        delete run_unit_url(run_unit)
      }.to change(RunUnit, :count).by(-1)
    end

    it "redirects to the run_units list" do
      run_unit = RunUnit.create! valid_attributes
      delete run_unit_url(run_unit)
      expect(response).to redirect_to(run_units_url)
    end
  end
end
