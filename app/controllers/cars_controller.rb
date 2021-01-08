class CarsController < ApplicationController
  def index
    @cars = policy_scope(Car).sort_by(&:name)
  end

  def new
    @car = Car.new()
    authorize @car
  end

  def create
    @car = Car.new(car_params)
    authorize @car
    if @car.save!
      @car.save
      flash[:notice] = "Voiture créée"
      redirect_to cars_path
    else
      flash[:notice] = "Il y a eu un problème"
      redirect_to new_car_path
    end
  end

  def edit
    @car = Car.find(params[:id])
    authorize @car
  end

  def update
    @car = Car.find(params[:id])
    @car.update(car_params)
    authorize @car
    redirect_to cars_path
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    authorize @car
    redirect_to cars_path
  end

  private

  def car_params
    params.require(:car).permit(
      :name,
      :price
    )
  end
end
