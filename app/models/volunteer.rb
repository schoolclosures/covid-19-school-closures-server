class Volunteer < ApplicationRecord
  validates :image_url, :name, :job_desc, presence: true  
end
