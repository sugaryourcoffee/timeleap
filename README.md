# syc-timeleap

Creates dynamically date methods to jump through time

## Usage

    require 'syctimeleap/time_leap.rb'

    time_leap = SycTimeleap::TimeLeap.new
    time_leap.now
    => #<Date: 2014-06-12 ((2456823j,0s,0n),+0s,2299161j)> 
    time_leap.in2days
    => #<Date: 2014-06-14 ((2456823j,0s,0n),+0s,2299161j)> 

## Methods

There are two forms how to invoke the methods. Actually the methods have to be
unique (see Short Forms) to be recognized

### Long Forms
* in2days|weeks|months|years
* back1day|week|month|year
* yesterday
* today
* tomorrow
* nextmonday|tuesday|wednesday|thursday|friday|saturday|sunday
* previousmonday|tuesday|wednesday|thursday|friday|saturday|sunday
* monday|tuesday|wednesday|thursday|friday|saturday|sundayin2weeks|months|years
* monday|tuesday|wednesday|thursday|friday|saturday|sundayback1week|month|year

### Short Forms
* i2d|w|m|y
* b2d|w|m|y
* y
* tod
* tom
* nmo|tu|we|th|fr|sa|su
* pmo|tu|we|th|fr|sa|su
* mo|tu|we|th|fr|sa|sui2w|m|y
* mo|tu|we|th|fr|sa|sub2w|m|y

## Contact
<pierre@sugaryourcoffee.de>
