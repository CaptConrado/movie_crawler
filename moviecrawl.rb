require 'nokogiri'
require 'open-uri'



@content = []
# File.open("./zips.txt", "r").each_line do |line|
File.open("./samplezips.txt", "r").each_line do |line|
  @content.push(line)
end


zip_codes = @content 

# zip_codes = ['92126','90210','90401']
 
@vay = []
zip_codes.each do |codes| 
  yo = ''
  codes = codes.to_i;codes = codes.to_s
  zips  = "http://www.google.com/movies?near=" + codes
  puts zips
  doc   = Nokogiri::HTML(open(zips))
  yo    = doc.css('#movie_results .theater .name, a').text
  puts yo;  puts
  @vay.push(yo)
end


somefile = File.open("data.txt", "w")    
somefile.puts @vay 
somefile.close
