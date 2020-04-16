require 'pry'
require 'open-uri'
require 'rubygems'
require 'nokogiri'

#First: get the data

def doc
	Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
end

#Second: get the currency name

def crypto_name
	crypto_name_array = doc.xpath('//tr[*]/td[3]').collect(&:text) #put into texct
return crypto_name_array
end


#Third: get the currency price

def crypto_price
	crypto_price_array = doc.xpath('//tr[*]/td[5]').collect(&:text)
return crypto_price_array
end

#Fourth: reunite the both with an hash

def solution_big_hash
	solution_hash = Hash[crypto_name.zip(crypto_price)]
return solution_hash
end

#Fith: Lets mini hash everything

def proper_solution_w_mini_hash
	array_final = []
	solution_big_hash.each { |key_value| array_final << {key_value[0] => key_value[1]} }
	puts array_final
end

def perform
	proper_solution_w_mini_hash
end

perform