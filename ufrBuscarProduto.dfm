object frBuscarProduto: TfrBuscarProduto
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Buscar Produto'
  ClientHeight = 486
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
    Width = 747
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
    Left = 89
    Top = 44
    Width = 46
    Height = 13
    Caption = 'Descri'#231#227'o'
  end
  object gridBuscarProduto: TDBGrid
    Left = 8
    Top = 109
    Width = 745
    Height = 340
    DataSource = dmPedidoVendas.dsBuscarProdutos
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = gridBuscarProdutoDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_PRODUTO'
        Title.Caption = 'C'#243'digo'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCR_PRODUTO'
        Title.Caption = 'Descri'#231#227'o'
        Width = 478
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECO_VENDA'
        Title.Caption = 'Valor Unit'#225'rio'
        Width = 145
        Visible = True
      end>
  end
  object edtFiltroNomeProduto: TEdit
    Left = 89
    Top = 60
    Width = 444
    Height = 21
    TabOrder = 1
    OnKeyDown = FormKeyDown
  end
  object edtFiltroCodigoProduto: TEdit
    Left = 8
    Top = 60
    Width = 79
    Height = 21
    TabOrder = 2
    OnKeyDown = FormKeyDown
  end
  object btnOk: TBitBtn
    Left = 569
    Top = 455
    Width = 89
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 3
  end
  object btnCancelar: TBitBtn
    Left = 664
    Top = 455
    Width = 89
    Height = 25
    Caption = 'Cancelar'
    ModalResult = 2
    TabOrder = 4
  end
end
