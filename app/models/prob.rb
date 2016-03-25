class Prob < ActiveRecord::Base
	has_many :vprobs
	acts_as_votable
	has_many :solns
	ratyrate_rateable 'Factor1', 'Factor2', 'Factor3', 'Factor4'
	validates :pname, presence: true,
                    length: { minimum: 5 }

end
