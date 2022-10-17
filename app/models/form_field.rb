class FormField < DeleteNestedActiveRecord
    enum fieldType: [ :string, :number, :list ]
    belongs_to :form_template, inverse_of: :fields
    has_many :values, dependent: :destroy, class_name: :ListValue, foreign_key: :form_field_id, autosave: true , inverse_of: :form_field
    accepts_nested_attributes_for :values, allow_destroy: true
    validates :fieldType, :form_template, :name, presence: true
    validates :name, length: {minimum: 3}
    validates_associated :values
 
    def as_json(*)
        options = options || {}
        options[:include] = options[:include] ||[]
        options[:include].push(:values)
        super.except("created_at", "updated_at")
    end

end
