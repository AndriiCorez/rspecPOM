require 'rspec'
require 'selenium-webdriver'

describe 'Signin form testing' do 

	before(:each)do
		@driver = Selenium::WebDriver.for:chrome
		@driver.manage.window.maximize
		@driver.manage.timeouts.implicit_wait = 20
		@wait = Selenium::WebDriver::Wait.new(:timeout => 20)
	end

	after(:each) do
		@driver.quit
	end

	it 'opens gmail and sends incorrect credentials to get error message' do
		
		@driver.get 'https://www.google.com/gmail/about/'
		@driver.find_element(:xpath, '//nav/div/a[2]').click
		@driver.find_element(:id, 'Email').send_keys "abc"
		@driver.find_element(:id, 'next').click
		
		error_msg = @wait.until { @driver.find_element(:id => 'errormsg_0_Email') }
		sleep 1
		expect(error_msg.text).to be == "Sorry, Google doesn't recognize that email."
		
end
end


