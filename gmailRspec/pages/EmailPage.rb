require 'selenium-webdriver'
require_relative '../pages/BasePage.rb'

class EmailPage < BasePage

	def initialize(driver)
		super(driver)
	end

	def send_keys_email(keys)
		@driver.find_element(:id, 'Email').send_keys keys
		return self
	end

	def click_next_btn
		@driver.find_element(:id, 'next').click
		return self
	end

	def get_email_error_message_elem
		return @driver.find_element(:id => 'errormsg_0_Email')
	end



end
