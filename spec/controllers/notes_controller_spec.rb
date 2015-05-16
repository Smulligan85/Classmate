require 'rails_helper'

RSpec.describe NotesController, type: :controller do


  
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do 
      get :index
      expect(response).to be_success
    end
  end

  describe "POST #create" do 
    it "creates a new note object" do 
      post :create, note: note_params(:note)
      expect(Note.count).to eq(1)
    end
  end



end
