class AppliedUsersController < ApplicationController
  def new
   @apjob = AppliedUser.new
	end

	def create
    puts params[:current_job].inspect
    @appliedjob = AppliedUser.new(user_id: current_user.id, job_id: current_job)
    if @appliedjob.save
      flash[:success] = "You have successfully applied  for this job"
    end
	end


end
