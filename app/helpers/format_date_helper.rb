module FormatDateHelper

  # example: "2020.11.20"
  def format_date(date)
    date.strftime("%Y.%m.%d")
  end
end
