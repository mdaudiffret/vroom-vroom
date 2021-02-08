class DriversController < ApplicationController
  def index
    @drivers = policy_scope(Driver).sort_by(&:name)
  end

  def new
    @driver = Driver.new()
    authorize @driver
  end

  def create
    @driver = Driver.new(driver_params)
    authorize @driver
    if @driver.save!
      @driver.save
      flash[:notice] = "Pilote créé"
      redirect_to drivers_path
    else
      flash[:notice] = "Il y a eu un problème"
      redirect_to new_driver_path
    end
  end

  def edit
    @driver = Driver.find(params[:id])
    authorize @driver
  end

  def update
    @driver = Driver.find(params[:id])
    @driver.update(driver_params)
    authorize @driver
    redirect_to drivers_path
  end

  def destroy
    @driver = Driver.find(params[:id])
    @driver.destroy
    authorize @driver
    redirect_to drivers_path
  end

  private

  def driver_params
    params.require(:driver).permit(
      :name,
      :price
    )
  end
end
