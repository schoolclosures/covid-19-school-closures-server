class VolunteerSerializer < ActiveModel::Serializer
  attributes :first_name, :last_name, :description, :photo
end
