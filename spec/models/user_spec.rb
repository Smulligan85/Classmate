require 'rails_helper'

RSpec.describe User, type: :model do

  it "is valid with name, email and password" do 
    user = User.new(
      name: "Foobar Bar",
      email: "foobar@example.com",
      password: "helloworld")
    expect(user).to be_valid
  end

  it "is invalid without an email" do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "is invalid without an password" do
    user = User.new(password: nil)
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
 end

 it "is invalid with duplicate email" do
    User.create(
      name: "Foobar Bar",
      email: "foobar@example.com",
      password: "helloworld")

    user = User.new(
      name: "Smith Bar",
      email: "foobar@example.com",
      password: "helloworld")

    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end
end
