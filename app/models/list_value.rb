class ListValue < DeleteNestedActiveRecord
    belongs_to :form_field, inverse_of: :values
    validates :form_field, :value, presence: true
    def as_json(*)
        super.except("created_at", "updated_at")
    end
end
