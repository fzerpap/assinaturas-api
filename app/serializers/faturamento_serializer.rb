class FaturamentoSerializer
  include FastJsonapi::ObjectSerializer
  attributes :data, :valor

  belongs_to :empresa, serializer: EmpresaSerializer
end
