json.array!(@challenges) do |challenge|
  json.extract! challenge, :id, :chaltext, :chalname, :chaldate, :chalprize, :chalsponsor
  json.url challenge_url(challenge, format: :json)
end
