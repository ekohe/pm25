require 'httparty'
require 'active_support/core_ext/class/attribute'
require 'active_support/core_ext/hash/conversions'
module PM25
  class Base
    include HTTParty
    ATTRS = %w(Conc AQI Desc ReadingDateTime)
    class_attribute :base_uri, :city_id
    self.base_uri = URI::HTTP.build({host: 'www.stateair.net'})

    def self.get
      Hash.from_xml(HTTParty.get(url).body)['rss']['channel']['item']
    end

    def self.all
      get.select{|x| x.key? 'AQI'}.map(&method(:slice)).map(&method(:parse))
    end

    def self.last
      parse slice(get.find{|x| x.key? 'AQI'})
    end

    def self.uri
      raise NotImplementedError, "Please set value for 'city_id' class attributes in '#{self.name}' class." unless self.city_id
      self.base_uri.path = "/web/rss/1/#{self.city_id.to_s}.xml"
      self.base_uri
    end

    def self.url
      uri.to_s
    end

    def self.slice(data)
      data.slice(*ATTRS)
    end

    def self.parse(data)
      data['Conc'] = data['Conc'].to_f
      data['AQI'] = data['AQI'].to_i
      data['ReadingDateTime'] = DateTime.strptime(data['ReadingDateTime'], '%m/%d/%Y %I:%M:%S %p')
      data
    end
  end
end

require 'pm25/cities/beijing'
require 'pm25/cities/chengdu'
require 'pm25/cities/guangzhou'
require 'pm25/cities/shanghai'
require 'pm25/cities/shenyang'