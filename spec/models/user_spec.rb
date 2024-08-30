require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid when user has name, email and password" do
    user = User.new(
      first_name: "John Doe",
      last_name: "Doe",
      email: "johndoe@test.com",
      password: "123456"
    )

    expect(user).to be_valid
  end

  it "is not valid when user has no first name" do
    user = User.new(
      first_name: nil,
      last_name: "Doe",
      email: "johndoe@test.com",
      password: "123456"
    )

    expect(user).to be_invalid
  end

  it "is not valid when user has no last name" do
    user = User.new(
      first_name: "John Doe",
      last_name: nil,
      email: "johndoe@test.com",
      password: "123456"
    )

    expect(user).to be_invalid
  end

  it "is not valid when user has no email" do
    user = User.new(
      first_name: "John Doe",
      last_name: "Doe",
      email: nil,
      password: "123456"
    )
    expect(user).to be_invalid
  end

  it "is not valid when user's email is not unique" do
    User.create(
      first_name: "John Doe",
      last_name: "Doe",
      email: "johndoe@test.com",
      password: "123456"
    )

    user = User.new(
      first_name: "John Doe Jr",
      last_name: "Doe",
      email: "johndoe@test.com",
      password: "123456"
    )

    user.valid?

    expect(user.errors[:email]).to include("has already been taken")
  end

  it "is not valid when user has no password" do
    user = User.new(
      first_name: "John Doe",
      last_name: "Doe",
      email: "johndoe@test.com",
      password: nil
    )

    expect(user).to be_invalide
  end
end
