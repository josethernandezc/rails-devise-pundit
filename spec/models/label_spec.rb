require 'rails_helper'

RSpec.describe Label, type: :model do
  subject { FactoryGirl.build(:blue) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:colour) }
  it { should validate_uniqueness_of(:name).scoped_to(:colour).with_message('has already been taken with that colour') }
  it { should validate_inclusion_of(:colour).in_array(COLOURS['standard']) }
  it { should have_and_belong_to_many(:users) }
end
