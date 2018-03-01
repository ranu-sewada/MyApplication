class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :post
      t.integer :experience
      t.integer :salary
      t.references :employee, foreign_key: true

      t.timestamps
    end
     add_index :jobs, [:employee_id, :created_at]
  end
end
