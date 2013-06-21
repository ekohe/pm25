# PM25

[![Gem Version](https://badge.fury.io/rb/pm25.png)](http://badge.fury.io/rb/pm25)
[![Build Status](https://www.travis-ci.org/ekohe/pm25.png?branch=master)](https://www.travis-ci.org/ekohe/pm25)
[![Code Climate](https://codeclimate.com/github/ekohe/pm25.png)](https://codeclimate.com/github/ekohe/pm25)
[![Coverage Status](https://coveralls.io/repos/ekohe/pm25/badge.png)](https://coveralls.io/r/ekohe/pm25)

China PM2.5 and ozone readings Data From U.S. Consulate. Include below cities of China:

- Beijing
- Shanghai
- Chengdu
- Guangzhou
- Shenyang

Another gem about Air Quality Index of China available here [ChinaAqi][china_aqi], all monitoring stations in most cities of China are available, most AQI data are available, all the data is form China's official sector. Check it out!

## Installation

Add this line to your application's Gemfile:

    gem 'pm25'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pm25

## Usage

```ruby
# Beijing
PM25::Beijing.get
# => return an array include current and history data:
# [{"title"=>"06/04/2013 6:00:00 PM",
#   "link"=>"http://www.stateair.net/web/post/1/1.html",
#   "description"=>
#    "06-04-2013 18:00; PM2.5; 71.0; 159; Unhealthy (at 24-hour exposure at this level)",
#   "Param"=>"PM2.5",
#   "Conc"=>"71.0",
#   "AQI"=>"159",
#   "Desc"=>"Unhealthy (at 24-hour exposure at this level)",
#   "ReadingDateTime"=>"06/04/2013 6:00:00 PM"},
#  {"title"=>"06/04/2013 5:00:00 PM",
# ......

PM25::Beijing.all
# => return an array with all data, all value been parsed:
# [{"Conc"=>125.0,
#   "AQI"=>187,
#   "Desc"=>"Unhealthy (at 24-hour exposure at this level)",
#   "ReadingDateTime"=>Thu, 13 Jun 2013 12:00:00 +0000},
#  {"Conc"=>121.0,
#   "AQI"=>185,
#   "Desc"=>"Unhealthy (at 24-hour exposure at this level)",
#   "ReadingDateTime"=>Thu, 13 Jun 2013 11:00:00 +0000},
#  {"Conc"=>110.0,
#   "AQI"=>179,
#   "Desc"=>"Unhealthy (at 24-hour exposure at this level)",
#   "ReadingDateTime"=>Thu, 13 Jun 2013 10:00:00 +0000},
#  ......
#
# column types:
#   - 'Conc': float
#   - 'AQI': integer
#   - 'Desc': string
#   - 'ReadingDateTime': datetime

PM25::Beijing.last
# => return a hash with the latest data, all value been parsed:
# {"Conc"=>125.0,
#  "AQI"=>187,
#  "Desc"=>"Unhealthy (at 24-hour exposure at this level)",
#  "ReadingDateTime"=>Thu, 13 Jun 2013 12:00:00 +0000}


# Shanghai
PM25::Shanghai.get
PM25::Shanghai.all
PM25::Shanghai.last

# Chengdu
PM25::Chengdu.get
PM25::Chengdu.all
PM25::Chengdu.last

# Guangzhou
PM25::Guangzhou.get
PM25::Guangzhou.all
PM25::Guangzhou.last

# Shenyang
PM25::Shenyang.get
PM25::Shenyang.all
PM25::Shenyang.last
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

[china_aqi]: https://github.com/Xuhao/china_aqi
