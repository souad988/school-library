module Utils
  def self.data(attributes)
    data = {}
    attributes.each do |item|
      print "#{item} :"
      data[item] = gets.chomp
    end
    data
  end
end
