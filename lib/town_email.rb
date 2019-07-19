require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'


def ville
	page = Nokogiri::HTML (open("http://annuaire-des-mairies.com/val-d-oise.html"))

    all_cities = []
	
    page.xpath('//*[@class="lientxt"]').each do |city| 
		all_cities << city.text
	end	
	puts all_cities
	return all_cities

end	


def lien
	    page = Nokogiri::HTML (open("http://annuaire-des-mairies.com/val-d-oise.html"))
  all_lien = []
  page.xpath('//*[contains(@href, "95")]').each do |link|
  	all_lien << link ['href']
  	end
  	return all_lien
 end
 

def check_email
	all_lien = lien
	
	all_lien.each do |mail|
		mail[0] = "http://annuaire-des-mairies.com"
	page1 = Nokogiri::HTML(open("#{mail}")) 
	a = page1.xpath ('/html/body/div/main/section[2]/div/table/tbody/tr[4]')
		
	end
	puts a.text
	return a.text
end
ville
check_email

