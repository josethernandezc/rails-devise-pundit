include Warden::Test::Helpers
Warden.test_mode!

# Feature: User labels
#   As an admin
#   I want to visit another user's profile page
#   So I can edit their labels
feature 'User labels', :devise do

  after(:each) do
    Warden.test_reset!
  end

  # Scenario: Admin labels another user
  #   Given admin is signed in
  #   When admin visits another user's profile
  #   Then I see a 'labels updated' message
  scenario "admin labels another user" do
    admin = FactoryGirl.create(:user, :admin)
    other = FactoryGirl.create(:user, email: 'other@example.com')
    label = FactoryGirl.create(:blue)
    login_as(admin, :scope => :user)
    visit user_path(other)
    select 'blue', from: 'user[label_ids][]'
    click_button 'Update User'
    expect(page).to have_content 'Labels updated.'
  end
end
