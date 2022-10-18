
 
 class FormFieldSerializer < ActiveModel::Serializer
    attributes :pk, :name, :formTemplate, :fieldType
    has_many :values
    def pk
      object.id
    end
    def formTemplate
      object.form_template_id
    end
  end
