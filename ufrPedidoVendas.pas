unit ufrPedidoVendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.DBCtrls, Vcl.Mask, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ToolWin,
  System.Actions, Vcl.ActnList, Vcl.Buttons, System.ImageList, Vcl.ImgList;

type
  TProduto = class;
  TfrPedidoVendas = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    actItensPedido: TActionList;
    ExcluirProduto: TAction;
    actPedido: TActionList;
    NovoPedido: TAction;
    ImageList1: TImageList;
    GravarInserirProduto: TAction;
    BuscarProduto: TAction;
    BuscarCliente: TAction;
    pnlDadosCliente: TPanel;
    Panel2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label4: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit9: TDBEdit;
    dbeCliente: TDBEdit;
    btnCliente: TBitBtn;
    DBComboBox1: TDBComboBox;
    DBEdit7: TDBEdit;
    Panel8: TPanel;
    Label14: TLabel;
    pnlItensPedido: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    gridProdutos: TDBGrid;
    Panel10: TPanel;
    Label21: TLabel;
    pnlValorTotalPedido: TPanel;
    pnlNovoProduto: TPanel;
    Label23: TLabel;
    Label24: TLabel;
    btnBuscarInserirProduto: TBitBtn;
    edtValorNovoProduto: TMaskEdit;
    edtNovoProduto: TEdit;
    edtQtdNovoProduto: TMaskEdit;
    btnIncluirProduto: TBitBtn;
    GravarPedido: TAction;
    lblNumPedido: TLabel;
    CancelarInserirProduto: TAction;
    edtCodNovoProduto: TEdit;
    Label1: TLabel;
    AlterarProduto: TAction;
    BuscarPedido: TAction;
    ExcluirPedido: TAction;
    CancelarNovoPedido: TAction;
    Label7: TLabel;
    dtpDataPedido: TDateTimePicker;
    btnNovoPedido: TBitBtn;
    btnGravarPedido: TBitBtn;
    btnCancelarPedido: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label8: TLabel;
    Bevel1: TBevel;
    procedure FormShow(Sender: TObject);
    procedure NovoPedidoExecute(Sender: TObject);
    procedure BuscarProdutoExecute(Sender: TObject);
    procedure GravarInserirProdutoExecute(Sender: TObject);
    procedure edtQtdNovoProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtValorNovoProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ExcluirProdutoExecute(Sender: TObject);
    procedure BuscarClienteExecute(Sender: TObject);

    procedure edtValorNovoProdutoChange(Sender: TObject);
    procedure edtQtdNovoProdutoChange(Sender: TObject);
    procedure gridProdutosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GravarPedidoExecute(Sender: TObject);
    procedure CancelarInserirProdutoExecute(Sender: TObject);
    procedure edtCodNovoProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure AlterarProdutoExecute(Sender: TObject);
    procedure BuscarPedidoExecute(Sender: TObject);
    procedure ExcluirPedidoExecute(Sender: TObject);
    procedure CancelarNovoPedidoExecute(Sender: TObject);
    procedure gridProdutosDblClick(Sender: TObject);
    procedure edtCodNovoProdutoChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    fTotalPedido: Double;
    function FormatarMoeda(valor: String): String;
    function FormatarQuantidade(valor: String): String;
    function LocalizarProduto(cod_produto: String): TProduto;
    function ValidarFloat(valor: String): Boolean;
    procedure GravarDadosNovoPedido;
    function ExcluirDadosPedido(num_pedido: Integer): Boolean;
    function ValidarDadosNovoPedido: Boolean;
  public
    { Public declarations }
    procedure CarregaDados;
    procedure ControlaTela;
    procedure PosicionaRegistros;
  end;

  TProduto = class
  private
    FCodigoProduto: Integer;
    FDescricaoProduto: String;
    FPrecoVenda: Double;
  public
    property CodigoProduto: Integer read FCodigoProduto write FCodigoProduto;
    property DescricaoProduto: String read FDescricaoProduto write FDescricaoProduto;
    property PrecoVenda: Double read FPrecoVenda write FPrecoVenda;
  end;

var
  frPedidoVendas: TfrPedidoVendas;

implementation

{$R *.dfm}

uses ufrBuscarProduto, ufrBuscarCliente, udmPedidoVendas, StrUtils, menus;

