require 'rails_helper'
RSpec.describe User, type: :model do
  before(:each) do
    @user = User.create!(name: 'user', email: 'user@m')
  end

  describe 'Associations' do
    it { should have_many(:articles) }
    it { should have_many(:votes) }
  end
end
