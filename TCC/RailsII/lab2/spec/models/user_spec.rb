require 'spec_helper'

describe User do
  
  describe "#is_admin?" do
    it "returns false for the user role" do
      role = Factory(:role, name: 'user')
      user = Factory(:user, role: role)
      user.is_admin?.should be_false
    end

    it "returns false for the moderator role" do
      role = Factory(:role, name: 'moderator')
      user = Factory(:user, role: role)
      user.is_admin?.should be_false
    end

    it "returns false for any non-admin role" do
      role = Factory(:role, name: 'non-admin')
      user = Factory(:user, role: role)
      user.is_admin?.should be_false
    end

    it "returns true if the user has the admin role" do
      role = Factory(:role, name: 'admin')
      user = Factory(:user, role: role)
      user.is_admin?.should be_true
    end
  end
end
