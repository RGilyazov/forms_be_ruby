
 
class ListValueSerializer < ActiveModel::Serializer
  attributes :pk, :value
  def pk
    object.id
  end
end
