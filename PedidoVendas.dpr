program PedidoVendas;

uses
  Vcl.Forms,
  ufrPedidoVendas in 'ufrPedidoVendas.pas' {frPedidoVendas},
  ufrBuscarProduto in 'ufrBuscarProduto.pas' {frBuscarProduto},
  ufrBuscarCliente in 'ufrBuscarCliente.pas' {frBuscarCliente},
  udmPedidoVendas in 'udmPedidoVendas.pas' {dmPedidoVendas: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrPedidoVendas, frPedidoVendas);
  Application.CreateForm(TfrBuscarProduto, frBuscarProduto);
  Application.CreateForm(TfrBuscarCliente, frBuscarCliente);
  Application.CreateForm(TdmPedidoVendas, dmPedidoVendas);
  Application.Run;
end.
