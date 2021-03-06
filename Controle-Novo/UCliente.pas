unit UCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ExtCtrls, DBCtrls, StdCtrls, Mask;

type
  TFRMCliente = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    DBENome: TDBEdit;
    DBECidade: TDBEdit;
    DBNavigator1: TDBNavigator;
    QUECliente: TADOQuery;
    QUEClienteCOD_CLIENTE: TAutoIncField;
    QUEClienteNOME: TStringField;
    QUEClienteCIDADE: TStringField;
    DTSCliente: TDataSource;
    procedure QUEClienteBeforePost(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRMCliente: TFRMCliente;

implementation

{$R *.dfm}

procedure TFRMCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  QUECliente.Close;
  action := cafree;
end;

procedure TFRMCliente.FormCreate(Sender: TObject);
begin
  QUECliente.Open;
end;

procedure TFRMCliente.QUEClienteBeforePost(DataSet: TDataSet);
begin
  if Trim(DBENome.Text) = '' then
  begin
    ShowMessage('O campo Nome do Cliente n�o pode estar em branco!');
    DBENome.SetFocus;
    Abort;
  end;

  if Trim(DBECidade.Text) = '' then
  begin
    ShowMessage('O campo Cidade n�o pode estar em branco!');
    DBECidade.SetFocus;
    Abort;
  end;

end;

end.
