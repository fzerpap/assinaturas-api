module Api
	module V1
    class MarcasController < ApplicationController
      before_action :set_marca, only: [:show, :update, :destroy]

      # GET /marcas
      def index
        #render json: MarcaSerializer.new(Marca.all)
        render json: Marca.order(:nome)
      end

      # GET /marcas/1
      def show
        if !@marca.nil?
          render json: @marca
          #render json: MarcaSerializer.new(@marca)
        else
          render json: {status: 'ERROR', message:'ID da marca nao existe'},status: :unprocessable_entity
        end  
      end

      # POST /marcas
      def create
        @marca = Marca.new(marca_params)
        if @marca.save
          render json: MarcaSerializer.new(@marca), status: :created
        else
         render json: @marca.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /marcas/1
      def update
        if !@marca.nil?
          if @marca.update(marca_params)
            render json:  MarcaSerializer.new(@marca), status: :ok
          else
            render json: @marca.errors, status: :unprocessable_entity
          end
        else
          render json: {status: 'ERROR', message:'ID da marca nao existe'},status: :unprocessable_entity
        end
      end

      # DELETE /marcas/1
      def destroy
        if !@marca.nil?
          if @marca.destroy
             render json:MarcaSerializer.new(@marca), status: :ok
          else
            render json: {status: 'ERROR', message:'Viola a chave de integridade'},status: :unprocessable_entity
          end
        else
          render json: {status: 'ERROR', message:'ID da marca nao existe'},status: :unprocessable_entity
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_marca
          @marca = Marca.find(params[:id]) rescue nil
        end

        # Only allow a trusted parameter "white list" through.
        def marca_params
          params.require(:marca).permit(:nome)
        end
    end
  end
end
