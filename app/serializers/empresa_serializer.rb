class EmpresaSerializer
  include FastJsonapi::ObjectSerializer
  attributes :nome, :cnpj, :cep, :caixa_principal_saldo, :caixa_troco_saldo, :data_inicio_saldo

  belongs_to :country, serializer: CountrySerializer
end
