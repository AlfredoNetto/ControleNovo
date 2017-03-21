program PRJControleNovo;

uses
  Forms,
  UPrincipal in 'UPrincipal.pas' {FRMPrincipal},
  UCadastrodeFornecedor in 'UCadastrodeFornecedor.pas' {FRMCadFornecedor},
  UCliente in 'UCliente.pas' {FRMCliente},
  UEntrada in 'UEntrada.pas' {FRMEntrada},
  UProduto in 'UProduto.pas' {FRMProduto},
  URelatorioDeFornecedor in 'URelatorioDeFornecedor.pas' {FRMRelatorio},
  USaida in 'USaida.pas' {FRMSaida};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFRMPrincipal, FRMPrincipal);
  Application.CreateForm(TFRMCadFornecedor, FRMCadFornecedor);
  Application.CreateForm(TFRMCliente, FRMCliente);
  Application.CreateForm(TFRMEntrada, FRMEntrada);
  Application.CreateForm(TFRMProduto, FRMProduto);
  Application.CreateForm(TFRMRelatorio, FRMRelatorio);
  Application.CreateForm(TFRMSaida, FRMSaida);
  Application.Run;
end.
