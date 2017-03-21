unit USaida;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, DBCtrls, Mask, ExtCtrls,ShellApi;

type
  TFRMSaida = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    LBLDescricao: TLabel;
    Label4: TLabel;
    DBTSubtotal: TDBText;
    DBNavigator1: TDBNavigator;
    DBEQuantidadeVendida: TDBEdit;
    DBEValorUnitario: TDBEdit;
    DBLCBProduto: TDBLookupComboBox;
    Imprimir: TBitBtn;
    DBGrid1: TDBGrid;
    QUESaida: TADOQuery;
    QUESaidaCOD_SAIDA: TAutoIncField;
    QUESaidaCOD_PRODUTO: TIntegerField;
    QUESaidaDATA_SAIDA: TWideStringField;
    QUESaidaQTD_VENDIDA: TIntegerField;
    QUESaidaVALOR_UNITARIO: TBCDField;
    QUESaidaSubtotal: TFloatField;
    QUEProduto: TADOQuery;
    QUEProdutoCOD_PRODUTO: TAutoIncField;
    QUEProdutoCOD_FORNECEDOR: TIntegerField;
    QUEProdutoDESCRICAO: TStringField;
    QUEProdutoQTD_ESTOQUE: TIntegerField;
    DTSSaida: TDataSource;
    DTSProduto: TDataSource;
    MEData: TMaskEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure ImprimirClick(Sender: TObject);
    procedure QUESaidaAfterPost(DataSet: TDataSet);
    procedure QUESaidaBeforePost(DataSet: TDataSet);
    procedure QUESaidaCalcFields(DataSet: TDataSet);
    procedure QUESaidaNewRecord(DataSet: TDataSet);
    procedure QUESaidaAfterEdit(DataSet: TDataSet);
    procedure QUESaidaAfterInsert(DataSet: TDataSet);
    procedure QUESaidaAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRMSaida: TFRMSaida;

implementation

uses UPrincipal;

{$R *.dfm}

procedure TFRMSaida.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  QUEProduto.Close;
  QUESaida.Close;
  action := cafree;

end;

procedure TFRMSaida.FormCreate(Sender: TObject);
begin
  QUESaida.Open;
  QUEProduto.Open;

end;

procedure TFRMSaida.ImprimirClick(Sender: TObject);

var
  F : textfile;
begin
   AssignFile (F,'relatorioSaida.htm');
   Rewrite(F);
   writeln(F,'<html>');
   Writeln(F,'<head>');
   writeln(F,'<title>Relatorio de Saida </title>');
   writeln(F,'</head>');
   writeln(F,'<body>');
   writeln(F,'<h2><center>Relatorio de Saida</center></h2>');
   writeln(F,'</body>');
   writeln(F,'<br><br>');
   writeln(F,'<table width=100% border=1>');
   writeln(F,'<tr>');
   writeln(F,'<td>Descrição do produto</td>');
   writeln(F,'<td>Quantidade Vendida</td>');
   writeln(F,'<td>Sub Total</td>');
   writeln(F,'<td align=center>Valor Unitario </td>');
   writeln(F,'</tr>');
   QUESaida.first;
    while not QUESaida.Eof do
   Begin
     writeln(F,'<tr>');
     writeln(F,'<td>'+QUEProdutoDESCRICAO.asstring+'</TD>');
     writeln(F,'<td>'+QUESaidaQTD_VENDIDA.asstring+'</TD>');
     writeln(F,'<td>'+QUESaidaSubtotal.AsString+'</td>');
     writeln(F,'<td align=center>'+QUESaidaVALOR_UNITARIO.asstring+'</td>');
     writeln(F,' </td>');
     QUESaida.Next;
   End;
   writeln(F,'</tr>');
   Writeln(F,'</table>');
   writeln(F,'</body>');
   writeln(F,'</html>');
   closefile (F);
   shellExecute(handle,'Open',Pchar('relatorioSaida.htm'),'','',SW_SHOWMAXIMIZED);
end;



procedure TFRMSaida.QUESaidaAfterEdit(DataSet: TDataSet);
begin
  MEData.ReadOnly:=False;
end;

procedure TFRMSaida.QUESaidaAfterInsert(DataSet: TDataSet);
begin
    MEData.ReadOnly:=False;

end;

procedure TFRMSaida.QUESaidaAfterPost(DataSet: TDataSet);
var
  CodProduto, QuantidadeVendida: Integer;
begin
  CodProduto := QUEProdutoCOD_PRODUTO.Value;
  QuantidadeVendida := QUESaidaQTD_VENDIDA.Value;

  QUEProduto.Locate('COD_PRODUTO',CodProduto, []);

  QUEProduto.Edit;
  QUEProdutoQTD_ESTOQUE.Value := QUEProdutoQTD_ESTOQUE.Value - QuantidadeVendida;
  QUEProduto.Post;
  MEData.ReadOnly:=true;
end;
procedure TFRMSaida.QUESaidaAfterScroll(DataSet: TDataSet);
begin
 MEData.Text := FRMPRINCIPAL.AcertaData(2,QUESaidaDATA_SAIDA.value)
end;

procedure TFRMSaida.QUESaidaBeforePost(DataSet: TDataSet);

begin
if Trim(DBLCBProduto.Text) = '' then
  begin
    ShowMessage('O campo Descrição não pode estar em branco!');
    DBLCBProduto.SetFocus;
    Abort;
  end;
  if Trim(DBEQuantidadeVendida.Text) = '' then
  begin
    ShowMessage('O campo Quantidade não pode estar em branco!');
    DBEQuantidadeVendida.SetFocus;
    Abort;
  end;
  if Trim(DBEValorUnitario.Text) = '' then
  begin
    ShowMessage('O campo Valor não pode estar em branco!');
    DBEValorUnitario.SetFocus;
    Abort;
  end;
  QUESaidaDATA_SAIDA.Value:=FRMPRINCIPAL.AcertaData(1,MEData.Text);
end;


procedure TFRMSaida.QUESaidaCalcFields(DataSet: TDataSet);
begin
  QUESaidaSubtotal.Value := QUESaidaQTD_VENDIDA.Value * QUESaidaVALOR_UNITARIO.Value;
end;

procedure TFRMSaida.QUESaidaNewRecord(DataSet: TDataSet);
begin
  QUESaidaDATA_SAIDA.AsDateTime := Date();
end;

end.
