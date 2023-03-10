require 'rails_helper'

RSpec.describe StudentsController, type: :controller do
    describe "GET #index" do
        it "return a success response" do
            get :index
            expect(response).to be_successful
        end
    end
end