
  class FormSerializer < ActiveModel::Serializer
    attributes :pk, :template
    has_many :values
    def pk
      object.id
    end
    def template
      object.form_template_id
    end
  end
