require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) {
    User.create(provider: provider, uid: uid, name: name)
  }
  let(:provider) { 'github' }
  let(:uid) { '1234567890' }
  let(:name) { 'Ed' }

  it { expect(user).to be_valid }

  context "with no provider" do
    let(:provider) { nil }
    it { expect(user).to be_invalid }
  end
end
