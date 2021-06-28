require 'rails_helper'
RSpec.describe User, type: :model do
  before(:each) do
    @user = User.create!(username: 'user', email: 'user@m')
  end
  describe 'Validates username and email' do 
    it { should validate_presence_of(:username)}
    it { should validate_presence_of(:email)}
    it { should validate_uniqueness_of(:email)}
    it { should validate_length_of(:username), in: 2..8}
    it { should validate_uniqueness_of(:username).case_insensitive}
    it { expect_to_be_invalid('')}
   

  end

  describe 'Associations' do
    it { should have_many(:articles) }
    it { should have_many(:votes) }
  end
end
