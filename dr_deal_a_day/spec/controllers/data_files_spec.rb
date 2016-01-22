require 'rails_helper'

RSpec.describe DataFilesController, type: :controller do
  describe "Not Authorized" do
    describe "GET #index" do
      it "shows the orders" do
        get :index, {}, {}
        expect( flash[ :alert ] ).to eq "Not authorized"
      end
    end

    describe "GET #new" do
      it "accepts a file to upload" do
        get :new, {}, {}
        expect( flash[ :alert ] ).to eq "Not authorized"
      end
    end

    describe "POST #create" do
      it "imports a data file" do
        post :create, "file"
        expect( flash[ :alert ] ).to eq "Not authorized"
      end
    end
  end
end
