# Provides date operations like in_1_day
module SycTemp

  # Base class for date operations
  class Temp

    # Holds the weekdays of the week starts with sunday at index 0
    WEEKDAYS = { "su" => [0, "sunday"], 
                 "mo" => [1, "monday"], 
                 "tu" => [2, "tuesday"],
                 "we" => [3, "wednesday"], 
                 "th" => [4, "thursday"], 
                 "fr" => [5, "friday"],
                 "sa" => [6, "saturday"] }

    # The base date that is used to calculate date operations
    attr_accessor :now

    # Creates a new Temp and initializes it with the current date if no date
    # is provided
    def initialize(date = Time.now.to_date)
      @now = date
    end

    # Provides the date calculation methods dynamically
    def method_missing(name, *args)
      add_regex = %r{
        ^([ib])(?:n|ack)?
        (?:\.|_|-| )?
        (\d+)
        (?:\.|_|-| )?
        ([dwmy])
        (?:ays?|eeks?|onths?|ears?)?$
      }x

      weekday_regex = %r{
        ^(tod|tom|y)(?:a?y?|o?r?r?o?w?|e?s?t?e?r?d?a?y?)?$
      }xi
      
      next_weekday_regex = %r{
        ^(n|p)(?:e?x?t|r?e?v?i?o?u?s?)?
        (?:\.|_| |-)?
        (mo|tu|we|th|fr|sa|su)
        (?:n?|e?s?|d?n?e?s?|u?r?s?|i?|t?u?r?|n?)(?:d?a?y?)$ 
      }xi

      next_weekday_in_regex = %r{
        ^(mo|tu|we|th|fr|sa|su)
        (?:n?|e?s?|d?n?e?s?|u?r?s?|i?|t?u?r?|n?)(?:d?a?y?)(?:_?)
        (i|b)
        (?:n?|a?c?k?)(?:_?)
        (\d+)(?:_?)([dwmy])(?:a?y?s?|e?e?k?s?|o?n?t?h?s?|e?a?r?s?)$
      }xi

      return add($1, $2, $3)      if name =~ add_regex
      return weekday($1)          if name =~ weekday_regex
      return next_weekday($1, $2) if name =~ next_weekday_regex
      return next_weekday_in($1, $2, $3, $4) if name =~ next_weekday_in_regex
      super 
    end

    # Determines whether to move back or forward in time and returns the
    # distance in days, weeks, months or years
    # Example: move(10, 'd') adds 10 days to :now
    def add(direction, count, distance)
      count = direction.downcase == 'b' ? -count.to_i : count.to_i

      case distance
      when 'd'
        @now + count
      when 'w'
        @now + count * 7
      when 'm'
        @now >> count
      when 'y'
        @now >> count * 12
      end

    end

    # Returns yesterday, today or tomorrow
    def weekday(weekday)
      case weekday
      when 'tod'
        @now
      when 'tom'
        @now + 1
      when 'y'
        @now - 1
      end
    end

    # Returns the next or previous weekday
    # Exampel: next_monday or n_mo
    # Su Mo Tu We Th Fr Sa
    #  0  1  2  3  4  5  6
    #     x                 Today
    #           *           Next Wednesday
    #                       @now + (3 - 1 + 7) % 7 = +2
    #              x        Today 
    #  *                    Next Sunday
    #                       @now + (0 - 4 + 7) % 7 = +3
    #        x              Today
    #           *           Previous Wednesday
    #                       @now + (3 - 2 + 7) % -7 = -6
    #               x       Today
    #        *              Previous Tuesday
    #                       @now + (2 - 4 + 7) % -7 = -2
    def next_weekday(direction, abbreviated_weekday)
      count = direction.downcase == 'n' ? 1 : -1

      weekday = WEEKDAYS[abbreviated_weekday.downcase]
      raise "No valid weekday: #{abbreviated_weekday}" if weekday.nil?

      offset = @now.send("#{weekday[1]}?") ? count * 7 : 0
      @now + (weekday[0] - @now.wday + 7) % (count * 7) + offset
    end

    # Returns the next weekday in n days, weeks, month or years
    # Example: monday_in_3_weeks or mo_i_3_w
    def next_weekday_in(weekday_abbreviation, direction, count, distance)
      count = direction.downcase == 'b' ? -count.to_i : count.to_i
      weekday = WEEKDAYS[weekday_abbreviation.downcase]

      case distance.downcase
      when "d"
      when "w"
        (@now + count * 7) + weekday[0] - @now.wday  
      when "m"
        future = @now >> count
        future + weekday[0] - future.wday
      when "y"
        future = @now >> count * 12
        future + weekday[0] - future.wday
      end
    end

  end

end
