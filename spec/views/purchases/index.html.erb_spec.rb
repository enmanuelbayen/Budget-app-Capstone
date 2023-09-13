require 'rails_helper'

RSpec.describe 'purchases/index.html.erb', type: :system do
  describe 'index page' do
    before(:each) do
      file = File.open(Rails.root.join('app', 'assets', 'images', 'planetbg.jpg'))
      @user = User.create(name: 'Enma', email: 'test@example.com', password: 'password', password_confirmation: 'password')
      @group = Group.create(name: 'Macdonald', icon: { io: file, filename: 'planetbg.jpg', content_type: 'image/jpeg' },
      author_id: @user.id)
      @purchase = Purchase.create(name: 'burger', amount: 100, author_id: @user.id)
      @group.purchases << @purchase
      sign_in @user
      visit group_purchases_path(@group.id)
    end

    it 'displays the categories' do
      expect(page).to have_content('Macdonald')
    end

    it 'displays the total payment for the group' do
      expect(page).to have_content('$100.0')
    end
    
    it 'displays the purchases for the group' do
      expect(page).to have_content('burger')
      expect(page).to have_content('$100')
    end

    it 'displays the new category form' do
      expect(page).to have_link('New Transaction', href: new_group_purchase_path(@group))
    end

  end
end
