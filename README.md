# PM25

[![Build Status](https://www.travis-ci.org/ekohe/pm25.png?branch=master)](https://www.travis-ci.org/ekohe/pm25)
[![Code Climate](https://codeclimate.com/github/ekohe/pm25.png)](https://codeclimate.com/github/ekohe/pm25)

PM2.5 and ozone readings Data From U.S. Consulate.

Include below cities of China:

- Beijing
- Shanghai
- Chengdu
- Guangzhou
- Shenyang

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

PM25::Beijing.latest
# => return a hash with the latest data, all value was parsed:
# {"Conc"=>162.0,
#  "AQI"=>212,
#  "Desc"=>"Very Unhealthy (at 24-hour exposure at this level)",
#  "ReadingDateTime"=>Sat, 06 Jul 2013 17:00:00 +0000}
#  "ReadingDateTime"=>"06/07/2013 5:00:00 PM"}
#
# column types:
#   - 'Conc': float
#   - 'AQI': integer
#   - 'Desc': string
#   - 'ReadingDateTime': datetime

# Shanghai
PM25::Shanghai.get
PM25::Shanghai.latest

# Chengdu
PM25::Chengdu.get
PM25::Chengdu.latest

# Guangzhou
PM25::Guangzhou.get
PM25::Guangzhou.latest

# Shenyang
PM25::Shenyang.get
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