procedure TfrPedidoVendas.AlterarProdutoExecute(Sender: TObject);
begin
  dmPedidoVendas.mtProdutosPedido.Edit;
  pnlNovoProduto.Visible := True;
  edtCodNovoProduto.Text := dmPedidoVendas.mtProdutosPedido.FieldByName('COD_PRODUTO').AsString;
  edtCodNovoProduto.Enabled := False;
  edtNovoProduto.Text := dmPedidoVendas.mtProdutosPedido.FieldByName('DESCR_PRODUTO').AsString;
  edtQtdNovoProduto.Text := FloatToStr(dmPedidoVendas.mtProdutosPedido.FieldByName('QUANTIDADE').AsFloat*10000);
  edtQtdNovoProduto.Enabled := True;
  edtValorNovoProduto.Text := FloatToStr(dmPedidoVendas.mtProdutosPedido.FieldByName('VL_UNITARIO').AsFloat*100);
  edtValorNovoProduto.Enabled := True;
  GravarInserirProduto.Enabled := True;
  BuscarProduto.Enabled := False;
  edtQtdNovoProduto.SetFocus;
end;

procedure TfrPedidoVendas.BuscarClienteExecute(Sender: TObject);
begin
  //Executa a tela de busca visual de clientes
  if frBuscarCliente.ShowModal = mrOk then
  begin
    dmPedidoVendas.qryClientes.Close;
    dmPedidoVendas.qryClientes.ParamByName('COD_CLIENTE').AsInteger := dmPedidoVendas.qryBuscarClientes.FieldByName('COD_CLIENTE').AsInteger;
    dmPedidoVendas.qryClientes.Open;
  end;
end;

procedure TfrPedidoVendas.BuscarPedidoExecute(Sender: TObject);
var
  num_pedido: String;
begin
  //Coleta o número do pedido para exibir os dados
  if InputQuery('Buscar Pedido','Informe o número do pedido:', num_pedido) then
  try
    if dmPedidoVendas.CarregaPedido(StrToInt(num_pedido)) then
    begin
      dmPedidoVendas.CarregaProdutos(StrToInt(num_pedido));
      dtpDataPedido.Date := dmPedidoVendas.mtPedidosVenda.FieldByName('DT_EMISSAO').AsDateTime;
      fTotalPedido := dmPedidoVendas.mtPedidosVenda.FieldByName('VALOR_TOTAL').AsFloat;
      ControlaTela;
    end
    else
    begin
      ShowMessage('Pedido não encontrado.');
      BuscarPedido.Execute;
    end;
  except
    ShowMessage('Pedido não encontrado.');
    BuscarPedido.Execute;
  end;
end;

procedure TfrPedidoVendas.BuscarProdutoExecute(Sender: TObject);
begin
  //Exibe a tela de busca visual de produtos
  if frBuscarProduto.ShowModal = mrOk then
  begin
    edtCodNovoProduto.OnChange := nil;
    edtCodNovoProduto.Text := dmPedidoVendas.qryBuscarProdutos.FieldByName('COD_PRODUTO').AsString;
    edtCodNovoProduto.OnChange := edtCodNovoProdutoChange;
    edtNovoProduto.Text := dmPedidoVendas.qryBuscarProdutos.FieldByName('DESCR_PRODUTO').AsString;
    edtValorNovoProduto.Text := FloatToStr(dmPedidoVendas.qryBuscarProdutos.FieldByName('PRECO_VENDA').AsFloat*100);
    edtQtdNovoProduto.Enabled := True;
    edtValorNovoProduto.Enabled := True;
    GravarInserirProduto.Enabled := True;
    CancelarInserirProduto.Enabled := True;
    edtQtdNovoProduto.Text := '10000';
    edtQtdNovoProduto.SetFocus;
    dmPedidoVendas.mtProdutosPedido.Append;
  end;
end;

