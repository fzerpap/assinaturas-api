module Api
	module V1
    class FaturamentosController < ApplicationController
      before_action :set_faturamento, only: [:show, :update, :destroy]

      # GET /faturamentos
      def index
        render json: FaturamentoSerializer.new(Faturamento.order('created_at DESC'))
        #@faturamentos = Faturamento.order('created_at DESC')
        #render json: {status: 'SUCCESS', message:'Faturamentos Loaded', data: @faturamentos},status: :ok
        #render json: @faturamentos

      end

      # GET /faturamentos/1
      def show
        render json: {status: 'SUCCESS', message:'Faturamento', data: @faturamento},status: :ok

      end

      # POST /faturamentos
      def create
        @faturamento = Faturamento.new(faturamento_params)

        if @faturamento.save
          render json: {status: 'SUCCESS', message:'Faturamento Created', data: @faturamento},status: :ok
        else
          render json: {status: 'ERROR', message:'Faturamento not Created', data: @faturamento.errors},status: :unprocessable_entity
        end
      end


      # PATCH/PUT /faturamentos/1
      def update
        if @faturamento.update(faturamento_params)
          render json: {status: 'SUCCESS', message:'Faturamento Updated', data: @faturamento},status: :ok
        else
          render json: {status: 'ERROR', message:'Faturamento not Updated', data: @faturamento.errors},status: :unprocessable_entity
        end
      end

      # DELETE /faturamentos/1
      def destroy
        if  @faturamento.destroy
          render json: {status: 'SUCCESS', message:'Faturamento Destroyed', data: @faturamento},status: :ok
        else
          render json: {status: 'ERROR', message:'Faturamento not Destroyed', data: @faturamento.errors},status: :unprocessable_entity
        end
      end
      

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_faturamento
          @faturamento = Faturamento.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def faturamento_params
          params.require(:faturamento).permit(:data, :valor, :empresa_id)
        end
    end
  end
end