class MarcaSerializer 
  include FastJsonapi::ObjectSerializer
  attributes :nome

  has_many :modelos, serializer: ModeloSerializer
end
