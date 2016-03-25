json.array!(@solns) do |soln|
  json.extract! soln, :id, :solnname, :solntext, :solnauthor, :solnid, :solndate, :prob_id, :solnvotes, :solnrating
  json.url soln_url(soln, format: :json)
end
