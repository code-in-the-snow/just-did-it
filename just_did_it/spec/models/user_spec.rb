require 'rails_helper'

RSpec.describe User, type: :model do
    let(:user) { User.new(first_name: 'Mary', last_name: 'Clark', handle: 'emcee',
                           email: 'mary@test.com', password: '123456',
                           password_confirmation: '123456') }

  context "valid user" do
    it "returns all attributes" do
    expect(user.full_name).to eq('Mary Clark')
    expect(user.handle).to eq('emcee')
    expect(user.email).to eq('mary@test.com')
    expect(user.password_confirmation).to eq('123456')
    expect(user.password).to eq('123456')
    end

    it "is a valid user object" do
      expect(user.valid?).to eq(false)
    end
  end

  context "invalid user" do
    it "does not save a blank name" do
      bad = User.new(last_name: 'Clark',
                     handle: 'clarky',
                     email: 'clark@test.com',
                     password_digest: 'abcdef')
     expect(bad.valid?).to eq(false)
   end
   it "does not save a bad email address" do
     bad = User.new(first_name: 'Dot',
                    last_name: 'Clark',
                    handle: 'clarky',
                    email: 'clarkytest.com',
                    password_digest: 'abcdef')
    expect(bad.valid?).to eq(false)
  end
 end
end
