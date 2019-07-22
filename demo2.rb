
require 'nokogiri'
require 'open-uri'
require 'pry'
require 'open-uri'
require 'CSV'
array_of_arrays = CSV.read("./urls.csv", {col_sep: ";"})
def select_first_array_elem(array)
  	array.reduce([]) do |result, elem|
    result << elem.first
  end
end
def analyse_url(url)
  data  = Nokogiri::HTML(open(url))
  title = data.xpath("//title").text
  title
end
def scraping_each_url(array)
  result = []
  array.each do |url|
    result << analyse_url(url)
  end
  result
end
array1  = select_first_array_elem(array_of_arrays)
results = scraping_each_url(array1)

puts "#{results}"