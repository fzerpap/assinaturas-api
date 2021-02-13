class ModeloSerializer
  include FastJsonapi::ObjectSerializer
  attributes :nome

  belongs_to :marca, serializer: MarcaSerializer 
  

end

