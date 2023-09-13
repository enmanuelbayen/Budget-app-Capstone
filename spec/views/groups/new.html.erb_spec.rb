require 'rails_helper'

RSpec.describe 'groups/new.html.erb', type: :system do
  describe 'new page' do
    before(:each) do
      file = File.open(Rails.root.join('app', 'assets', 'images', 'planetbg.jpg'))
      @user = User.create(name: 'Enma', email: 'test@example.com', password: 'password', password_confirmation: 'password')
      @group = Group.create(name: 'Macdonald', icon: { io: file, filename: 'planetbg.jpg', content_type: 'image/jpeg' },
      author_id: @user.id)
      sign_in @user
      visit new_group_path
    end

    it 'displays the page title' do
      expect(page).to have_content('ADD CATEGORY')
    end

    it 'displays the navigation bar' do
      expect(page).to have_link('Search')
    end

    it 'displays the category name input field' do
      expect(page).to have_field('Name')
    end

    it 'displays the icon URL input field' do
      expect(page).to have_field('Icon')
    end

    it 'displays the save category button' do
      expect(page).to have_button('Create Category')
    end
  end
end