procedure TfrPedidoVendas.CancelarInserirProdutoExecute(Sender: TObject);
begin
  if (dmPedidoVendas.mtProdutosPedido.State = dsInsert) or (dmPedidoVendas.mtProdutosPedido.State = dsEdit) then
    dmPedidoVendas.mtProdutosPedido.Cancel;
  GravarInserirProduto.Enabled := False;
  CancelarInserirProduto.Enabled := False;
  edtCodNovoProduto.Clear;
  edtNovoProduto.Clear;
  edtQtdNovoProduto.Clear;
  edtQtdNovoProduto.Enabled := False;
  edtValorNovoProduto.Clear;
  edtValorNovoProduto.Enabled := False;
  edtCodNovoProduto.Enabled := True;
  edtCodNovoProduto.SetFocus;
end;

procedure TfrPedidoVendas.CancelarNovoPedidoExecute(Sender: TObject);
begin
  dmPedidoVendas.mtPedidosVenda.Cancel;
  fTotalPedido := 0;
  ControlaTela;
end;

procedure TfrPedidoVendas.CarregaDados;
begin
  lblNumPedido.Caption := EmptyStr;
  if (dmPedidoVendas.mtPedidosVenda.FieldByName('NUM_PEDIDO').AsInteger > 0) then
    lblNumPedido.Caption := FormatFloat('00000', dmPedidoVendas.mtPedidosVenda.FieldByName('NUM_PEDIDO').AsFloat);
end;

procedure TfrPedidoVendas.ControlaTela;
begin
  NovoPedido.Enabled := (dmPedidoVendas.mtPedidosVenda.State = dsBrowse) ;
  GravarPedido.Enabled := ((dmPedidoVendas.mtPedidosVenda.State = dsInsert) or (dmPedidoVendas.mtPedidosVenda.State = dsEdit)) and (not dmPedidoVendas.qryClientes.IsEmpty);

  CancelarNovoPedido.Enabled := GravarPedido.Enabled;
  BuscarPedido.Enabled := not GravarPedido.Enabled;
  ExcluirPedido.Enabled := not GravarPedido.Enabled;

  dtpDataPedido.Enabled := GravarPedido.Enabled;
  dbeCliente.Enabled := GravarPedido.Enabled;
  btnCliente.Enabled := GravarPedido.Enabled;
  pnlValorTotalPedido.Caption := FormatFloat('R$ #,##0.00', fTotalPedido);

  gridProdutos.Enabled := (dmPedidoVendas.mtProdutosPedido.State = dsBrowse);

  pnlNovoProduto.Visible := GravarPedido.Enabled;
  BuscarProduto.Enabled := pnlNovoProduto.Visible and edtCodNovoProduto.Enabled;
  ExcluirProduto.Enabled := BuscarProduto.Enabled;
end;

procedure TfrPedidoVendas.edtCodNovoProdutoChange(Sender: TObject);
begin
  GravarInserirProduto.Enabled := False;
  edtNovoProduto.Clear;
  edtQtdNovoProduto.Clear;
  edtQtdNovoProduto.Enabled := False;
  edtValorNovoProduto.Clear;
  edtValorNovoProduto.Enabled := False;
end;

procedure TfrPedidoVendas.edtCodNovoProdutoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  produto: TProduto;
begin
  //Realiza a busca do produto pelo código digitado e retorna um objeto da classe TProduto, caso o produto seja localizado
  if Key=VK_RETURN then
  begin
    produto := LocalizarProduto(edtCodNovoProduto.Text);
    try
      if not Assigned(produto) then
      begin
        edtNovoProduto.Text := 'Produto não encontrado';
        edtCodNovoProduto.SelectAll;
      end
      else
      begin
        dmPedidoVendas.mtProdutosPedido.Append;
        edtNovoProduto.Text := produto.DescricaoProduto;
        edtValorNovoProduto.Text := FloatToStr(produto.PrecoVenda*100);
        edtQtdNovoProduto.Enabled := True;
        edtValorNovoProduto.Enabled := True;
        GravarInserirProduto.Enabled := True;
        CancelarInserirProduto.Enabled := True;
        edtQtdNovoProduto.Enabled := True;
        edtQtdNovoProduto.Text := '10000';
        edtQtdNovoProduto.SetFocus;
      end;
    finally
      produto.Free;
    end;
  end;
end;

procedure TfrPedidoVendas.edtQtdNovoProdutoChange(Sender: TObject);
begin
  edtQtdNovoProduto.Text := FormatarQuantidade(edtQtdNovoProduto.Text);
  edtQtdNovoProduto.SelStart := Length(edtQtdNovoProduto.Text);
