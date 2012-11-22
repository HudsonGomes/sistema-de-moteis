module MoteisHelper

  def tem_complemento?(motel)
    if motel.endcomplemento.empty?
      " - "
    else
      motel.endcomplemento
    end
  
  end

  def verifica_status(motel)
    if motel.ativo == 1
      "Ativo"
    else
      "Inativo"
    end
  end

  def formata_telefone(ddd, telefone)
    "(#{ddd}) #{telefone}"
  end
end
