class TaxController < ApplicationController
  def calculate
    unless params[:user][:zip].nil?
      client = Taxjar::Client.new(api_key: Rails.application.secrets.taxjar_api_key)
      begin
        rates = client.rates_for_location(params[:user][:zip], {
          :city => params[:user][:city],
          :country => params[:user][:country] || 'US'
        })
        render json: { tax_percent: (rates[:combined_rate] * 100).round(2) }
      rescue => e
        render json: { error: 'There was a problem calculating sales tax for this order.' }, status: 400
      end
    else
      render json: { errors: 'Please provide a zip code to calculate sales tax.' }, status: 422
    end
  end
end