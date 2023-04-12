object dmPedidoVendas: TdmPedidoVendas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 500
  Width = 631
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=vendas'
      'User_Name=root'
      'Password=root'
      'Server=localhost'
      'Compress=False'
      'DriverID=MySQL')
    TxOptions.AutoStop = False
    LoginPrompt = False
    Left = 128
    Top = 56
  end
  object dsBuscarClientes: TDataSource
    DataSet = qryBuscarClientes
    Left = 408
    Top = 128
  end
  object qryBuscarClientes: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * '
      'FROM CLIENTES'
      'WHERE COD_CLIENTE > 0')
    Left = 408
    Top = 72
  end
  object dsPedidosVenda: TDataSource
    AutoEdit = False
    DataSet = mtPedidosVenda
    Left = 176
    Top = 418
  end
  object qryClientes: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT *'
      'FROM CLIENTES'
      'WHERE COD_CLIENTE = :COD_CLIENTE')
    Left = 88
    Top = 264
    ParamData = <
      item
        Name = 'COD_CLIENTE'
        DataType = ftInteger
        ParamType = ptInput
        Value = 0
      end>
  end
  object dsClientes: TDataSource
    AutoEdit = False
    DataSet = qryClientes
    Left = 88
    Top = 320
  end
  object dsProdutosPedido: TDataSource
    DataSet = mtProdutosPedido
    Left = 270
    Top = 418
  end
  object qryAux: TFDQuery
    Connection = FDConnection
    Left = 176
    Top = 264
  end
  object dsBuscarProdutos: TDataSource
    DataSet = qryBuscarProdutos
    Left = 496
    Top = 128
  end
  object qryBuscarProdutos: TFDQuery
    AfterOpen = qryBuscarProdutosAfterOpen
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * '
      'FROM PRODUTOS'
      'WHERE COD_PRODUTO > 0')
    Left = 496
    Top = 72
  end
  object mtPedidosVenda: TFDMemTable
    AfterCancel = mtPedidosVendaAfterCancel
    AfterScroll = mtPedidosVendaAfterScroll
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 176
    Top = 376
  end
  object mtProdutosPedido: TFDMemTable
    AfterOpen = mtProdutosPedidoAfterOpen
    AfterScroll = mtProdutosPedidoAfterScroll
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 269
    Top = 377
  end
end
