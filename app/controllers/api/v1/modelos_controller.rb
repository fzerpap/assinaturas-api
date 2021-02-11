module Api
	module V1
    class ModelosController < ApplicationController
      before_action :set_modelo, only: [:show, :update, :destroy]

      # GET /modelos
      def index
        #render json: ModeloSerializer.new(Modelo.all)
        render json: Modelo.order(:marca_id)
      end

      # GET /modelos/1
      def show
        if !@modelo.nil?
          #render json: ModeloSerializer.new(@modelo)
          render json: @modelo
        else
          render json: {status: 'ERROR', message:'ID do modelo nao existe'},status: :unprocessable_entity
        end  
      end

      # POST /modelos
      def create
        @modelo = Modelo.new(modelo_params)
        if @modelo.save
           render json: ModeloSerializer.new(@modelo), status: :created
         else
          render json: @modelo.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /modelos/1
      def update
        if !@modelo.nil?
          if @modelo.update(modelo_params)
            render json:  ModeloSerializer.new(@modelo), status: :ok
          else
            render json: @modelo.errors, status: :unprocessable_entity
          end
        else
          render json: {status: 'ERROR', message:'ID do modelo nao existe'},status: :unprocessable_entity
        end
      end

      # DELETE /modelos/1
      def destroy
        if !@modelo.nil?
          if @modelo.destroy
            render json:ModeloSerializer.new(@modelo), status: :ok
          else
            render json: @modelo.errors,status: :unprocessable_entity
          end
        else
          render json: {status: 'ERROR', message:'ID do modelo nao existe'},status: :unprocessable_entity
        end

      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_modelo
          @modelo = Modelo.find(params[:id]) rescue nil
        end

        # Only allow a trusted parameter "white list" through.
        def modelo_params
          params.require(:modelo).permit(:nome, :marca_id)
        end
    end
  end
end

