unit udmPedidoVendas;

interface

uses
  System.SysUtils, System.Classes, Data.DBXMySQL, Data.DB, Data.SqlExpr,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, Datasnap.DBClient, Datasnap.Provider;

type
  TdmPedidoVendas = class(TDataModule)
    FDConnection: TFDConnection;
    dsBuscarClientes: TDataSource;
    qryBuscarClientes: TFDQuery;
    dsPedidosVenda: TDataSource;
    qryClientes: TFDQuery;
    dsClientes: TDataSource;
    dsProdutosPedido: TDataSource;
    qryAux: TFDQuery;
    dsBuscarProdutos: TDataSource;
    qryBuscarProdutos: TFDQuery;
    mtPedidosVenda: TFDMemTable;
    mtProdutosPedido: TFDMemTable;
    procedure mtProdutosPedidoAfterOpen(DataSet: TDataSet);
    procedure qryBuscarProdutosAfterOpen(DataSet: TDataSet);
    procedure mtProdutosPedidoAfterScroll(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure mtPedidosVendaAfterScroll(DataSet: TDataSet);
    procedure mtPedidosVendaAfterCancel(DataSet: TDataSet);
    function CarregaPedido(num_pedido: Integer): Boolean;
    procedure CarregaProdutos(num_pedido: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmPedidoVendas: TdmPedidoVendas;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses ufrPedidoVendas, Dialogs;

{$R *.dfm}

function TdmPedidoVendas.CarregaPedido(num_pedido: Integer): Boolean;
begin
  //Criando tabela temporária com pedidos de venda
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('SELECT * ');
  qryAux.SQL.Add('FROM  PEDIDOS_VENDA ');
  qryAux.SQL.Add('WHERE NUM_PEDIDO = :NUM_PEDIDO ');
  qryAux.ParamByName('NUM_PEDIDO').AsInteger := num_pedido;
  qryAux.Open;
  Result := not qryAux.IsEmpty;
  mtPedidosVenda.Close;
  mtPedidosVenda.Data := qryAux.Data;
  mtPedidosVenda.Open;
end;

procedure TdmPedidoVendas.CarregaProdutos(num_pedido: Integer);
begin
  //Criando tabela temporária com produtos de um pedido
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('SELECT PP.ID_PRODUTO_PEDIDO, PP.NUM_PEDIDO, PP.COD_PRODUTO, ');
  qryAux.SQL.Add(' P.DESCR_PRODUTO, PP.QUANTIDADE, PP.VL_UNITARIO, PP.VL_TOTAL ');
  qryAux.SQL.Add('FROM   PRODUTOS_PEDIDO PP, PRODUTOS P ');
  qryAux.SQL.Add('WHERE  PP.COD_PRODUTO = P.COD_PRODUTO AND ');
  qryAux.SQL.Add('       PP.NUM_PEDIDO = :NUM_PEDIDO ');
  qryAux.ParamByName('NUM_PEDIDO').AsInteger := num_pedido;
  qryAux.Open;
  mtProdutosPedido.Close;
  mtProdutosPedido.Data := qryAux.Data;
  mtProdutosPedido.Open;
  mtProdutosPedido.FieldByName('DESCR_PRODUTO').ReadOnly := False;
end;

procedure TdmPedidoVendas.DataModuleCreate(Sender: TObject);
begin
  try
    FDConnection.Connected := True;
    if FDConnection.Connected then
    begin
      CarregaPedido(0);
      CarregaProdutos(0);
      qryClientes.Open;
    end;
  except
    ShowMessage('Não foi possível conectar com o banco de dados.');
  end;
end;

procedure TdmPedidoVendas.qryBuscarProdutosAfterOpen(DataSet: TDataSet);
begin
  TFloatField(qryBuscarProdutos.FieldByName('PRECO_VENDA')).DisplayFormat := 'R$ #,##0.00';
end;

procedure TdmPedidoVendas.mtPedidosVendaAfterCancel(DataSet: TDataSet);
begin
  frPedidoVendas.PosicionaRegistros;
end;

procedure TdmPedidoVendas.mtPedidosVendaAfterScroll(DataSet: TDataSet);
begin
  frPedidoVendas.PosicionaRegistros;
  frPedidoVendas.ControlaTela;
end;

procedure TdmPedidoVendas.mtProdutosPedidoAfterOpen(DataSet: TDataSet);
begin
  TFloatField(mtProdutosPedido.FieldByName('VL_UNITARIO')).DisplayFormat := 'R$ #,##0.00';
  TFloatField(mtProdutosPedido.FieldByName('VL_TOTAL')).DisplayFormat := 'R$ #,##0.00';
end;

procedure TdmPedidoVendas.mtProdutosPedidoAfterScroll(DataSet: TDataSet);
begin
  frPedidoVendas.ControlaTela;
end;

end.
