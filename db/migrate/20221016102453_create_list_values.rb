class CreateListValues < ActiveRecord::Migration[7.0]
  def change
    create_table :list_values do |t|
      t.string :value, max:30
      t.references :form_field, null: false, foreign_key: true

      t.timestamps
    end
  end
end
