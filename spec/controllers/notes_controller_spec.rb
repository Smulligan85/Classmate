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
      Note.create(
        title: "Example title",
        body: "Example body text"
        )
      expect(Note.count).to eq(1)
    end
  end

  describe "PATCH #update" do
    it "updates a note object" do
      note = Note.create(
        title: "Example title",
        body: "Example body text"
        )
      note.update_attributes(title: "Update title")
      expect(note[:title]).to include("Update title")
    end
  end



end
