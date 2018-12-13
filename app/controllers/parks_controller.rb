class ParksController < ApplicationController
  include CriteriaBuilder

  def index
    criteria = build_criteria(params)
    search = Search.where(searchable_type: "Park", criteria: criteria).first_or_create

    @parks = Rails.cache.fetch("searches/" + search.id.to_s, expires_in: 12.hours) do
      if params[:near]
        radius = params[:radius] ? params[:radius] : 100
        Park.ransack(params[:q]).result.near(params[:near], radius).page(params[:page]).per(params[:per_page]).to_a
      else
        Park.ransack(params[:q]).result.page(params[:page]).per(params[:per_page]).to_a
      end
    end

    render :json => { status: 200, data: @parks }
  end
  
  def show
    @park = Park.find(params[:id])
    render :json => { status: 200, data: @park }
  end

  def refresh
    nps_client = NationalParkService::Client.new(api_key: Rails.application.credentials.nps[:api_key])
    nps_parks = nps_client.retrieve_parks

    nps_parks.each do |nps_park|
      update_park(nps_park)
    end
  end

  private

  def update_park(nps_park)
    park = Park.find_or_create_by(uuid: nps_park.uuid)
    park.update_attributes(nps_park.instance_values)
  end
end
