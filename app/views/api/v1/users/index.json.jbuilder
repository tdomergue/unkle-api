json.array! @users do |user|
  json.extract! user, :id, :email, :full_name, :admin
end
