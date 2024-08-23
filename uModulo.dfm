object Modulo: TModulo
  Height = 791
  Width = 800
  PixelsPerInch = 120
  object Conexao: TUniConnection
    ProviderName = 'MySQL'
    Port = 3306
    Database = 'agenda_eletronicaturma354'
    Username = 'root'
    Server = 'localhost'
    Connected = True
    Left = 90
    Top = 160
  end
  object Provedor: TMySQLUniProvider
    Left = 210
    Top = 160
  end
  object Transacoes: TUniTransaction
    DefaultConnection = Conexao
    Left = 520
    Top = 160
  end
  object sqlOff: TUniSQL
    Connection = Conexao
    Left = 620
    Top = 160
  end
  object uqUsuarios: TUniQuery
    Connection = Conexao
    SQL.Strings = (
      'SELECT * FROM usuarios')
    Active = True
    Left = 150
    Top = 380
  end
  object udsUsuarios: TUniDataSource
    DataSet = uqUsuarios
    Left = 280
    Top = 380
  end
end
