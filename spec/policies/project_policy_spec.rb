require "rails_helper"

describe ProjectPolicy do

  permissions :new? do
    it "denies access to students" do
      expect(subject).not_to permit(User.new(:role => "student"), Project.new)
    end
  end
end