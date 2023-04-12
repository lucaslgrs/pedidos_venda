object frBuscarCliente: TfrBuscarCliente
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Buscar Cliente'
  ClientHeight = 488
  ClientWidth = 761
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 3
    Top = 12
    Width = 826
    Height = 26
    Shape = bsBottomLine
  end
  object Label1: TLabel
    Left = 8
    Top = 20
    Width = 38
    Height = 13
    Caption = 'Filtros:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 91
    Width = 60
    Height = 13
    Caption = 'Resultado:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 44
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object Label4: TLabel
    Left = 90
    Top = 44
    Width = 76
    Height = 13
    Caption = 'Nome do cliente'
  end
  object Label5: TLabel
    Left = 535
    Top = 44
    Width = 33
    Height = 13
    Caption = 'Cidade'
  end
  object gridBuscarCliente: TDBGrid
    Left = 8
    Top = 109
    Width = 745
    Height = 340
    DataSource = dmPedidoVendas.dsBuscarClientes
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = gridBuscarClienteDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_CLIENTE'
        Title.Caption = 'C'#243'digo'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME_CLIENTE'
        Title.Caption = 'Nome do cliente'
        Width = 443
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CIDADE'
        Title.Caption = 'Cidade'
        Width = 158
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UF'
        Title.Caption = 'Estado'
        Width = 40
        Visible = True
      end>
  end
  object edtFiltroNomeCliente: TEdit
    Left = 90
    Top = 60
    Width = 444
    Height = 21
    TabOrder = 1
    OnChange = edtFiltroNomeClienteChange
    OnKeyDown = FormKeyDown
  end
  object edtFiltroCodigoCliente: TEdit
    Left = 8
    Top = 60
    Width = 79
    Height = 21
    TabOrder = 0
    OnChange = edtFiltroNomeClienteChange
    OnKeyDown = FormKeyDown
  end
  object edtFiltroCidadeCliente: TEdit
    Left = 535
    Top = 60
    Width = 158
    Height = 21
    TabOrder = 2
    OnChange = edtFiltroNomeClienteChange
    OnKeyDown = FormKeyDown
  end
  object btnOk: TBitBtn
    Left = 569
    Top = 455
    Width = 89
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 4
  end
  object btnCancelar: TBitBtn
    Left = 664
    Top = 455
    Width = 89
    Height = 25
    Caption = 'Cancelar'
    ModalResult = 2
    TabOrder = 5
  end
end
