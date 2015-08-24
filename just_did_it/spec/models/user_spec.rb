require 'rails_helper'

RSpec.describe User, type: :model do
    let(:user) { User.new(first_name: 'Mary', last_name: 'Clark', handle: 'emcee',
                           email: 'mary@test.com', password_digest: '123456') }


  context "valid user" do
    
    it "returns all attributes" do
    expect(user.full_name).to eq('Mary Clark')
    expect(user.handle).to eq('emcee')
    expect(user.email).to eq('mary@test.com')
    expect(user.password_digest).to eq('123456')
    end

    it "is a valid user object" do
      expect(user.valid?).to eq(true)
    end
  end

  # it "has a working #admin? method" do
  #   expect(admin.admin?).to be(true)
  #   expect(user.admin?).to be(false)
  #   expect(owner.admin?).to be(false)
  # end
end
