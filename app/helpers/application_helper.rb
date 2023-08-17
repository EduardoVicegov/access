module ApplicationHelper
  def cpf_formatted(cpf)
    cpf = CPF.new(cpf)
    cpf.formatted 
  end
end
