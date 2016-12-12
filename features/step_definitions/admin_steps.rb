# -*- coding: utf-8 -*-
Given(/^that user "([^"]*)" with password "([^"]*)" has logged in$/) do |arg1, arg2|
   user = User.create!(surname: 'Loftus',
                                firstname: 'Chris',
                                email: 'cwl@aber.ac.uk',
                                phone: '01970 622422',
                                grad_year: 1985)
  UserDetail.create!(login: arg1,
                     password: arg2,
                     user: user)
  visit "/session/new?" 
  fill_in("login", :with => arg1) 
  fill_in("password", :with => arg2) 
  click_button("Login")
  age.should have_selector 'flash_message', content: 'Logged in successfully'
end

When(/^the admin user broadcasts "([^"]*)" to the notification feed$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^the current page should contain the text: "([^"]*)"$/) do |arg1|
  page.should have_selector 'flash_message', content: arg1
end

Then(/^the current page should show the text "([^"]*)" in the notification feed$/) do |arg1|
  page.should have_content arg1
end
