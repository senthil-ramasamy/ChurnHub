class Trainmodel < ActiveRecord::Base
	mount_uploader :trainfile, CsvtrainUploader

  def to_label
    "#{modname}"
  end
end
