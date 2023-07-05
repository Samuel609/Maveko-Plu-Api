class UnitOfMeasuresController < ApplicationController

  def index
    @uoms = UnitOfMeasure.all
    render json: {data: @uoms, success: true}
  end

  def show
    @uom = UnitOfMeasure.find(params[:id])
    render json: {data: @uom, success: true}
  end

  def create
    @uom = UnitOfMeasure.new(uom_params)
    if @uom.save
      render json: {data: @uom, success: true}, status: :created
    else
      render json: {data: @uom.errors, success: false}, status: :unprocessable_entity
    end
  end

  def update
    @uom = UnitOfMeasure.find(params[:id])
    if @uom.update(uom_params)
      render json: {data: @uom, success: true}, status: :ok
    else
      render json: {data: @uom.errors, success: false}, status: :unprocessable_entity
    end
  end

  private

  def uom_params
    params.require(:unit_of_measure).permit(:name, :unit)
  end
end
