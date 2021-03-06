require 'spec_helper'
require 'pm25/base'

shared_examples "city common examples" do |city_class, city_id|
  include_examples "helper methods", city_class
  context 'class attribute' do
    it "should has city_id equal to #{city_id}" do
      city_class.city_id.should_not be_nil
      city_class.city_id.should eq(city_id)
    end
  end

  context 'class methods' do
    it 'should return an array with pollution data from remote when call `get` method' do
      data = city_class.get
      data.should be_a(Array)
      data.any? {|measure| measure.key? 'AQI'}.should be_true
    end

    it 'should return an array with clean parsed data clice by ATTRS from remote when call `all` method' do
      data = city_class.all
      measure = data.first
      data.should be_a(Array)
      measure.keys.should eq(city_class::ATTRS)
      measure['Conc'].should be_a(Float)
      measure['AQI'].should be_a(Integer)
      measure['Desc'].should be_a(String)
      measure['ReadingDateTime'].should be_a(DateTime)
    end

    it 'should return the latest parsed data clice by ATTRS from remote when call `last` method' do
      city_class.stub(:get) {
         [{"title"=>"06/28/2013 11:00:00 AM", "description"=>"06-28-2013 11:00; PM2.5; 6.0; 25; Good (at 24-hour exposure at this level)", "Param"=>"PM2.5", "Conc"=>"6.0", "Desc"=>"Good (at 24-hour exposure at this level)", "ReadingDateTime"=>"06/28/2013 11:00:00 AM"},
          {"title"=>"06/28/2013 10:00:00 AM", "description"=>"06-28-2013 10:00; PM2.5; 12.0; 50; Good (at 24-hour exposure at this level)", "Param"=>"PM2.5", "Conc"=>"12.0", "AQI"=>"50", "Desc"=>"Good (at 24-hour exposure at this level)", "ReadingDateTime"=>"06/28/2013 10:00:00 AM"}
        ]
      }
      data = city_class.last
      data.should be_a(Hash)
      data.keys.should eq(city_class::ATTRS)
      data['Conc'].should be_a(Float)
      data['Conc'].should eq(12.0)
      data['AQI'].should be_a(Integer)
      data['AQI'].should eq(50)
      data['Desc'].should be_a(String)
      data['Desc'].should eq('Good (at 24-hour exposure at this level)')
      data['ReadingDateTime'].should be_a(DateTime)
      data['ReadingDateTime'].should eq(DateTime.strptime('06/28/2013 10:00:00 AM', '%m/%d/%Y %I:%M:%S %p'))
    end

    it 'should return URI::HTTP object own context when call `uri` method' do
      uri = city_class.uri
      uri.should be_a(URI::HTTP)
      uri.host.should eq('www.stateair.net')
      uri.path.should eq("/web/rss/1/#{city_id}.xml")
    end

    it 'should return url string with own context when call `url` method' do
      city_class.url.should be_a(String)
      city_class.url.should eq("http://www.stateair.net/web/rss/1/#{city_id}.xml")
    end
  end
end


describe PM25::Beijing do
  include_examples "city common examples", PM25::Beijing, '1'
end

describe PM25::Chengdu do
  include_examples "city common examples", PM25::Chengdu, '2'
end

describe PM25::Guangzhou do
  include_examples "city common examples", PM25::Guangzhou, '3'
end

describe PM25::Shanghai do
  include_examples "city common examples", PM25::Shanghai, '4'
end

describe PM25::Shenyang do
  include_examples "city common examples", PM25::Shenyang, '5'
end