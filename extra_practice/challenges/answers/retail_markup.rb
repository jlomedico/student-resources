def calculate_retail_cost(wholesale_cost, markup_percentage)
  raise ArgumentError if (wholesale_cost < 0) || (markup_percentage < 0)
  retail_cost = (wholesale_cost * (markup_percentage.to_f / 100)) + wholesale_cost
  "$%.2f" % retail_cost
end
