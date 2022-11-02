class StaffsController < ApplicationController
  def new
    @staff = Staff.new
  end

  def create
    @staff = Staff.new(staff_params)

    if @staff.save
      session[:staff_id] = @staff.id
      redirect_to root_url, notice: "職員「#{@staff.name}」を登録しました。"
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

  def edit
    @staff = Staff.find(params[:id])
  end

  def update
    @staff = Staff.find(params[:id])

    if @staff.update(staff_params)
      redirect_to staff_url(@staff), notice: "職員「#{@staff.name}」を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @staff = Staff.find(params[:id])
    @staff.destroy
    redirect_to staffs_url, notice: "職員「#{@staff.name}」の登録を削除しました"
  end

  private

  def staff_params
    params.require(:staff).permit(:name, :email, :nursing_facility_id, :password, :password_confirmation)
  end
end
