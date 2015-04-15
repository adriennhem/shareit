require 'rails_helper'

RSpec.describe User, :type => :model do
  it "is valid with email firstname lastname and password" do
  	user = User.new(
  		first_name: 'Adrien',
  		last_name: 'Nhem',
  		email: 'adrien.nhem@gmail.com',
  		password: 'adriennhem')
  	expect(user).to be_valid
  end

  it "is invalid without a first_name" do
  	user = User.new(first_name: nil)
  	user.valid?
  	expect(user.errors[:first_name]).to include("can't be blank")
  end 

  it "is invalid without a last_name" do
  	user = User.new(last_name: nil)
  	user.valid?
  	expect(user.errors[:last_name]).to include("can't be blank")
  end

  it "is invalid with a duplicate email" do
  	User.create(first_name: 'Adrien',
					  		last_name: 'Nhem',
					  		password: 'adriennhem',
					  		email: 'adrien.nhem@gmail.com')

		user = User.new(first_name: 'Adrien',
										last_name: 'nhem',
										password: 'adriennhem',
										email: 'adrien.nhem@gmail.com') 
		user.valid?
		expect(user.errors[:email]).to include("has already been taken")
  end 

  it "returns full name as a string" do
  	user = User.new(first_name: 'Adrien',
							  		last_name: 'Nhem',
							  		password: 'adriennhem',
							  		email: 'adrien.nhem@gmail.com')
  	expect(user.fullname).to eq 'Adrien Nhem'
  end


end

