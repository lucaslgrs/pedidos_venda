unit ufrBuscarProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TfrBuscarProduto = class(TForm)
    gridBuscarProduto: TDBGrid;
    edtFiltroNomeProduto: TEdit;
    Bevel1: TBevel;
    Label1: TLabel;
    edtFiltroCodigoProduto: TEdit;
    Label2: TLabel;
    btnOk: TBitBtn;
    btnCancelar: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure gridBuscarProdutoDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure FiltrarBuscaProduto;
  public
    { Public declarations }
  end;

var
  frBuscarProduto: TfrBuscarProduto;

implementation

{$R *.dfm}

uses udmPedidoVendas;

procedure TfrBuscarProduto.FiltrarBuscaProduto;
  function subConcatenarFiltro(filter: String): String;
  begin
    result := filter;
    if filter <> '' then
      result := filter + ' AND ';
  end;
begin
  gridBuscarProduto.DataSource.DataSet.Filter := '';
  if (edtFiltroCodigoProduto.Text <> '') then
    gridBuscarProduto.DataSource.DataSet.Filter := subConcatenarFiltro(gridBuscarProduto.DataSource.DataSet.Filter) + ' UPPER(COD_CLIENTE) LIKE '+QuotedStr(UpperCase(edtFiltroCodigoProduto.Text)+'%');
  if (edtFiltroNomeProduto.Text <> '') then
    gridBuscarProduto.DataSource.DataSet.Filter := subConcatenarFiltro(gridBuscarProduto.DataSource.DataSet.Filter) + ' UPPER(NOME_CLIENTE) LIKE '+QuotedStr(UpperCase(edtFiltroNomeProduto.Text)+'%');
  gridBuscarProduto.DataSource.DataSet.Filtered := gridBuscarProduto.DataSource.DataSet.Filter <> '';
end;

procedure TfrBuscarProduto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //Tecla acima
  if key=VK_DOWN then
    if not gridBuscarProduto.DataSource.DataSet.Eof then
      gridBuscarProduto.DataSource.DataSet.Next;

  //Tecla abaixo
  if key=VK_UP then
    if not gridBuscarProduto.DataSource.DataSet.Bof then
      gridBuscarProduto.DataSource.DataSet.Prior;

  //Enter
  if key=VK_RETURN then
    ModalResult := mrOk;

  //Esc
  if key=VK_ESCAPE then
    ModalResult := mrCancel;
end;

procedure TfrBuscarProduto.FormShow(Sender: TObject);
begin
  if not gridBuscarProduto.DataSource.DataSet.Active then
    gridBuscarProduto.DataSource.DataSet.Open;
  edtFiltroCodigoProduto.SetFocus;
end;

procedure TfrBuscarProduto.gridBuscarProdutoDblClick(Sender: TObject);
begin
  modalResult := mrOk;
end;

end.
