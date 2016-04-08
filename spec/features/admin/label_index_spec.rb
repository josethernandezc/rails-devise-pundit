include Warden::Test::Helpers
Warden.test_mode!

# Feature: Label index page
#   As an admin
#   I want to see a list of labels
#   So I can see their data
feature 'Label index page', :devise do

  after(:each) do
    Warden.test_reset!
  end

  # Scenario: Labels listed on index page
  #   Given admin is signed in
  #   When admin visits the label index page
  #   Then I see all labels
  scenario "labels listed on index page" do
    admin = FactoryGirl.create(:user, :admin)
    label = FactoryGirl.create(:blue)
    login_as(admin, :scope => :user)
    visit labels_path
    expect(page).to have_content label.name
  end

  # Scenario: User cannot see labels index page
  #   Given I am signed in
  #   When I visit the label index page
  #   Then I see an 'access denied' message
  scenario "user cannot see labels index page" do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit labels_path
    expect(page).to have_content 'Access denied.'
  end
end
