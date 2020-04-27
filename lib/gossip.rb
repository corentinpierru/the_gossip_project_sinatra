require 'csv'
require 'pry'
class Gossip
  attr_accessor :author, :content

  def initialize (auteur, contenu)
    @author = auteur
    @content = contenu
  end 
  
  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [@author, @content]
    end 
  end #end of method save

  def self.all
    all_gossips = []
    CSV.read("./db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    return all_gossips
  end

  def self.find(id)
    gossip = []
    table = CSV.table("db/gossip.csv", headers: false)
    gossip = table[id.to_i]
    return table[id.to_i]
 end

end #end of class Gossip
