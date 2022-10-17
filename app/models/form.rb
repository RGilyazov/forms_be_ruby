class Form < DeleteNestedActiveRecord
    has_one :form_template, inverse_of: :forms
    has_many :values, dependent: :destroy, class_name: :FormFieldValue, foreign_key: :form_id, autosave: true , inverse_of: :form
    accepts_nested_attributes_for :values, allow_destroy: true
    def as_json(options = nil)
        options = options || {}
        options[:include] = options[:include] ||[]
        options[:include].push(:values)
        super(options).except("created_at", "updated_at")
    end
end
