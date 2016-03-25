json.array!(@testmodels) do |testmodel|
  json.extract! testmodel, :id, :modid, :moddesc, :modname, :trainfile, :testfile, :addtnl, :modcheck, :trainmodel_id
  json.url testmodel_url(testmodel, format: :json)
end
