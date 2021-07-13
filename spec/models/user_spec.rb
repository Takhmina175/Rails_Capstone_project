require 'rails_helper'
RSpec.describe User, type: :model do
  before(:each) do
    @user = User.create!(username: 'user', email: 'user@m')
  end
  describe 'Validates username and email' do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_length_of(:username), in: 2..8 }
    it { should validate_uniqueness_of(:username).case_insensitive }
  end

  describe 'Input format for email' do
    it 'invalidate emails that do not fit the specified format' do
      invalid_emails = %w[user@ user.mail @.mail]
      invalid_emails.each do |inv_email|
        @user.email = inv_email
        expect(@user).to be_invalid
      end
    end
  end

  describe 'Input format for username' do
    it 'invalidate username that do not fit the specified format' do
      invalid_username = %w[_mina mina$$ _*7]
      invalid_username.each do |inv_name|
        @user.username = inv_name
        expect(@user).to be_invalid
      end
    end
  end

  describe 'Associations' do
    it { should have_many(:articles) }
    it { should have_many(:votes) }
  end
end
