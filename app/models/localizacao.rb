class Localizacao

RIO_CENTRO = 'Centro'
RIO_ZONA_OESTE = 'Zona Oeste'
RIO_ZONA_NORTE = 'Zona Norte'
RIO_ZONA_SUL = 'Zona Sul'
NITEROI = 'Niteroi'

REGIOES_RIO = [RIO_CENTRO, RIO_ZONA_OESTE, RIO_ZONA_SUL, RIO_ZONA_NORTE]
REGIOES = REGIOES_RIO + [NITEROI]

 def self.identifica_localizacao(local)

  case local
  when 'riozs'
    RIO_ZONA_SUL
  when 'riozn'
    RIO_ZONA_NORTE
  when 'riozo'
    RIO_ZONA_OESTE
  when 'riocentro'
    RIO_CENTRO
  when 'niteroi'
    NITEROI
  end

 end
end
