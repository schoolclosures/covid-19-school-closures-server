class VolunteerSerializer < ActiveModel::Serializer
  attributes :id, :name, :image_url, :job_desc
end
