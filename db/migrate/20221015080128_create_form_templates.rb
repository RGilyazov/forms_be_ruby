class CreateFormTemplates < ActiveRecord::Migration[7.0]
  def change
    create_table :form_templates do |t|
      t.string :name,max:50
      t.timestamps
    end
  end
end
