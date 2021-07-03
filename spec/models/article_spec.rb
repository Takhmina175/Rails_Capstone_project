require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'has_many associations' do
    it { should have_many(:votes) }
    it { should have_many(:articles_category_lists) }
    it { should have_many(:categories).through(:articles_category_lists).with_foreign_key(:event_user_id) }
    it { should belong_to(:author).class_name(:User) }
    it { should have_one_attached(:image) }
  end
  describe 'Validates username and email' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:image) }
    it { should validate_presence_of(:content) }
  end
end
