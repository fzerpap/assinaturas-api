module Api
	module V1
    class CountriesController < ApplicationController
      before_action :set_country, only: [:show, :update, :destroy]

      # GET /countries
      def index
        render json: CountrySerializer.new(Country.all)
        #render json: Country.order('created_at ASC')
        #@countries = Country.order('created_at ASC')

        #render json: {status: 'SUCCESS', message:'Countries Loaded', data: @countries}, status: :ok
       
        #render json: @countries, methods: :author, only: [:name, :language_id, :currency_id], root: true
        
        #render json: @countries, only: [:name, :language_id, :currency_id]
			end
      
      # GET /countries/1
      def show
        render json: {status: 'SUCCESS', message:'Country Loaded', data: @country},status: :ok
      end

      # POST /countries
      def create
        @country = Country.new(country_params)

        if @country.save
          render json: {status: 'SUCCESS', message:'Country Created', data: @country},status: :ok
        else
          render json: {status: 'ERROR', message:'Country not Created', data: @country.errors},status: :unprocessable_entity
        end
      end

      # PATCH/PUT /countries/1
      def update
        if @country.update(country_params)
          render json: {status: 'SUCCESS', message:'Country Updated', data: @country},status: :ok
        else
          render json: {status: 'ERROR', message:'Country not Updated', data: @country.errors},status: :unprocessable_entity
        end
      end

      # DELETE /countries/1
      def destroy
        if @country.safe_to_delete
          render json: {status: 'SUCCESS', message:'Country Destroyed', data: @country},status: :ok
        else
          render json: {status: 'ERROR', message:'Country not Destroyed', data: @country.errors},status: :unprocessable_entity
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_country
          @country = Country.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def country_params
          params.require(:country).permit(:name, :currency_id, :language_id)
        end
    end
  end
end
