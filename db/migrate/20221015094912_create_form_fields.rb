class CreateFormFields < ActiveRecord::Migration[7.0]
  def change
    create_table :form_fields do |t|
      t.string :name, max:80
      t.references :form_template, null: false, foreign_key: true
      t.integer :fieldType,default: 0
      t.timestamps
    end
  end
end
