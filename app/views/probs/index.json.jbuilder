json.array!(@probs) do |prob|
  json.extract! prob, :id, :pname, :pstatement, :pid, :pdate, :person, :votes, :rateing, :points, :tag, :probstatus, :emp, :sym
  json.url prob_url(prob, format: :json)
end
