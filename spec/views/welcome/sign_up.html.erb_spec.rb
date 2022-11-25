require 'spec_helper'

feature 'Sign up' do
  scenario 'via email' do
    visit sign_up_path
    expect(page).to have_content("email")
  end
end