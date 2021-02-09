class ClienteSerializer
  include FastJsonapi::ObjectSerializer
  attributes :nome, :cpf, :email
end
