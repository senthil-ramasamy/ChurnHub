class Testmodel < ActiveRecord::Base
  belongs_to :trainmodel
  mount_uploader :testfile, CsvtestUploader
end
