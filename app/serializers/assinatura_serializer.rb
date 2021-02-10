class AssinaturaSerializer
  include FastJsonapi::ObjectSerializer
  attributes :imei, :preco_anual, :num_parcelas, :data_emisao, :data_vencimento

  belongs_to :cliente, serializer: ClienteSerializer
  belongs_to :modelo, serializer: ModeloSerializer
end
