class CreateForms < ActiveRecord::Migration[7.0]
  def change
    create_table :forms do |t|
      t.references :form_template, null: false, foreign_key: true
      t.timestamps
    end
  end
end
