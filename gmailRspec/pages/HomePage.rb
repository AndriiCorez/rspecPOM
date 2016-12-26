require 'selenium-webdriver'
require_relative '../pages/BasePage.rb'
require_relative '../pages/EmailPage.rb'


class HomePage < BasePage

	def initialize(driver)
		super(driver)
	end

	def click_signin
		@driver.find_element(:xpath, '//nav/div/a[2]').click
		return EmailPage.new(@driver)
	end

end