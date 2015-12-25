json.array!(@sunamis) do |sunami|
  json.extract! sunami, :id, :title, :box, :time
  json.url sunami_url(sunami, format: :json)
end
