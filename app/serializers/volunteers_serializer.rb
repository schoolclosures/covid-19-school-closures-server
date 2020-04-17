class VolunteersSerializer < ActiveModel::Serializer
  attributes :first_name, :last_name, :description, :photo
end
