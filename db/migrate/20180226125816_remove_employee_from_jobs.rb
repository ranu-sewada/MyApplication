class RemoveEmployeeFromJobs < ActiveRecord::Migration[5.1]
  def change
    remove_reference :jobs, :employee, index: true, foreign_key: true
    add_reference :jobs, :user, index: true, foreign_key: true
  end
end
