module Api
  module V1 
    class EmpresasController < ApplicationController
      before_action :set_empresa, only: [:show, :update, :destroy]

      # GET /empresas
      def index
        render json: EmpresaSerializer.new(Empresa.all)
        #@empresas = Empresa.order('created_at DESC')
				#render json: {status: 'SUCCESS', message:'Empresas Loaded', data: @empresas},status: :ok
      end

      # GET /empresas/1
      def show
        render json: {status: 'SUCCESS', message:'Empresa Loaded', data: @empresa},status: :ok
      end

      # POST /empresas
      def create
        @empresa = Empresa.new(empresa_params)

        if @empresa.save
           render json: {status: 'SUCCESS', message:'Empresa Created', data: @empresa},status: :ok
        else
          render json: {status: 'ERROR', message:'Empresa not Created', data: @empresa.errors},status: :unprocessable_entity
        end
      end

      # PATCH/PUT /empresas/1
      def update
        if @empresa.update(empresa_params)
          render json: {status: 'SUCCESS', message:'Empresa Updated', data: @empresa},status: :ok
        else
          render json: {status: 'ERROR', message:'Empresa not Updated', data: @empresa.errors},status: :unprocessable_entity
        end
      end

      # DELETE /empresas/1
      def destroy
        if @empresa.safe_to_delete
          render json: {status: 'SUCCESS', message:'Empresa Destroyed', data: @empresa},status: :ok
        else
          render json: {status: 'ERROR', message:'Empresa not Destroyed', data: @empresa.errors},status: :unprocessable_entity
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_empresa
          @empresa = Empresa.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def empresa_params
          params.require(:empresa).permit(:nome, :cnpj, :cep, :caixa_principal_saldo, :caixa_troco_saldo, :data_inicio_saldo, :country_id)
        end
    end
  end
end
