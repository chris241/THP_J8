require 'nokogiri'
require 'pry'
require 'open-uri'


def return_crypto
  array_all = get_all
  combination(array_all[0], array_all[1])
end

def get_all # Get all the symbols and prices into an array
  page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
    symbol = page.xpath("//td[3]")
    price = page.xpath("//td[5]")
    [symbol, price] # return an array of two arrays
end

def combination(array_symbols, array_prices)
  array_output = Array.new
  hash_each = Hash.new
  array_symbols.length.times do |i|
    hash_each = {array_symbols[i].text => array_prices[i].text.strip[1..-1].to_f}
    array_output << hash_each
  end
  array_output
end

# puts return_crypto
