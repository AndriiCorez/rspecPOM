require 'rspec'
require 'selenium-webdriver'
require_relative '../pages/HomePage.rb'

describe 'Signin form testing (POM)' do 

	gmail = nil

	before(:each)do
		gmail = BasePage.new(Selenium::WebDriver.for:chrome)
	end

	after(:each)do
		gmail.quit
	end

	it 'opens gmail and sends incorrect credentials to get error message' do
		error_msg = gmail
					.getRootPage
					.click_signin
					.send_keys_email('abc')
					.click_next_btn
					.get_email_error_message_elem
		sleep 1
		expect(error_msg.text).to be == "Sorry, Google doesn't recognize that email."
	end

end