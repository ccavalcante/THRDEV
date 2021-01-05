object dmVendas: TdmVendas
  OldCreateOrder = False
  Height = 203
  Width = 489
  object dsPesquisar: TADODataSet
    Connection = dmConexao.sqlConexao
    CursorType = ctStatic
    CommandText = 
      'select IDVENDAS, QUANTIDADE, VALORTOTAL, DATAVENDA from ITENSVEN' +
      'DA'#13#10'where IDVENDAS = :pIDVENDAS AND DATAVENDA = :pDATAVENDA'
    Parameters = <
      item
        Name = 'pIDVENDAS'
        DataType = ftInteger
        NumericScale = 250
        Precision = 250
        Size = 510
        Value = Null
      end
      item
        Name = 'pDATAVENDA'
        DataType = ftDateTime
        NumericScale = 250
        Precision = 250
        Size = 510
        Value = Null
      end>
    Left = 24
    Top = 8
    object dsPesquisarIDVENDAS: TIntegerField
      FieldName = 'IDVENDAS'
    end
    object dsPesquisarQUANTIDADE: TBCDField
      FieldName = 'QUANTIDADE'
      Precision = 10
      Size = 0
    end
    object dsPesquisarVALORTOTAL: TFloatField
      FieldName = 'VALORTOTAL'
    end
    object dsPesquisarDATAVENDA: TDateField
      FieldName = 'DATAVENDA'
    end
  end
  object dspPesquisar: TDataSetProvider
    DataSet = dsPesquisar
    Left = 24
    Top = 64
  end
  object cdsPesquisar: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Precision = 250
        NumericScale = 250
        Name = 'pIDVENDAS'
        ParamType = ptUnknown
        Size = 510
      end
      item
        DataType = ftDate
        Precision = 250
        NumericScale = 250
        Name = 'pDATAVENDA'
        ParamType = ptUnknown
        Size = 510
      end>
    ProviderName = 'dspPesquisar'
    Left = 24
    Top = 128
    object cdsPesquisarIDVENDAS: TIntegerField
      DisplayLabel = 'N'#186' venda'
      FieldName = 'IDVENDAS'
    end
    object cdsPesquisarQUANTIDADE: TBCDField
      DisplayLabel = 'Quantidade'
      FieldName = 'QUANTIDADE'
      Precision = 10
      Size = 0
    end
    object cdsPesquisarVALORTOTAL: TFloatField
      DisplayLabel = 'Vlr total'
      FieldName = 'VALORTOTAL'
    end
    object cdsPesquisarDATAVENDA: TDateField
      DisplayLabel = 'Data venda'
      FieldName = 'DATAVENDA'
    end
  end
  object qrVendas: TADOQuery
    Connection = dmConexao.sqlConexao
    Parameters = <
      item
        Name = 'pIDVENDAS'
        DataType = ftInteger
        NumericScale = 250
        Precision = 250
        Size = 510
        Value = Null
      end
      item
        Name = 'pIDCLIENTES'
        DataType = ftInteger
        NumericScale = 250
        Precision = 250
        Size = 510
        Value = Null
      end
      item
        Name = 'pDATAVENDA'
        DataType = ftDateTime
        NumericScale = 250
        Precision = 250
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'insert into vendas '
      '( IDVENDAS,IDCLIENTES, DATAVENDA'
      ') VALUES  ('
      ':pIDVENDAS, :pIDCLIENTES, :pDATAVENDA)'
      '')
    Left = 88
    Top = 8
  end
  object qrExcluirVenda: TADOQuery
    Connection = dmConexao.sqlConexao
    Parameters = <>
    Left = 152
    Top = 8
  end
  object qrVendasItens: TADOQuery
    Connection = dmConexao.sqlConexao
    Parameters = <
      item
        Name = 'pIDITENSVENDA'
        DataType = ftInteger
        NumericScale = 250
        Precision = 250
        Size = 510
        Value = Null
      end
      item
        Name = 'pIDVENDAS'
        DataType = ftInteger
        NumericScale = 250
        Precision = 250
        Size = 510
        Value = Null
      end
      item
        Name = 'pIDPRODUTOS'
        DataType = ftInteger
        NumericScale = 250
        Precision = 250
        Size = 510
        Value = Null
      end
      item
        Name = 'pDESCRICAO'
        DataType = ftString
        NumericScale = 250
        Precision = 250
        Size = 510
        Value = Null
      end
      item
        Name = 'pQUANTIDADE'
        DataType = ftString
        NumericScale = 250
        Precision = 250
        Size = 510
        Value = Null
      end
      item
        Name = 'pVALORTOTAL'
        DataType = ftFloat
        NumericScale = 250
        Precision = 250
        Size = 510
        Value = Null
      end
      item
        Name = 'pDATAVENDA'
        DataType = ftDateTime
        NumericScale = 250
        Precision = 250
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'insert into Itensvenda '
      
        '(IDITENSVENDA, IDVENDAS, IDPRODUTOS, DESCRICAO, QUANTIDADE, VALO' +
        'RTOTAL, DATAVENDA'
      ') VALUES  ('
      
        ':pIDITENSVENDA, :pIDVENDAS, :pIDPRODUTOS, :pDESCRICAO, :pQUANTID' +
        'ADE, :pVALORTOTAL, :pDATAVENDA)'
      ''
      '')
    Left = 232
    Top = 8
  end
  object qrExcluirItens: TADOQuery
    Parameters = <>
    Left = 312
    Top = 8
  end
  object cdsItens: TClientDataSet
    PersistDataPacket.Data = {
      9F0000009619E0BD0100000018000000050000000000030000009F0006436F64
      69676F04000100000000000944657363726963616F0100490000000100055749
      445448020002003C000A5175616E746964616465010049000000010005574944
      5448020002000A000556616C6F72010049000000010005574944544802000200
      0A000A56616C6F72546F74616C0100490000000100055749445448020002000A
      000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 148
    Top = 96
    object cdsItensCodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'Codigo'
    end
    object cdsItensDescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'Descricao'
      Size = 60
    end
    object cdsItensQuantidade: TStringField
      FieldName = 'Quantidade'
      Size = 10
    end
    object cdsItensValor: TStringField
      DisplayLabel = 'Vlr. Unit'#225'rio'
      FieldName = 'Valor'
      Size = 10
    end
    object cdsItensValorTotal: TStringField
      DisplayLabel = 'Vlr. Total'
      FieldName = 'ValorTotal'
      Size = 10
    end
  end
  object qrRelatorio: TADOQuery
    Connection = dmConexao.sqlConexao
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'pIDVENDAS'
        DataType = ftInteger
        NumericScale = 250
        Precision = 250
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'SELECT'
      
        '    t1.nome, t1.idcliente, t2.idclientes, t2.idvendas,t.IDPRODUT' +
        'OS, t.Valor, t3.descricao, t3.quantidade, '
      '    t3.valortotal, t3.datavenda, t3.idprodutos, t3.idvendas'
      'FROM'
      '    clientes t1'
      '    INNER JOIN vendas t2'
      '    ON t1.idcliente = t2.idclientes'
      '    INNER JOIN itensvenda t3'
      '    ON t2.idvendas = t3.idvendas '
      '    inner join Produtos t '
      '    on t3.idprodutos = t.idprodutos '
      '     where (t3.idvendas = :pIDVENDAS)')
    Left = 424
    Top = 8
  end
  object dspRelatorio: TDataSetProvider
    DataSet = qrRelatorio
    Left = 424
    Top = 64
  end
  object cdsRelatorio: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Precision = 250
        NumericScale = 250
        Name = 'pIDVENDAS'
        ParamType = ptUnknown
        Size = 510
      end>
    ProviderName = 'dspRelatorio'
    Left = 432
    Top = 136
  end
end
