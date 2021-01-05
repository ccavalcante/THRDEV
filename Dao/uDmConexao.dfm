object dmConexao: TdmConexao
  OldCreateOrder = False
  Height = 150
  Width = 215
  object sqlConexao: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Persist Security Info=False;User ID=root;Data' +
      ' Source=MySQL ODBC Connector Datasource1;Initial Catalog=thrdev'
    DefaultDatabase = 'thrdev'
    LoginPrompt = False
    Left = 64
    Top = 64
  end
end
