class CreateAppliedUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :applied_users do |t|
      t.integer :user_id
      t.string :job_id
      t.string :integer

      t.timestamps
    end
  end
end
