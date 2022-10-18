
  class FormTemplateSerializer < ActiveModel::Serializer
    attributes :pk, :name
    has_many :fields
    def pk
      object.id
    end
  end
