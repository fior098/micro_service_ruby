class CreateSchoolClasses < ActiveRecord::Migration[7.1]
  def change
    create_table :school_classes do |t|
      t.references :school, null: false, foreign_key: true
      t.integer :number, null: false
      t.string :letter, null: false
      t.timestamps
    end
  end
end
