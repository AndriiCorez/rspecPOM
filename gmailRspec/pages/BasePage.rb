require 'selenium-webdriver'
require_relative '../pages/HomePage.rb'

class BasePage
	
	@driver = nil

	def initialize(driver)
		@driver = driver
	end

	def getRootPage
		@driver.get 'https://www.google.com/gmail/about/'
		return HomePage.new(@driver)
	end

	def quit
		@driver.quit
	end

	def getPageTitle
		return @driver.title
	end 
end