class JobsController < ApplicationController
  def new
	  @job = Job.new
	end

	def create
    @job = Job.new(job_params)
    @job.user = current_user
    if @job.save
      flash[:success] = "You have submitted a new job"
      redirect_to @job
    else
      render 'new'
    end
  end

  def show

    @job = Job.find(params[:id])
    @exist  = current_user.applied_user
  end

  def index
    @jobs = Job.all.page(params[:page]).per(5)
    if current_user.has_role? :employee
         @empjobs = current_user.job.page(params[:page]).per(5)
    end

  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    @job.user = current_user
    if @job.update_attributes(job_params)
      flash[:success] = "You have successfully updated your job"
      redirect_to @job
    else
      render 'edit'
    end
  end

  def apply_for_job
    puts "1111111"

    puts @exist.inspect
    if @exist.nil?
      @appliedjob = AppliedUser.new(user_id: current_user.id, job_id: params[:id])
      if @appliedjob.save
         UserMailer.welcome_email(current_user).deliver_now
         flash[:success] = "Your confirmation mail sended for this job"
      redirect_to root_url

      else
      @jobs
      end
    else

      flash[:success] = "You have applied for this job"
       redirect_to root_url
    end

  end

  def view
    job = Job.find(params[:id])
    @arr = Array.new
    @s = job.applied_user
    @s.each do |k|
      @arr.push k.user
    end
  end


  def applied_users
    @j = Array.new
    @myjob = current_user.job
    # @jobcount = @myjob.count
    @myjob.each do |my_job|
      @j.push my_job.title
      @apuser = my_job.applied_user
      @req = Array.new
      @apuser.each do |ap_user|
        @req.push ap_user.user
      end
    end
  end

  def cancel_applied
    jb = Job.find(params[:id])
    @c = current_user.applied_user.where(job_id: jb.id).first
    if @c.destroy
      redirect_to(root_url)
    else
      flash[:success] = "There is a problem to cancel applied job"
    end
  end

  private

  def job_params
    params.require(:job).permit(:title, :post, :experience, :salary)
  end

end
