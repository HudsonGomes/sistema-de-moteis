module MoteisHelper

  def tem_complemento?(motel)
    if motel.endcomplemento.empty?
      " - "
    else
      motel.endcomplemento
    end
  
  end
end
