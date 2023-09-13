require './spec/rails_helper'

RSpec.describe 'groups/index.html.erb', type: :system, js: true do
  describe 'Index page' do
    before(:each) do
      file = File.open(Rails.root.join('app', 'assets', 'images', 'planetbg.jpg'))
      @user = User.create(name: 'test', email: 'test@example.com', password: 'password', password_confirmation: 'password')
      @group = Group.create(name: 'Macdonald', icon: { io: file, filename: 'planetbg.jpg', content_type: 'image/jpeg' },
      author_id: @user.id)
      sign_in @user
      visit groups_path
    end

    it 'displays the groups' do
      expect(page).to have_content('Macdonald')
    end

    it 'links to the group show page' do
      click_link 'Macdonald'
      expect(page).to have_content('TRANSACTION')
    end

    it 'displays the total purchases for each group' do
      expect(page).to have_content('$0')
    end

    it 'displays the "NEW CATEGORY" button' do
      expect(page).to have_link('New Category', href: new_group_path)
    end

    it 'does not display the splash screen' do
      expect(page).to_not have_content('Welcome to the app!')
    end
  end
end
