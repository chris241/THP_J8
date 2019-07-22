#! /usr/bin/env ruby

require 'nokogiri'
require 'open-uri'

def  isol_symbole 
# Fetch and parse HTML document
doc = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))
symbole = doc.xpath("//*[@class='text-left col-symbol']").text
price = doc.xpath("//*[@class='price']").text
crypto_nameS = []
crypto_nameS += [symbole,price]

return puts "#{crypto_nameS}"
end
isol_symbole
def perform
 	isol_symbole(symbole,price)
	crypto_name_array(crypto_nameS)
end