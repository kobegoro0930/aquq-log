json.array! @groups do |group|
  json.title group.title
  json.content group.content
  json.name group.user.name
end
