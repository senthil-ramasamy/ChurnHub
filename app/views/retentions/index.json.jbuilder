json.array!(@retentions) do |retention|
  json.extract! retention, :id, :retid, :trainmodel_id, :offer1, :offer2, :offer3, :range, :modcheck
  json.url retention_url(retention, format: :json)
end
