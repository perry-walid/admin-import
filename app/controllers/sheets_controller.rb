class SheetsController < ApplicationController
  def index
    @sheets = Sheet.includes(:records)
                   .order(created_at: :desc)
                   .page(params[:page])
                   .per(10)
  end

  def destroy
    @sheet = Sheet.find(params[:id])
    
    if @sheet.destroy && @sheet.records.destroy_all
      flash[:success] = "Sheet was successfully deleted."
    else
      flash[:error] = "Failed to delete sheet."
    end

    redirect_to sheets_path
  end
end 