class RecordsController < ApplicationController
  def index
    @records = Record.where(nil)
    filtering_params(params).each do |key, value|
      @records = @records.public_send("filter_by_#{key}", value) if value.present?
    end
    @records = @records.order(created_at: :desc).page(params[:page]).per(10)
  end

  private

  def filtering_params(params)
    params.slice(:pid, :iban, :trade_license_number, :sheet_id)
  end
end