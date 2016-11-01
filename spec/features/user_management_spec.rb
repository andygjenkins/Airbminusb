require 'spec_helper'

feature 'A user can sign in' do

  let!(:user) do
    User.create(first_name: "David", surname: "Davidson", email: "daviddavidson@david.com", password: "david", password_confirmation: "david")
  end

  scenario 'with correct email and password' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content("Welcome #{user.first_name}")
  end
end

# feature 'A user can sign out' do
#
#   let!(:user) do
#     User.create(first_name: "David", surname: "Davidson", email: "daviddavidson@david.com", password: "david", password_confirmation: "david")
#   end
#
#   scenario 'User signs out' do
#     sign_in(email: user.email, password: user.password)
#     click_link('Sign Out')
#     expect(current_path).to eq '/sign_in'
#     expect(page).not_to have_content("Welcome David")
#
#   end
#
# end
