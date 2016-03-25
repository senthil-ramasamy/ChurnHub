json.array!(@complaints) do |complaint|
  json.extract! complaint, :id, :cid, :ctext, :cfield, :cactionseq, :ifprivate, :cpersonal
  json.url complaint_url(complaint, format: :json)
end
