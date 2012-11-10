module ApplicationHelper
  def verifica_telefone_secundario(motel)
    if motel.telefone2 == ""
      " - "
    else
      motel.telefone2
    end
  end
end
