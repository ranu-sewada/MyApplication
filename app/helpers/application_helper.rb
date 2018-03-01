module ApplicationHelper

  def resource_name
    :user
  end

  def resource
    @user ||= User.new
  end

  def check_applied?(job_id)
  	@a = current_user.applied_user.where(job_id: job_id).first
  	if @a.nil?
  		true
  	else
  		false
    end
   end
end
