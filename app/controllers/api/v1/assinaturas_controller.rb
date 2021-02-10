module Api
	module V1
    class AssinaturasController < ApplicationController
      before_action :set_assinatura, only: [:show, :update, :destroy]

      # GET /assinaturas
      def index
        render json: AssinaturaSerializer.new(Assinatura.all)
      end

      # GET /assinaturas/1
      def show
        if !@assinatura.nil?
          render json: AssinaturaSerializer.new(@assinatura)
        else
          render json: {status: 'ERROR', message:'ID da assinatura nao existe'},status: :unprocessable_entity
        end  
      end

      # POST /assinaturas
      def create
        @assinatura = Assinatura.new(assinatura_params)

        if @assinatura.save
          render json: AssinaturaSerializer.new(@assinatura), status: :created
        else
          render json: @assinatura.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /assinaturas/1
      def update
        if !@assinatura.nil?
          if @assinatura.update(assinatura_params)
            render json:  AssinaturaSerializer.new(@assinatura), status: :ok
          else
            render json: @assinatura.errors, status: :unprocessable_entity
          end
        else
          render json: {status: 'ERROR', message:'ID da assinatura nao existe'},status: :unprocessable_entity
        end
      end

      # DELETE /assinaturas/1
      def destroy
        if !@assinatura.nil?
          if @assinatura.destroy
            render json: {status: 'OK', message:'cliente excluido', data: @assinatura },status: :ok
          else
            render json: {status: 'ERROR', message:'Viola a chave de integridade'},status: :unprocessable_entity
          end
        else
          render json: {status: 'ERROR', message:'ID da assinatura nao existe'},status: :unprocessable_entity
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_assinatura
          @assinatura = Assinatura.find(params[:id]) rescue nil
        end

        # Only allow a trusted parameter "white list" through.
        def assinatura_params
          params.require(:assinatura).permit(:imei, :preco_anual, :num_parcelas, :modelo_id, :cliente_id,
                                             :data_emisao, :data_vencimento, :status)
        end
    end
  end
end
