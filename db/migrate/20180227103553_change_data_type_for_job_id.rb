class ChangeDataTypeForJobId < ActiveRecord::Migration[5.1]


    def change
        # change_column :applied_users, :job_id, :integer
        change_column :applied_users, :job_id, 'integer USING CAST(job_id AS integer)'
    end

end