end;

procedure TfrPedidoVendas.edtQtdNovoProdutoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key=VK_RETURN then
  begin
    edtValorNovoProduto.Enabled := True;
    edtValorNovoProduto.SetFocus;
  end;
end;

procedure TfrPedidoVendas.edtValorNovoProdutoChange(Sender: TObject);
begin
  edtValorNovoProduto.Text := FormatarMoeda(edtValorNovoProduto.Text);
  edtValorNovoProduto.SelStart := Length(edtValorNovoProduto.Text);
end;

procedure TfrPedidoVendas.edtValorNovoProdutoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key=VK_RETURN then
  begin
    GravarInserirProduto.Enabled := True;
    btnIncluirProduto.SetFocus;
  end;
end;

function TfrPedidoVendas.ExcluirDadosPedido(num_pedido: Integer): Boolean;
begin
  Result := False;

  //Realizando exclusão (via SQL) dos produtos e, posteriarmente, do pedido.
  with dmPedidoVendas do
  begin
    FDConnection.StartTransaction;
    try
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('DELETE FROM PRODUTOS_PEDIDO WHERE NUM_PEDIDO = :NUM_PEDIDO ');
      qryAux.ParamByName('NUM_PEDIDO').AsInteger := num_pedido;
      qryAux.Execute;

      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('DELETE FROM PEDIDOS_VENDA WHERE NUM_PEDIDO = :NUM_PEDIDO ');
      qryAux.ParamByName('NUM_PEDIDO').AsInteger := num_pedido;
      qryAux.Execute;

      FDConnection.Commit;
      Result := True;
    except
      FDConnection.Rollback;
      ShowMessage('Falha ao excluir o pedido.');
    end;
  end;
end;

procedure TfrPedidoVendas.ExcluirPedidoExecute(Sender: TObject);
var
  num_pedido: String;
