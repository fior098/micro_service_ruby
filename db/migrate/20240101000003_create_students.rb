class CreateStudents < ActiveRecord::Migration[7.1]
  def change
    create_table :students do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :surname, null: false
      t.integer :class_id, null: false
      t.integer :school_id, null: false
      t.timestamps
    end

    add_foreign_key :students, :school_classes, column: :class_id
    add_foreign_key :students, :schools, column: :school_id
  end
end
