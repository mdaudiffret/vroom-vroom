class CircuitsController < ApplicationController
  def index
    @circuits = policy_scope(Circuit)
  end

  def new
    @circuit = Circuit.new()
    authorize @circuit
  end

  def create
    @circuit = Circuit.new(circuit_params)
    authorize @circuit
    if @circuit.save!
      @circuit.save
      flash[:notice] = "Circuit créé"
      redirect_to circuits_path
    else
      flash[:notice] = "Il y a eu un problème"
      redirect_to new_circuit_path
    end
  end

  def edit
    @circuit = Circuit.find(params[:id])
    authorize @circuit
  end

  def update
    @circuit = Circuit.find(params[:id])
    authorize @circuit
    @circuit.update(circuit_params)
    flash[:notice] = "Circuit updaté"
    redirect_to circuits_path
  end

  def destroy
    @circuit = Circuit.find(params[:id])
    @circuit.destroy
    redirect_to circuits_path
    authorize @circuit
  end

  private

  def circuit_params
    params.require(:circuit).permit(
      :name,
      :city
    )
  end
end
