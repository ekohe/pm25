require 'spec_helper'

describe PM25 do
  it 'should have a version number' do
    PM25::VERSION.should_not be_nil
  end
end
