require 'rails_helper'

RSpec.describe 'purchases/new.html.erb', type: :system do
  describe 'new page' do
    before(:each) do
      file = File.open(Rails.root.join('app', 'assets', 'images', 'planetbg.jpg'))
      @user = User.create(name: 'Enma', email: 'test@example.com', password: 'password', password_confirmation: 'password')
      @group = Group.create(name: 'Macdonald', icon: { io: file, filename: 'planetbg.jpg', content_type: 'image/jpeg' },
      author_id: @user.id)
      @purchase = Purchase.create(name: 'burger', amount: 100, author_id: @user.id)
      @group.purchases << @purchase
      sign_in @user
      visit new_group_purchase_path(@group.id)
    end

    it 'displays the page title' do
      expect(page).to have_content('TRANSACTION')
    end

    it 'displays the navigation bar' do
      expect(page).to have_link('Search')
    end

    it 'displays the transaction name input field' do
      expect(page).to have_field('Transaction name')
    end

    it 'displays the amount input field' do
      expect(page).to have_field('Pay amount')
    end

    it 'displays the group checkboxes' do
      expect(page).to have_content('Group')
      expect(page).to have_selector('input[type="checkbox"]')
    end

    it 'displays the create transaction button' do
      expect(page).to have_button('Create Transaction')
    end
  end
end
