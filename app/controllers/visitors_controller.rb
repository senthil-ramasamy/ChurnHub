class VisitorsController < ApplicationController
	def index
	@problems = Prob.order(votes: :desc).limit(6)
	@solns = Soln.order(created_at: :desc).limit(6)
	@challenges = Challenge.order(created_at: :desc).limit(6)
end
end
