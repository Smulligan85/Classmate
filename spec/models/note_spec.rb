require 'rails_helper'

RSpec.describe Note, type: :model do
  it "is valid with title and body" do
    note = Note.new(
      title: "Example Title",
      body: "Example Body Text")
    expect(note).to be_valid
  end

  it "is invalid without a title" do
    note = Note.new(title: nil)
    note.valid?
    expect(note.errors.messages[:title]).to include("can't be blank")
  end

  it "is invalid without a body" do
    note = Note.new(body: nil)
    note.valid?
    expect(note.errors.messages[:body]).to include("can't be blank")
  end
end
