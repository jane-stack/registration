class CreateRegisterClasses < ActiveRecord::Migration[7.0]
  def change
    create_table :register_classes do |t|
      t.references :student, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
