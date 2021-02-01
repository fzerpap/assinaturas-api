module Api
  module V1
    class CurrenciesController < ApplicationController
      before_action :set_currency, only: [:show, :update, :destroy]

      # GET /currencies
      def index
        @currencies = Currency.order('created_at DESC')
				render json: {status: 'SUCCESS', message:'Currencies Loaded', data: @currencies},status: :ok
      end

      # GET /currencies/1
      def show
        render json: {status: 'SUCCESS', message:'Currency Loaded', data: @currency},status: :ok
      end

      # POST /currencies
      def create
        @currency = Currency.new(currency_params)

        if @currency.save
          render json: {status: 'SUCCESS', message:'Currency Created', data: @currency},status: :ok
        else
          render json: {status: 'ERROR', message:'Currency not Created', data: @currency.errors},status: :unprocessable_entity
 
        end
      end

      # PATCH/PUT /currencies/1
      def update
        if @currency.update(currency_params)
          render json: {status: 'SUCCESS', message:'Currency Updated', data: @currency},status: :ok
        else
          render json: {status: 'ERROR', message:'Currency not Updated', data: @currency.errors},status: :unprocessable_entity
        end 
      end

      # DELETE /currencies/1
      def destroy
        if @currency.safe_to_delete
          render json: {status: 'SUCCESS', message:'Currency Destroyed', data: @currency},status: :ok
        else
          render json: {status: 'ERROR', message:'Currency not Destroyed', data: @currency.errors},status: :unprocessable_entity
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_currency
          @currency = Currency.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def currency_params
          params.require(:currency).permit(:name)
        end
    end
  end
end
