unit UEntrada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls,shellapi;

type
  TFRMEntrada = class(TForm)
    LBLDescricao: TLabel;
    Label1: TLabel;
    LBLData: TLabel;
    LBLValor: TLabel;
    DBTSubtotal: TDBText;
    Label2: TLabel;
    DBNavigator1: TDBNavigator;
    DBLCBProduto: TDBLookupComboBox;
    DBEQuantidadeComprada: TDBEdit;
    DBEValorUnitario: TDBEdit;
    Imprimir: TBitBtn;
    DBGrid1: TDBGrid;
    QUEProduto: TADOQuery;
    QUEProdutoCOD_PRODUTO: TAutoIncField;
    QUEProdutoCOD_FORNECEDOR: TIntegerField;
    QUEProdutoDESCRICAO: TStringField;
    QUEProdutoQTD_ESTOQUE: TIntegerField;
    DTSProduto: TDataSource;
    QUEEntrada: TADOQuery;
    QUEEntradaCOD_ENTRADA: TAutoIncField;
    QUEEntradaCOD_PRODUTO: TIntegerField;
    QUEEntradaDATA_ENTRADA: TWideStringField;
    QUEEntradaQTD_COMPRADA: TIntegerField;
    QUEEntradaVALOR_UNITARIO: TBCDField;
    QUEEntradaSubtotal: TFloatField;
    QUEEntradaDescricaoproduto: TStringField;
    DTSEntrada: TDataSource;
    MEData: TMaskEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure ImprimirClick(Sender: TObject);
    procedure QUEEntradaAfterPost(DataSet: TDataSet);
    procedure QUEEntradaBeforePost(DataSet: TDataSet);
    procedure QUEEntradaCalcFields(DataSet: TDataSet);
    procedure QUEEntradaNewRecord(DataSet: TDataSet);
    procedure QUEEntradaAfterScroll(DataSet: TDataSet);
    procedure QUEEntradaAfterEdit(DataSet: TDataSet);
    procedure QUEEntradaAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRMEntrada: TFRMEntrada;

implementation

uses UPrincipal;

{$R *.dfm}

procedure TFRMEntrada.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 QUEProduto.Close;
 QUEEntrada.Close;
 action:= cafree;
end;

procedure TFRMEntrada.FormCreate(Sender: TObject);
begin
  QUEEntrada.Open;
  QUEProduto.Open;
end;

procedure TFRMEntrada.ImprimirClick(Sender: TObject);
var
  F : textfile;
begin
   AssignFile (F,'relatorioEntrada.html');
   Rewrite(F);
   writeln(F,'<html>');
   Writeln(F,'<head>');
   writeln(F,'<title>Relatorio de Entrada </title>');
   writeln(F,'</head>');
   writeln(F,'<body>');
   writeln(F,'<h2><center>Relatorio de Entrada</center></h2>');
   writeln(F,'</body>');
   writeln(F,'<br><br>');
   writeln(F,'<table width=100% border=1>');
   writeln(F,'<tr>');
   writeln(F,'<td>Descri��o do produto</td>');
   writeln(F,'<td>Quantidade Comprada</td>');
   writeln(F,'<td>Sub Total</td>');
   writeln(F,'<td align=center>Valor Unitario </td>');
   writeln(F,'</tr>');
   QUEEntrada.first;
    while not QUEEntrada.Eof do
   Begin
     writeln(F,'<tr>');
     writeln(F,'<td>'+QUEProdutoDESCRICAO.asstring+'</TD>');
     writeln(F,'<td>'+QUEEntradaQTD_COMPRADA.asstring+'</TD>');
      writeln(F,'<td>'+QUEEntradaSubtotal.AsString+'</td>');
     writeln(F,'<td align=center>'+QUEEntradaVALOR_UNITARIO.asstring+'</td>');
     writeln(F,' </td>');
     QUEEntrada.Next;
   End;
   writeln(F,'</tr>');
   Writeln(F,'</table>');
   writeln(F,'</body>');
   writeln(F,'</html>');
   closefile(F);
   shellExecute(handle,'Open',Pchar('relatorioEntrada.html'),'','',SW_SHOWMAXIMIZED);


end;

procedure TFRMEntrada.QUEEntradaAfterEdit(DataSet: TDataSet);
begin
  MEData.ReadOnly:=False;

end;

procedure TFRMEntrada.QUEEntradaAfterInsert(DataSet: TDataSet);
begin
    MEData.ReadOnly:=False;
end;

procedure TFRMEntrada.QUEEntradaAfterPost(DataSet: TDataSet);
var
  CodProduto, QuantidadeComprada: Integer;
begin
  CodProduto := QUEProdutoCOD_PRODUTO.Value;
  QuantidadeComprada := QUEEntradaQTD_COMPRADA.Value;

  QUEProduto.Locate('COD_PRODUTO',CodProduto, []);

  QUEProduto.Edit;
  QUEProdutoQTD_ESTOQUE.Value := QUEProdutoQTD_ESTOQUE.Value + QuantidadeComprada;
  QUEProduto.Post;
  MEData.ReadOnly:=true;
end;

procedure TFRMEntrada.QUEEntradaAfterScroll(DataSet: TDataSet);
begin
    MEData.Text := FRMPRINCIPAL.AcertaData(2,QUEEntradaData_entrada.value)
end;

procedure TFRMEntrada.QUEEntradaBeforePost(DataSet: TDataSet);
begin
   if Trim(DBLCBProduto.Text) = '' then
  begin
    ShowMessage('O campo Descri��o n�o pode estar em branco!');
    DBLCBProduto.SetFocus;
    Abort;
  end;
  if Trim(DBEQuantidadeComprada.Text) = '' then
  begin
    ShowMessage('O campo Quantidade n�o pode estar em branco!');
    DBEQuantidadeComprada.SetFocus;
    Abort;
  end;
  if Trim(DBEValorUnitario.Text) = '' then
  begin
    ShowMessage('O campo Valor n�o pode estar em branco!');
    DBEValorUnitario.SetFocus;
    Abort;
  end;
   QUEEntradaData_entrada.Value:=FRMPRINCIPAL.AcertaData(1,MEData.Text);
end;


procedure TFRMEntrada.QUEEntradaCalcFields(DataSet: TDataSet);
begin
  QUEEntradaSubtotal.Value := QUEEntradaQTD_COMPRADA.Value * QUEEntradaVALOR_UNITARIO.Value;
end;

procedure TFRMEntrada.QUEEntradaNewRecord(DataSet: TDataSet);
begin
  QUEEntradaDATA_ENTRADA.AsDateTime := Date();
end;

end.
