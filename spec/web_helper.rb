def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email, with: 'joe@email.com'
  fill_in :password, with: 'abc123'
  click_button 'Sign up'
end
