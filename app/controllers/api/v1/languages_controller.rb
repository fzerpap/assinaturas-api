module Api
  module V1
    class LanguagesController < ApplicationController
      before_action :set_language, only: [:show, :update, :destroy]

      # GET /languages
      def index
        @languages = Language.order('created_at DESC')
				render json: {status: 'SUCCESS', message:'Languages Loaded', data: @languages},status: :ok
      end

      # GET /languages/1
      def show
        render json: {status: 'SUCCESS', message:'Language Loaded', data: @language},status: :ok
      end

      # POST /languages
      def create
        @language = Language.new(language_params)

        if @language.save
          render json: {status: 'SUCCESS', message:'Language Created', data: @language},status: :ok
        else
          render json: {status: 'ERROR', message:'Language not Created', data: @language.errors},status: :unprocessable_entity
        end
      end

      # PATCH/PUT /languages/1
      def update
        if @language.update(language_params)
          render json: {status: 'SUCCESS', message:'Language Updated', data: @language},status: :ok
        else
          render json: {status: 'ERROR', message:'Language not Updated', data: @language.errors},status: :unprocessable_entity
        end
      end

      # DELETE /languages/1
      def destroy
        if @language.safe_to_delete
          render json: {status: 'SUCCESS', message:'Language Destroyed', data: @language},status: :ok
        else
          render json: {status: 'ERROR', message:'Language not Destroyed', data: @language.errors},status: :unprocessable_entity
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_language
          @language = Language.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def language_params
          params.require(:language).permit(:name)
        end
    end
  end
end
