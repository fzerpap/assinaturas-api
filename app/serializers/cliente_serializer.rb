class ClienteSerializer
  include FastJsonapi::ObjectSerializer
  attributes :nome, :cpf, :email

  has_many :assinaturas, serializer: AssinaturaSerializer
end