begin
  //Coleta o número do pedido para posterior exclusão
  try
    if InputQuery('Buscar Pedido','Informe o número do pedido:', num_pedido) then
    try
      if dmPedidoVendas.CarregaPedido(StrToInt(num_pedido)) then
      begin
        dmPedidoVendas.CarregaProdutos(StrToInt(num_pedido));
        if MessageDlg('Deseja realmente excluir o pedido selecionado?', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
          if ExcluirDadosPedido(StrToInt(num_pedido)) then
          begin
            ShowMessage('Pedido excluído com sucesso');
            dmPedidoVendas.CarregaPedido(0);
            dmPedidoVendas.CarregaProdutos(0);
            fTotalPedido := 0;
            PosicionaRegistros;
            ControlaTela;
          end;
      end
      else
      begin
        ShowMessage('Pedido não encontrado.');
        BuscarPedido.Execute;
      end;
    except
      ShowMessage('Pedido não encontrado.');
      BuscarPedido.Execute;
    end;
  except;
    ShowMessage('Falha ao excluir o pedido.');
  end;
end;

procedure TfrPedidoVendas.ExcluirProdutoExecute(Sender: TObject);
begin
  if not dmPedidoVendas.mtProdutosPedido.IsEmpty then
    if MessageDlg('Deseja realmente excluir o produto selecionado?', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
      with dmPedidoVendas do
      try
        fTotalPedido := fTotalPedido - mtProdutosPedido.FieldByName('VL_TOTAL').AsFloat;
        mtProdutosPedido.Delete;
      finally
        mtProdutosPedido.Refresh;
        ControlaTela;
      end;
end;

function TfrPedidoVendas.FormatarMoeda(valor: string): string;
var
  decimais, centena, milhar, milhoes, bilhoes, trilhoes, quadrilhoes: string;
  i: Integer;
begin
  //Função para formatar o valor de um Edit simples em formato currency
  Result := EmptyStr;

  for i := 0 to Length(valor) - 1 do
    if not(valor[i] in ['0' .. '9']) then
      delete(valor, i, 1);

  if copy(valor, 1, 1) = '0' then
    valor := copy(valor, 2, Length(valor));

  decimais := RightStr(valor, 2);
  centena := copy(RightStr(valor, 5), 1, 3);
  milhar := copy(RightStr(valor, 8), 1, 3);
  milhoes := copy(RightStr(valor, 11), 1, 3);
  bilhoes := copy(RightStr(valor, 14), 1, 3);
  trilhoes := copy(RightStr(valor, 17), 1, 3);
  quadrilhoes := LeftStr(valor, Length(valor) - 17);

  case Length(valor) of
    1:
      Result := '0,0' + valor;
    2:
      Result := '0,' + valor;
    6 .. 8:
      begin
        milhar := LeftStr(valor, Length(valor) - 5);
        Result := milhar + '.' + centena + ',' + decimais;
      end;
    9 .. 11:
      begin
        milhoes := LeftStr(valor, Length(valor) - 8);
        Result := milhoes + '.' + milhar + '.' + centena + ',' + decimais;
      end;
    12 .. 14:
      begin
        bilhoes := LeftStr(valor, Length(valor) - 11);
        Result := bilhoes + '.' + milhoes + '.' + milhar + '.' + centena + ',' + decimais;
      end;
    15 .. 17:
      begin
        trilhoes := LeftStr(valor, Length(valor) - 14);
        Result := trilhoes + '.' + bilhoes + '.' + milhoes + '.' + milhar + '.' + centena + ','
          + decimais;
      end;
    18 .. 20:
      begin
        quadrilhoes := LeftStr(valor, Length(valor) - 17);
        Result := quadrilhoes + '.' + trilhoes + '.' + bilhoes + '.' + milhoes + '.' + milhar + '.'
          + centena + ',' + decimais;
      end
  else
    Result := LeftStr(valor, Length(valor) - 2) + ',' + decimais;
  end;
end;

function TfrPedidoVendas.FormatarQuantidade(valor: string): string;
var
  decimais: string;
  i: Integer;
begin
  //Função para formatar o valor de um Edit simples em float com 4 casas decimais
  Result := EmptyStr;

  for i := 0 to Length(valor) - 1 do
    if not(valor[i] in ['0' .. '9']) then
      delete(valor, i, 1);

  if copy(valor, 1, 1) = '0' then
    valor := copy(valor, 2, Length(valor));

  decimais := RightStr(valor, 4);
  case Length(valor) of
    1:
      Result := '0,000' + valor;
    2:
      Result := '0,00' + valor;
    3:
      Result := '0,0' + valor;
    4:
      Result := '0,' + valor;
  else
    Result := LeftStr(valor, Length(valor) - 4) + ',' + decimais;
  end;
end;

procedure TfrPedidoVendas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if CancelarNovoPedido.Enabled then
    if MessageDlg('Deseja realmente sair e cancelar o pedido em andamento?', mtConfirmation, [mbYes,mbNo], 0) <> mrYes then
      Abort;
end;

procedure TfrPedidoVendas.FormShow(Sender: TObject);
begin
  ExcluirProduto.ShortCut := Menus.ShortCut(VK_DELETE, []);
  CancelarInserirProduto.ShortCut := Menus.ShortCut(VK_ESCAPE, []);
  ControlaTela;
  lblNumPedido.Caption := EmptyStr;
end;

procedure TfrPedidoVendas.GravarDadosNovoPedido;
var
  num_pedido: Integer;
begin

  //Realizando inserção (via SQL) do pedido e, posteriormente, dos produtos.
  with dmPedidoVendas do
  begin
    FDConnection.StartTransaction;
    try
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('INSERT INTO PEDIDOS_VENDA (DT_EMISSAO, COD_CLIENTE, VALOR_TOTAL) VALUES ');
      qryAux.SQL.Add('(:DT_EMISSAO, :COD_CLIENTE, :VALOR_TOTAL) ');
      qryAux.ParamByName('DT_EMISSAO').AsDate := mtPedidosVenda.FieldByName('DT_EMISSAO').AsDateTime;
      qryAux.ParamByName('COD_CLIENTE').AsInteger := mtPedidosVenda.FieldByName('COD_CLIENTE').AsInteger;
      qryAux.ParamByName('VALOR_TOTAL').AsFloat := fTotalPedido;
      qryAux.Execute;

      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('SELECT LAST_INSERT_ID() AS NUM_PEDIDO;');
      qryAux.Open;
      num_pedido := qryAux.FieldByName('NUM_PEDIDO').AsInteger;

      mtProdutosPedido.First;
      while not mtProdutosPedido.Eof do
      begin
        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add('INSERT INTO PRODUTOS_PEDIDO (NUM_PEDIDO, COD_PRODUTO, QUANTIDADE, VL_UNITARIO, VL_TOTAL) VALUES ');
        qryAux.SQL.Add('(:NUM_PEDIDO, :COD_PRODUTO, :QUANTIDADE, :VL_UNITARIO, :VL_TOTAL)');
        qryAux.ParamByName('NUM_PEDIDO').AsInteger := num_pedido;
        qryAux.ParamByName('COD_PRODUTO').AsInteger := mtProdutosPedido.FieldByName('COD_PRODUTO').AsInteger;
        qryAux.ParamByName('QUANTIDADE').AsFloat := mtProdutosPedido.FieldByName('QUANTIDADE').AsFloat;
        qryAux.ParamByName('VL_UNITARIO').AsFloat := mtProdutosPedido.FieldByName('VL_UNITARIO').AsFloat;
        qryAux.ParamByName('VL_TOTAL').AsFloat := mtProdutosPedido.FieldByName('VL_TOTAL').AsFloat;
        qryAux.Execute;
        mtProdutosPedido.Next;
      end;

      FDConnection.Commit;

      ShowMessage('Pedido ' + FormatFloat('00000', StrToFloat(IntToStr(num_pedido))) + ' gravado com sucesso.');
    except
      FDConnection.Rollback;
      ShowMessage('Falha ao gravar o pedido.');
    end;
  end;
end;

procedure TfrPedidoVendas.GravarInserirProdutoExecute(Sender: TObject);
var
  vl_total_antigo: Double;
begin

  if not ValidarFloat(edtQtdNovoProduto.Text) then
  begin
    ShowMessage('Quantidade inválida.');
    if edtQtdNovoProduto.Enabled then
      edtQtdNovoProduto.SetFocus;
    Exit;
  end;
  if not ValidarFloat(edtValorNovoProduto.Text) then
  begin
    ShowMessage('Valor unitário inválido.');
    if edtValorNovoProduto.Enabled then
      edtValorNovoProduto.SetFocus;
    Exit;
  end;

  with dmPedidoVendas do
  begin
    vl_total_antigo := mtProdutosPedido.FieldByName('VL_TOTAL').AsFloat;
    mtProdutosPedido.FieldByName('NUM_PEDIDO').AsInteger := mtPedidosVenda.FieldByName('NUM_PEDIDO').AsInteger;
    mtProdutosPedido.FieldByName('COD_PRODUTO').AsString := edtCodNovoProduto.Text;
    mtProdutosPedido.FieldByName('DESCR_PRODUTO').AsString := edtNovoProduto.Text;
    mtProdutosPedido.FieldByName('QUANTIDADE').AsFloat := StrToFloat(edtQtdNovoProduto.Text);
    mtProdutosPedido.FieldByName('VL_UNITARIO').AsFloat := StrToFloat(edtValorNovoProduto.Text);
    mtProdutosPedido.FieldByName('VL_TOTAL').AsFloat := StrToFloat(edtQtdNovoProduto.Text)*StrToFloat(edtValorNovoProduto.Text);

    if mtProdutosPedido.State = dsInsert then
      fTotalPedido := fTotalPedido + mtProdutosPedido.FieldByName('VL_TOTAL').AsFloat;
    if mtProdutosPedido.State = dsEdit then
      fTotalPedido := fTotalPedido - vl_total_antigo + mtProdutosPedido.FieldByName('VL_TOTAL').AsFloat;

    mtProdutosPedido.Post;

    GravarInserirProduto.Enabled := False;
    CancelarInserirProduto.Enabled := False;
    edtCodNovoProduto.Clear;
    edtNovoProduto.Clear;
    edtQtdNovoProduto.Clear;
    edtQtdNovoProduto.Enabled := False;
    edtValorNovoProduto.Clear;
    edtValorNovoProduto.Enabled := False;
    edtCodNovoProduto.Enabled := True;
    edtCodNovoProduto.SetFocus;
  end;

  ControlaTela;
end;

procedure TfrPedidoVendas.GravarPedidoExecute(Sender: TObject);
begin
  if ValidarDadosNovoPedido then
  begin
    dmPedidoVendas.mtPedidosVenda.FieldByName('DT_EMISSAO').AsDateTime := dtpDataPedido.Date;
    dmPedidoVendas.mtPedidosVenda.Post;
    GravarDadosNovoPedido;
    dmPedidoVendas.CarregaPedido(0);
    dmPedidoVendas.CarregaProdutos(0);
    PosicionaRegistros;
    fTotalPedido := 0;
    ControlaTela;
  end;
end;

procedure TfrPedidoVendas.gridProdutosDblClick(Sender: TObject);
begin
  if not dmPedidoVendas.mtProdutosPedido.IsEmpty then
    if dmPedidoVendas.mtPedidosVenda.State = dsInsert then
      AlterarProduto.Execute;
end;

procedure TfrPedidoVendas.gridProdutosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not dmPedidoVendas.mtProdutosPedido.IsEmpty then
    if dmPedidoVendas.mtPedidosVenda.State = dsInsert then
      if Key=VK_RETURN then
        AlterarProduto.Execute;
end;

function TfrPedidoVendas.LocalizarProduto(cod_produto: String): TProduto;
begin
  Result := nil;
  with dmPedidoVendas do
  begin
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add('SELECT * ');
    qryAux.SQL.Add('FROM   PRODUTOS ');
    qryAux.SQL.Add('WHERE  COD_PRODUTO = :COD_PRODUTO ');
    qryAux.ParamByName('COD_PRODUTO').AsString := cod_produto;
    qryAux.Open;

    if (not qryAux.IsEmpty) then
    begin
      Result := TProduto.Create;
      Result.CodigoProduto := qryAux.FieldByName('COD_PRODUTO').AsInteger;
      Result.DescricaoProduto := qryAux.FieldByName('DESCR_PRODUTO').AsString;
      Result.PrecoVenda := qryAux.FieldByName('PRECO_VENDA').AsFloat
    end
  end;
end;

procedure TfrPedidoVendas.NovoPedidoExecute(Sender: TObject);
begin
  if frBuscarCliente.ShowModal = mrOk then
  begin
    dmPedidoVendas.mtPedidosVenda.Append;
    dmPedidoVendas.mtPedidosVenda.FieldByName('COD_CLIENTE').AsInteger := dmPedidoVendas.qryBuscarClientes.FieldByName('COD_CLIENTE').AsInteger;
    fTotalPedido := 0;
    lblNumPedido.Caption := '';
    dtpDataPedido.Date := Date;
    PosicionaRegistros;
    ControlaTela;

    pnlNovoProduto.Visible := True;
    GravarInserirProduto.Enabled := False;
    CancelarInserirProduto.Enabled := False;
    edtCodNovoProduto.Enabled := True;
    edtCodNovoProduto.Clear;
    edtNovoProduto.Clear;
    edtQtdNovoProduto.Clear;
    edtValorNovoProduto.Clear;
    BuscarProduto.Enabled := True;
    edtCodNovoProduto.SetFocus;
  end;
end;

procedure TfrPedidoVendas.PosicionaRegistros;
begin
  with dmPedidoVendas do
  begin
    qryClientes.Close;
    if not mtPedidosVenda.FieldByName('COD_CLIENTE').IsNull then
    begin
      qryClientes.ParamByName('COD_CLIENTE').AsInteger := mtPedidosVenda.FieldByName('COD_CLIENTE').AsInteger;
      qryClientes.Open;
    end;
    CarregaProdutos(mtPedidosVenda.FieldByName('NUM_PEDIDO').AsInteger);
  end;
  CarregaDados;
end;

function TfrPedidoVendas.ValidarDadosNovoPedido: Boolean;
begin
  Result := False;

  //Valida se existem produtos inseridos
  if dmPedidoVendas.mtProdutosPedido.IsEmpty then
  begin
    ShowMessage('É necessário incluir produtos antes de gravar o pedido.');
    edtCodNovoProduto.SetFocus;
    Exit;
  end;
  Result := True;
end;

function TfrPedidoVendas.ValidarFloat(valor: String): Boolean;
var
  aux: Double;
begin
  Result := False;
  try
    aux := StrToFloat(valor);
    if aux > 0 then
      Result := True;
  except
  end;
end;

end.
