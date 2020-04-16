require 'pry'
require 'open-uri'
require 'rubygems'
require 'nokogiri'

#Methode 1: get_townhall_email(townhall_url) qui récupère l’e-mail d'une mairie à partir de l'URL de mairies

def get_townhall_email(townhall_url)
  liste_town = []
  townhall_url.each do |townhall_url|
    hash = {}
    doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/#{townhall_url[1..-1]}")) 
      hash[:name] = doc.xpath('/html/body/div/main/section[1]/div/div/div/h1').text 
      hash[:email] =  doc.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
      liste_town << hash
    end
  return liste_town
end

#Methode 2: get_townhall_urls qui récupère les URLs de chaque ville du Val d'Oise.

def get_townhall_urls
  links_url = []
  doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
    doc.xpath('//a[@class ="lientxt"]').each do |node|
    links_url << node['href']
  end
  return links_url
end

#On réunit

def perform
 puts solution = get_townhall_email(get_townhall_urls)
end

perform