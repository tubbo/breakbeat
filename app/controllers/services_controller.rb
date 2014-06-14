class ServicesController < ApplicationController
  respond_to :json
  before_action :find_service, except: %w(index create)
  before_action :authenticate_user!, except: %w(index show)

  def index
    @services = Service.where search_params
    respond_with @services
  end

  def create
    @service = Service.new create_params

    if @service.save
      respond_with @service
    else
      render json: { errors: @service.errors }
    end
  end

  def show
    respond_with @service
  end

  def update
    if @service.update edit_params
      respond_with @service
    else
      render json: { errors: @service.errors }
    end
  end

  def destroy
    if @service.destroy
      respond_with @service
    else
      render json: { errors: @service.errors }
    end
  end

  private
  def find_service
    @service = Service.find params[:id]
  end
end
