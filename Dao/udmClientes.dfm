object dmClientes: TdmClientes
  OldCreateOrder = False
  Height = 195
  Width = 341
  object qrCliente: TADOQuery
    Connection = dmConexao.sqlConexao
    Parameters = <
      item
        Name = 'pIDCLIENTE'
        DataType = ftInteger
        NumericScale = 250
        Precision = 250
        Size = 510
        Value = Null
      end
      item
        Name = 'pNOME'
        DataType = ftString
        NumericScale = 250
        Precision = 250
        Size = 510
        Value = Null
      end
      item
        Name = 'pDOCUMENTO'
        DataType = ftString
        NumericScale = 250
        Precision = 250
        Size = 510
        Value = Null
      end
      item
        Name = 'pDOCUMENTO2'
        DataType = ftString
        NumericScale = 250
        Precision = 250
        Size = 510
        Value = Null
      end
      item
        Name = 'pTELEFONE'
        DataType = ftString
        NumericScale = 250
        Precision = 250
        Size = 510
        Value = Null
      end
      item
        Name = 'pCELULAR'
        DataType = ftString
        NumericScale = 250
        Precision = 250
        Size = 510
        Value = Null
      end
      item
        Name = 'pEMAIL'
        DataType = ftString
        NumericScale = 250
        Precision = 250
        Size = 510
        Value = Null
      end
      item
        Name = 'pNOMEMAE'
        DataType = ftString
        NumericScale = 250
        Precision = 250
        Size = 510
        Value = Null
      end
      item
        Name = 'pNOMEPAI'
        DataType = ftString
        NumericScale = 250
        Precision = 250
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'insert into clientes '
      
        '(IDCLIENTE, NOME, DOCUMENTO, DOCUMENTO2, TELEFONE, CELULAR, EMAI' +
        'L, NOMEMAE, NOMEPAI'
      ') VALUES  ('
      
        ':pIDCLIENTE, :pNOME, :pDOCUMENTO, :pDOCUMENTO2, :pTELEFONE, :pCE' +
        'LULAR, :pEMAIL, :pNOMEMAE, :pNOMEPAI)')
    Left = 104
    Top = 8
  end
  object dstPesquisa: TADODataSet
    Connection = dmConexao.sqlConexao
    CursorType = ctStatic
    CommandText = 
      'select IDCLIENTE, NOME, DOCUMENTO, DOCUMENTO2, TELEFONE, CELULAR' +
      ', EMAIL from clientes'#13#10'where (NOME like :pNOME)'
    Parameters = <
      item
        Name = 'pNome'
        DataType = ftString
        NumericScale = 250
        Precision = 250
        Size = 510
        Value = Null
      end>
    Left = 24
    Top = 8
  end
  object dspPesquisar: TDataSetProvider
    DataSet = dstPesquisa
    Left = 24
    Top = 56
  end
  object cdsPesquisar: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Precision = 250
        NumericScale = 250
        Name = 'pNome'
        ParamType = ptUnknown
        Size = 510
      end>
    ProviderName = 'dspPesquisar'
    Left = 24
    Top = 112
    object cdsPesquisarIDCLIENTE: TAutoIncField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'IDCLIENTE'
      ReadOnly = True
    end
    object cdsPesquisarNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Size = 60
    end
    object cdsPesquisarDOCUMENTO: TStringField
      DisplayLabel = 'CPF'
      FieldName = 'DOCUMENTO'
      Size = 16
    end
    object cdsPesquisarDOCUMENTO2: TStringField
      DisplayLabel = 'RG'
      FieldName = 'DOCUMENTO2'
      Size = 16
    end
    object cdsPesquisarTELEFONE: TStringField
      DisplayLabel = 'Telefone '
      FieldName = 'TELEFONE'
      Size = 12
    end
    object cdsPesquisarCELULAR: TStringField
      DisplayLabel = 'Celular'
      FieldName = 'CELULAR'
      Size = 12
    end
    object cdsPesquisarEMAIL: TStringField
      DisplayLabel = 'E-mail'
      FieldName = 'EMAIL'
      Size = 60
    end
  end
  object cdsCliente: TClientDataSet
    PersistDataPacket.Data = {
      C70000009619E0BD010000001800000007000000000003000000C70009494443
      4C49454E54450400010000000000044E4F4D4501004900000001000557494454
      48020002003C00034350460100490000000100055749445448020002000C0002
      52470100490000000100055749445448020002000C000854454C45464F4E4501
      00490000000100055749445448020002000A000743454C554C41520100490000
      000100055749445448020002000A0005454D41494C0100490000000100055749
      445448020002003C000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 112
    Top = 88
    object cdsClienteIDCLIENTE: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'IDCLIENTE'
    end
    object cdsClienteNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Size = 60
    end
    object cdsClienteCPF: TStringField
      FieldName = 'CPF'
      Size = 12
    end
    object cdsClienteRG: TStringField
      FieldName = 'RG'
      Size = 12
    end
    object cdsClienteTELEFONE: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'TELEFONE'
      Size = 10
    end
    object cdsClienteCELULAR: TStringField
      DisplayLabel = 'Celular'
      FieldName = 'CELULAR'
      Size = 10
    end
    object cdsClienteEMAIL: TStringField
      DisplayLabel = 'E-mail'
      FieldName = 'EMAIL'
      Size = 60
    end
  end
end
