class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :name
      t.bigint :phone_no
      t.integer :age
      t.timestamps
    end
  end
end
