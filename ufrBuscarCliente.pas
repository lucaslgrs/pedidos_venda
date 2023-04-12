unit ufrBuscarCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons;

type
  TfrBuscarCliente = class(TForm)
    gridBuscarCliente: TDBGrid;
    edtFiltroNomeCliente: TEdit;
    Bevel1: TBevel;
    Label1: TLabel;
    edtFiltroCodigoCliente: TEdit;
    Label2: TLabel;
    edtFiltroCidadeCliente: TEdit;
    btnOk: TBitBtn;
    btnCancelar: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure gridBuscarClienteDblClick(Sender: TObject);
    procedure edtFiltroNomeClienteChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure FiltrarBuscaCliente;
  public
    { Public declarations }
  end;

var
  frBuscarCliente: TfrBuscarCliente;

implementation

{$R *.dfm}

uses udmPedidoVendas;

procedure TfrBuscarCliente.edtFiltroNomeClienteChange(Sender: TObject);
begin
  FiltrarBuscaCliente;
end;

procedure TfrBuscarCliente.FiltrarBuscaCliente;
  function subConcatenarFiltro(filter: String): String;
  begin
    result := filter;
    if filter <> '' then
      result := filter + ' AND ';
  end;
begin
  gridBuscarCliente.DataSource.DataSet.Filter := '';
  if (edtFiltroCodigoCliente.Text <> '') then
    gridBuscarCliente.DataSource.DataSet.Filter := subConcatenarFiltro(gridBuscarCliente.DataSource.DataSet.Filter) + ' UPPER(COD_CLIENTE) LIKE '+QuotedStr(UpperCase(edtFiltroCodigoCliente.Text)+'%');
  if (edtFiltroNomeCliente.Text <> '') then
    gridBuscarCliente.DataSource.DataSet.Filter := subConcatenarFiltro(gridBuscarCliente.DataSource.DataSet.Filter) + ' UPPER(NOME_CLIENTE) LIKE '+QuotedStr(UpperCase(edtFiltroNomeCliente.Text)+'%');
  if (edtFiltroCidadeCliente.Text <> '') then
    gridBuscarCliente.DataSource.DataSet.Filter := subConcatenarFiltro(gridBuscarCliente.DataSource.DataSet.Filter) + ' UPPER(CIDADE) LIKE '+QuotedStr(UpperCase(edtFiltroCidadeCliente.Text)+'%');
  gridBuscarCliente.DataSource.DataSet.Filtered := gridBuscarCliente.DataSource.DataSet.Filter <> '';
end;

procedure TfrBuscarCliente.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //Tecla acima
  if key=VK_DOWN then
    if not gridBuscarCliente.DataSource.DataSet.Eof then
      gridBuscarCliente.DataSource.DataSet.Next;

  //Tecla abaixo
  if key=VK_UP then
    if not gridBuscarCliente.DataSource.DataSet.Bof then
      gridBuscarCliente.DataSource.DataSet.Prior;

  //Enter
  if key=VK_RETURN then
    ModalResult := mrOk;

  //Esc
  if key=VK_ESCAPE then
    ModalResult := mrCancel;
end;

procedure TfrBuscarCliente.FormShow(Sender: TObject);
begin
  if not gridBuscarCliente.DataSource.DataSet.Active then
    gridBuscarCliente.DataSource.DataSet.Open;
  edtFiltroNomeCliente.SetFocus;
end;

procedure TfrBuscarCliente.gridBuscarClienteDblClick(Sender: TObject);
begin
  modalResult := mrOk;
end;

end.
