class CreateFormFieldValues < ActiveRecord::Migration[7.0]
  def change
    create_table :form_field_values do |t|
      t.references :form, null: false, foreign_key: true
      t.references :form_field, null: false, foreign_key: true
      t.string :stringValue
      t.string :numberValue
      t.references :list_value, null: true, foreign_key: true

      t.timestamps
    end
  end
end
