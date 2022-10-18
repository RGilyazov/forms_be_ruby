
 
 class FormFieldValueSerializer < ActiveModel::Serializer
    attributes :pk, :stringValue, :numberValue, :listValue, :fieldType, :valueAsString, :form, :formField, :name
    belongs_to :form_field
  
    def pk
      object.id
    end
    def valueAsString
    end 
    def formField
      return object.form_field_id
    end
    def form
      return object.form_id
    end
    def valueAsString
      case object.form_field.fieldType
        when 'ST'
          return object.stringValue
        when 'NU'
          return object.numberValue
        when 'LS'
          return object.list_value_id
      end
    end
    def name
      return object.form_field.name
    end
    def listValue
      return object.list_value_id
    end
    def fieldType
      return object.form_field.fieldType
    end
  end
