class Trainmodel < ActiveRecord::Base
	mount_uploader :trainfile, CsvtrainUploader
end
