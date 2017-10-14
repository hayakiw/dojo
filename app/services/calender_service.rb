class CalenderService

  def self.getMonth(year, month)1
    first_day_of_month = Date.new(year, month, 1)
    day = first_day_of_month.beginning_of_week(:sunday)

    month = []
    while day <= first_day_of_month.end_of_month
      week = []
      (day..day.end_of_week(:sunday)).each do |d|
        week << d
      end
      month << week
      day = day + 1.week
    end

    return month
  end

end