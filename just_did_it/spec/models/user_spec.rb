require 'rails_helper'

RSpec.describe User, type: :model do
    let(:owner) { FactoryGirl.create(:user) }
    let(:workspace) { FactoryGirl.create(:workspace, user_id: owner.id) }
    let(:admin) { FactoryGirl.create(:user, role: "admin") }
    let(:user) { FactoryGirl.create(:user) }

  it "has a working factory" do
    expect(user).to be_a(User)
  end

  it "has a working #admin? method" do
    expect(admin.admin?).to be(true)
    expect(user.admin?).to be(false)
    expect(owner.admin?).to be(false)
  end
end
