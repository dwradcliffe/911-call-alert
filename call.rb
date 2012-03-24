class Call
  
  attr_reader :date, :time, :id, :lat, :lng, :desc, :dept, :address
  
  def initialize(data)
    data.each do |key,value|
      instance_variable_set("@#{key}", value)
    end
  end
  
  def self.parse(node)
    Call.new({
      :date => node['date'],
      :time => node['time'],
      :id => node['xnum'],
      :lat => node['lat'],
      :lng => node['lng'],
      :desc => node['desc'],
      :dept => node['dept'],
      :address => node['address']
    })
  end
  
  def since?(time)
    Time.parse("#{@date} #{@time}") > time
  end
  
  def to_s
    "#{@dept}:  #{@time}   #{@desc}   #{@address}   #{map_link}"
  end
  
  def map_link
    "http://maps.google.com/maps?q=#{@address.gsub(" ","+")}@#{@lat},#{@lng}"
  end
  
end