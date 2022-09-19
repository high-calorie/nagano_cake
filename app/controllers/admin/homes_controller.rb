class Admin::HomesController < ApplicationController
  def top
    @oders = Oder.find(params[:id])
    @oder_details = Oder_detail.find(params[:id])
  end
end
