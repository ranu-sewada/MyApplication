class EmployeesController < ApplicationController
  def index
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def new
    @employee = Employee.new
  end

  def create
  	@employee = Employee.new(user_params)
    if @employee.save
      flash[:success] = "You have successfully created!!!!!!!!"
      redirect_to @employee
    else
      render 'new'
    end
  end


  private
  def user_params
   params.require(:employee).permit(:name, :email, :password)
  end

end
