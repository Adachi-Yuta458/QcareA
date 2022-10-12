class StaffsController < ApplicationController
  def new
    @staff = Staff.new
  end

  def create
    @staff = Staff.new(staff_params)

    if @staff.save
      redirect_to staff_url(@staff), notice: "職員「#{@staff.name}」を登録しました。"
    else
      render :new
    end
  end

  def index
    @staffs = Staff.all
  end

  def show
    @staff = Staff.find(params[:id])
  end

  private

  def staff_params
    params.require(:staff).permit(:name, :email, :nursing_facility_id, :password, :password_confirmation)
  end
end
