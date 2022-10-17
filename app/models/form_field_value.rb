class FormFieldValue < ApplicationRecord
     belongs_to :form, inverse_of: :values
     has_one :form_field
     has_one :list_value
end
