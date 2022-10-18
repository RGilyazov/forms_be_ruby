class FormTemplate < DeleteNestedActiveRecord
    has_many :fields, dependent: :destroy, class_name: :FormField, foreign_key: :form_template_id, autosave: true , inverse_of: :form_template
    has_many :forms, dependent: :destroy, class_name: :Form, foreign_key: :form_template_id, inverse_of: :form_template
  
    accepts_nested_attributes_for :fields, allow_destroy: true
    validates :name, presence: true
    validates :name, length: {minimum: 3}
    validates_associated :fields

    def as_json(options = nil)
        options = options || {}
        options[:include] = options[:include] ||[]
        options[:include].push(fields:{include: :values})
        super(options).except("created_at", "updated_at")
    end

end
