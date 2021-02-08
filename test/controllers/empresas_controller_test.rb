require 'test_helper'

class EmpresasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @empresa = empresas(:one)
  end

  test "should get index" do
    get empresas_url, as: :json
    assert_response :success
  end

  test "should create empresa" do
    assert_difference('Empresa.count') do
      post empresas_url, params: { empresa: { caixa_principal_saldo: @empresa.caixa_principal_saldo, caixa_troco_saldo: @empresa.caixa_troco_saldo, cep: @empresa.cep, cnpj: @empresa.cnpj, country_id: @empresa.country_id, data_inicio_saldo: @empresa.data_inicio_saldo, nome: @empresa.nome } }, as: :json
    end

    assert_response 201
  end

  test "should show empresa" do
    get empresa_url(@empresa), as: :json
    assert_response :success
  end

  test "should update empresa" do
    patch empresa_url(@empresa), params: { empresa: { caixa_principal_saldo: @empresa.caixa_principal_saldo, caixa_troco_saldo: @empresa.caixa_troco_saldo, cep: @empresa.cep, cnpj: @empresa.cnpj, country_id: @empresa.country_id, data_inicio_saldo: @empresa.data_inicio_saldo, nome: @empresa.nome } }, as: :json
    assert_response 200
  end

  test "should destroy empresa" do
    assert_difference('Empresa.count', -1) do
      delete empresa_url(@empresa), as: :json
    end

    assert_response 204
  end
end