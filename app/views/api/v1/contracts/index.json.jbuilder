json.array! @contracts do |contract|
  json.extract! contract, :number, :status, :start_date, :end_date, :options_title, :users_full_name
end
