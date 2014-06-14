class ReportsController < ApplicationController
  before_action :find_service_for_report

  def index
    @reports = @service.reports
    respond_with @reports
  end

  def create
    @report = @service.reports.create edit_params

    if @report.save
      respond_with @report
    else
      render json: { errors: @report.errors }
    end
  end

  private
  def find_service_for_report
    @service = Service.find params[:service_id]
  end
end
