# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_10_17_100306) do
  create_table "form_field_values", force: :cascade do |t|
    t.integer "form_id", null: false
    t.integer "form_field_id", null: false
    t.string "stringValue"
    t.string "numberValue"
    t.integer "list_value_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["form_field_id"], name: "index_form_field_values_on_form_field_id"
    t.index ["form_id"], name: "index_form_field_values_on_form_id"
    t.index ["list_value_id"], name: "index_form_field_values_on_list_value_id"
  end

  create_table "form_fields", force: :cascade do |t|
    t.string "name"
    t.integer "form_template_id", null: false
    t.integer "fieldType", default: 0
    t.integer "integer", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["form_template_id"], name: "index_form_fields_on_form_template_id"
  end

  create_table "form_templates", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "forms", force: :cascade do |t|
    t.integer "form_template_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["form_template_id"], name: "index_forms_on_form_template_id"
  end

  create_table "list_values", force: :cascade do |t|
    t.string "value"
    t.integer "form_field_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["form_field_id"], name: "index_list_values_on_form_field_id"
  end

  add_foreign_key "form_field_values", "form_fields"
  add_foreign_key "form_field_values", "forms"
  add_foreign_key "form_field_values", "list_values"
  add_foreign_key "form_fields", "form_templates"
  add_foreign_key "forms", "form_templates"
  add_foreign_key "list_values", "form_fields"
end
