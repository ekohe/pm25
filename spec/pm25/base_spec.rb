require 'spec_helper'
require 'pm25/base'

describe PM25::Base  do
  shared_examples "raise NotImplementedError" do |class_method_name|
    it "should raise NotImplementedError when call #{class_method_name} class method" do
      expect { PM25::Base.__send__ class_method_name }.to raise_error(NotImplementedError, "Please set value for 'city_id' class attributes in 'PM25::Base' class.")
    end
  end

  shared_examples 'helper methods' do |_class|
    let(:hash_a) do
      {"Conc" => '125.0', "AQI" => '187', "Desc" => "Unhealthy (at 24-hour exposure at this level)", "ReadingDateTime" => "06/04/2013 6:00:00 PM", 'a' => 'a value', 'b' => 'b value'}
    end

    it 'should slice a hash with ATTRS when call `slice` method' do
      hash_b = _class.slice(hash_a)
      hash_b.should be_a(Hash)
      _class::ATTRS.all?{|x| hash_b.key?(x)}.should eq(true)
      hash_b.key?('a').should eq(false)
      hash_b.key?('b').should eq(false)
    end

    it 'should parse hash values to ruby data type when call `parse` method' do
      hash_b = _class.parse(hash_a)
      hash_b.should be_a(Hash)
      hash_b.key?('a').should eq(false)
      hash_b.key?('b').should eq(false)

      hash_b['Conc'].should be_a(Float)
      hash_b['Conc'].should eq(125.0)
      hash_b['AQI'].should be_a(Integer)
      hash_b['AQI'].should eq(187)
      hash_b['ReadingDateTime'].should be_a(DateTime)
      hash_b['ReadingDateTime'].should eq(DateTime.strptime(hash_a['ReadingDateTime'], '%m/%d/%Y %I:%M:%S %p'))
    end

    it 'should slice and parse a hash when call `clean_up` method' do
      hash_b = _class.clean_up(hash_a)
      hash_b.should be_a(Hash)
      _class::ATTRS.all?{|x| hash_b.key?(x)}.should eq(true)
      hash_b.key?('a').should eq(false)
      hash_b.key?('b').should eq(false)

      hash_b['Conc'].should be_a(Float)
      hash_b['Conc'].should eq(125.0)
      hash_b['AQI'].should be_a(Integer)
      hash_b['AQI'].should eq(187)
      hash_b['ReadingDateTime'].should be_a(DateTime)
      hash_b['ReadingDateTime'].should eq(DateTime.strptime(hash_a['ReadingDateTime'], '%m/%d/%Y %I:%M:%S %p'))
    end
  end

  context 'Class attributes and constant' do
    it 'should have constant ATTRS with array values' do
      PM25::Base::ATTRS.should eq(%w(Conc AQI Desc ReadingDateTime))
    end

    it 'should not have city_id' do
      PM25::Base.city_id.should be_nil
    end

    it 'should have base_uri with host "ww.stateair.net"' do
      PM25::Base.base_uri.should be_a(URI::HTTP)
      PM25::Base.base_uri.host.should eq('www.stateair.net')
    end
  end

  context 'Class methods' do
    include_examples "raise NotImplementedError", 'uri'
    include_examples "raise NotImplementedError", 'get'
    include_examples "raise NotImplementedError", 'all'
    include_examples "raise NotImplementedError", 'last'
    include_examples "raise NotImplementedError", 'url'

    include_examples "helper methods", PM25::Base
  end
end