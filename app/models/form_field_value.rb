class FormFieldValue < DeleteNestedActiveRecord
     belongs_to :form, inverse_of: :values
     belongs_to :form_field
     has_one :list_value
end
