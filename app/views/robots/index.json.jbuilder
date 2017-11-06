json.array!(@robots) do |robot|
  json.extract! robot, :id, :name, :owner_id, :description
  json.url robot_url(robot, format: :json)
end
