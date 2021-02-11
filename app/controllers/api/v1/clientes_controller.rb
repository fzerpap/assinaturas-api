module Api
	module V1
    class ClientesController < ApplicationController
      before_action :set_cliente, only: [:show, :update, :destroy]

      # GET /clientes
      def index
        #render json: ClienteSerializer.new(Cliente.all)
        render json: Cliente.order(:nome)
      end

      # GET /clientes/1
      def show
        if !@cliente.nil?
          #render json: ClienteSerializer.new(@cliente)
          render json: @cliente
        else
          render json: {status: 'ERROR', message:'ID do cliente nao existe'},status: :unprocessable_entity
        end  
      end

      # POST /clientes
      def create
        @cliente = Cliente.new(cliente_params)
        if @cliente.save
          render json: ClienteSerializer.new(@cliente), status: :created
        else
          render json: @cliente.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /clientes/1
      def update
        if !@cliente.nil?
          if @cliente.update(cliente_params)
            render json:  ClienteSerializer.new(@cliente), status: :ok
          else
            render json: @cliente.errors, status: :unprocessable_entity
          end
        else
          render json: {status: 'ERROR', message:'ID do cliente nao existe'},status: :unprocessable_entity
        end
      end

      # DELETE /clientes/1
      def destroy
        if !@cliente.nil?
          if @cliente.destroy
            render json: {status: 'OK', message:'cliente excluido', data: @cliente },status: :ok
          else
            render json: {status: 'ERROR', message:'Viola a chave de integridade'},status: :unprocessable_entity
          end
        else
          render json: {status: 'ERROR', message:'ID do cliente nao existe'},status: :unprocessable_entity
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_cliente
          @cliente = Cliente.find(params[:id]) rescue nil
        end

        # Only allow a trusted parameter "white list" through.
        def cliente_params
          params.require(:cliente).permit(:nome, :cpf, :email)
        end
    end
  end
end
