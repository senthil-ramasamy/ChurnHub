json.array!(@vprobs) do |vprob|
  json.extract! vprob, :id, :pvname, :pversion, :pvauthor, :pvid, :pvdate, :pvinteger, :prob_id
  json.url vprob_url(vprob, format: :json)
end
