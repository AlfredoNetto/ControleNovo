unit UPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Menus, StdCtrls, Buttons;

type
  TFRMPrincipal = class(TForm)
    MMPrincipal: TMainMenu;
    Cadastros1: TMenuItem;
    Clientes1: TMenuItem;
    CadastrodeFornecedores1: TMenuItem;
    Produtos1: TMenuItem;
    Movimentaes1: TMenuItem;
    Entradas1: TMenuItem;
    Sadas1: TMenuItem;
    Relatrios1: TMenuItem;
    RelatriosdeFornecedores1: TMenuItem;
    RelatriodeEntradas1: TMenuItem;
    N1: TMenuItem;
    RelatriodeSadas1: TMenuItem;
    RelatriosdeSadas1: TMenuItem;
    Sair1: TMenuItem;
    FinalizarAplicao1: TMenuItem;
    DBPrincipal: TADOConnection;
    DPB1: TGroupBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton3: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Clientes1Click(Sender: TObject);
    procedure CadastrodeFornecedores1Click(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure Entradas1Click(Sender: TObject);
    procedure Sadas1Click(Sender: TObject);
    procedure RelatriosdeFornecedores1Click(Sender: TObject);
    procedure FinalizarAplicao1Click(Sender: TObject);

    //assinatura da Fun��o
    function  AcertaData(Opcao:Integer;Data:string):string;



  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRMPrincipal: TFRMPrincipal;

implementation

uses UCliente, UEntrada, UProduto, URelatorioDeFornecedor,
  UCadastrodeFornecedor, USaida;

{$R *.dfm}

function TFRMPrincipal.AcertaData(Opcao: Integer; Data: string): string;
begin
    if Opcao = 1  then
       //Formata para entrar ao banco de dados
    Result :=copy(Data,1,2)+'-'+copy(Data,4,2)+'-'+copy(Data,7,4)

    else
        //Formata a data vinda do banco
    result :=copy(Data,9,2)+'/'+copy(Data,1,2)+'/'+copy(Data,1,4)



end;

procedure TFRMPrincipal.CadastrodeFornecedores1Click(Sender: TObject);
begin
  Application.createform(TFRMCadFornecedor,FRMCadFornecedor);
  FRMCadFornecedor.ShowModal;
end;

procedure TFRMPrincipal.Clientes1Click(Sender: TObject);
begin
  Application.createform(TFRMCliente,FRMCliente);
  FRMCliente.ShowModal;
end;

procedure TFRMPrincipal.Entradas1Click(Sender: TObject);
begin
 Application.createform(TFRMEntrada,FRMEntrada);
 FRMEntrada.ShowModal;
end;

procedure TFRMPrincipal.FinalizarAplicao1Click(Sender: TObject);
begin
  Close;
end;

procedure TFRMPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if MessageDlg('Deseja realmente fechar a aplica��o?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
  Abort
  else
  Application.Terminate;

end;

procedure TFRMPrincipal.Produtos1Click(Sender: TObject);
begin
 Application.createform(TFRMProduto,FRMProduto);
 FRMProduto.ShowModal;

end;

procedure TFRMPrincipal.RelatriosdeFornecedores1Click(Sender: TObject);
begin
Application.CreateForm(TFRMRelatorio, FRMRelatorio);
FRMRelatorio.showmodal;
end;

procedure TFRMPrincipal.Sadas1Click(Sender: TObject);
begin
  Application.createform (TFRMSaida, FRMSaida);
  FRMSaida.ShowModal;
end;

end.
