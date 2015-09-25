require 'rails_helper'

RSpec.describe User, :type => :model do
  it "is valid with email firstname lastname and password" do
  	user = User.new(
  		first_name: 'Adrien',
  		last_name: 'Nhem',
  		email: 'adrien.nhem@grenoble-em.com',
  		password: 'adriennhem',
      role: 'student')
  	expect(user).to be_valid
  end

  it "is valid without a first_name" do
  	user = User.new(
      first_name: nil,
      last_name: 'Nhem',
      email: 'adrien.nhem@grenoble-em.com',
      password: 'adriennhem',
      role: 'student')
  	user.valid?
  	expect(user).to be_valid
  end 

   it "student" do
    user = User.new(
      first_name: nil,
      last_name: 'Nhem',
      email: 'adrien.nhem@grenoble-em.com',
      password: 'adriennhem',
      role: 'student')
    user.valid?
    expect(user).to be_valid
  end

  it "is valid without a last_name" do
  	user = User.new(
      first_name: 'Adrien',
      last_name: nil,
      email: 'adrien.nhem@grenoble-em.com',
      password: 'adriennhem')
  	user.valid?
  	expect(user).to be_valid
  end
  

end

