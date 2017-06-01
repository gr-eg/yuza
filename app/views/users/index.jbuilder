json.users @users, partial: 'users/user', as: :user
json.links do
  json.first @pagination[:first]
  json.last @pagination[:last]
  json.prev @pagination[:prev]
  json.next @pagination[:next]
end
