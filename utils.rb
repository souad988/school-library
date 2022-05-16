module Utils

  def self.data (attributes)
    data = {}
    attributes.each{|item| 
               print "#{item} :"
               data[item] = gets.chomp 
    }
    data
  end
end
