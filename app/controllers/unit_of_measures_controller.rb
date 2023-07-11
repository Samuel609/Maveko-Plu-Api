class UnitOfMeasuresController < ApplicationController

include Common

  private

  def model_params
    params.require(:unit_of_measure).permit(:name, :unit)
  end
end
