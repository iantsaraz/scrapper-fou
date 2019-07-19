require 'rubygems'
require 'nokogiri'
require 'open-uri'

def origin
	puts "loading files......."
page = Nokogiri::HTML (open("https://coinmarketcap.com/all/views/all/"))
return page

end

	
def symbol_list(data)
	symbol_list_array = []
	symbol_list = data.xpath ('//*[@class="text-left col-symbol"]')
		for i in 0..symbol_list.length-1 do
			symbol_list_array << symbol_list[i].text
		end
		#puts symbol_list_array
	return symbol_list_array
end


def coins_list(data)
	coins_list_array = []
	coins_list = data.xpath ('//*[@class="price"]')
		for i in 0..coins_list.length-1 do
			coins_list_array << coins_list[i].text
		end
		#puts coins_list_array
	return coins_list_array
end

def result(symbol,coins)
	result =[]
	  for i in 0..symbol.length-1 do
	  	result << [{symbol[i] => coins[i]}]
	  end
	  puts result
	return result  	
end
def perform
dat = origin
symbol = symbol_list(dat)
coins = coins_list(dat)
result(symbol,coins)
end

perform
=begin	
def sortie (data)
	sortie = []
	for i in 0..data.lenght-1 do
		sortie << {data[i]}
	end
	return sortie
	

 #page.xpath('//*[@class="text-left col-symbol"]').each do |node|
#	  puts node.text
#	end
=end