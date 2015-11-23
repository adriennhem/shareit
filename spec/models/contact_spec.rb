require 'rails_helper'

RSpec.describe Contact, type: :model do
  
  it "is invalid without name" do
  	contact = Contact.new(
  		name: nil,
  		email: 'adrien.nhem@gmail.com',
  		message: 'hello world',
  		nickname: true)
  	contact.valid?
  	expect(contact.errors[:name]).to include("can't be blank")
  end

    it "is valid with name" do
  	contact = Contact.new(
  		name: 'adrien',
  		email: 'adrien.nhem@gmail.com',
  		message: 'hello world',
  		nickname: true)
  	contact.valid?
  	expect(contact).to be_valid
  end

    it "is invalid without email" do
  	contact = Contact.new(
  		name: 'adrien',
  		email: nil,
  		message: 'hello world',
  		nickname: true)
  	contact.valid?
  	expect(contact.errors[:email]).to include("can't be blank")
  end

   it "is invalid without message" do
  	contact = Contact.new(
  		name: 'adrien',
  		email: 'adrien@gmail.com',
  		message: nil,
  		nickname: true)
  	contact.valid?
  	expect(contact.errors[:message]).to include("can't be blank")
  end
end
