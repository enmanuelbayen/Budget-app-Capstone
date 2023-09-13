require './spec/rails_helper'

RSpec.describe Group, type: :model do
  let!(:user) do 
    User.create(name: 'Enma', email: 'ej@gmail', password: '123456', password_confirmation: '123456')
  end

  subject { Group.new(name: 'Macdonald', author_id: user.id) }

  it 'should have the name present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should have a maximum name length of 250 characters' do
    subject.name = 'x' * 251
    expect(subject).to_not be_valid
  end

  it 'should have the icon present' do
    subject.icon = nil
    expect(subject).to_not be_valid
  end

  context 'Associations' do
    it 'should belong to a user' do
      association = subject.class.reflect_on_association(:author)
      expect(association.macro).to eq(:belongs_to)
      expect(association.class_name).to eq('User')
    end

    it 'should have many to many purchases' do
      association = subject.class.reflect_on_association(:purchases)
      expect(association.macro).to eq(:has_and_belongs_to_many)
      expect(association.options[:dependent]).to eq(:destroy)
    end
  end
end
