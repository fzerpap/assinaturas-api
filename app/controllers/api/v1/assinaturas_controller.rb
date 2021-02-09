module Api
	module V1
    class AssinaturasController < ApplicationController
      before_action :set_assinatura, only: [:show, :update, :destroy]

      # GET /assinaturas
      def index
        
        render json: AssinaturaSerializer.new(Assinatura.all)

        #@assinaturas = Assinatura.all
        #render json: @assinaturas
      end

      # GET /assinaturas/1
      def show
        render json: @assinatura
      end

      # POST /assinaturas
      def create
        @assinatura = Assinatura.new(assinatura_params)

        if @assinatura.save
          render json: @assinatura, status: :created, location: @assinatura
        else
          render json: @assinatura.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /assinaturas/1
      def update
        if @assinatura.update(assinatura_params)
          render json: @assinatura
        else
          render json: @assinatura.errors, status: :unprocessable_entity
        end
      end

      # DELETE /assinaturas/1
      def destroy
        @assinatura.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_assinatura
          @assinatura = Assinatura.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def assinatura_params
          params.require(:assinatura).permit(:imei, :preco_anual, :num_parcelas, :modelo_id, :cliente_id)
        end
    end
  end
end
