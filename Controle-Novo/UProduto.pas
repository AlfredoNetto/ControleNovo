unit UProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, DBCtrls, ExtCtrls, Mask,Shellapi;

type
  TFRMProduto = class(TForm)
    LBLDescricaodoProduto: TLabel;
    LBLListadeFornecedores: TLabel;
    DBEDescricaoProduto: TDBEdit;
    DBNavProdutos: TDBNavigator;
    DBLCBFornecedores: TDBLookupComboBox;
    Imprimir: TBitBtn;
    DBGProduto: TDBGrid;
    QUEProduto: TADOQuery;
    QUEProdutoCOD_PRODUTO: TAutoIncField;
    QUEProdutoCOD_FORNECEDOR: TIntegerField;
    QUEProdutoDESCRICAO: TStringField;
    QUEProdutoQTD_ESTOQUE: TIntegerField;
    QUEProdutoNomeFornecedor: TStringField;
    DTSProduto: TDataSource;
    QUEFornecedor: TADOQuery;
    QUEFornecedorCOD_FORNECEDOR: TAutoIncField;
    QUEFornecedorNOME: TStringField;
    DTSFornecedor: TDataSource;
    procedure QUEProdutoBeforePost(DataSet: TDataSet);
    procedure ImprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRMProduto: TFRMProduto;

implementation

{$R *.dfm}

procedure TFRMProduto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  QUEProduto.Close;
  QUEFornecedor.Close;
  action := cafree;

end;

procedure TFRMProduto.FormCreate(Sender: TObject);
begin
  QUEProduto.Open;
  QueFornecedor.Open;

end;

procedure TFRMProduto.ImprimirClick(Sender: TObject);

var
  F : textfile;
begin
   AssignFile (F,'relatorioproduto.html');
   Rewrite(F);
   writeln(F,'<html>');
   Writeln(F,'<head>');
   writeln(F,'<title>Relatorio de Produto </title>');
   writeln(F,'</head>');
   writeln(F,'<body>');
   writeln(F,'<h2><center>Relatorio de Produto</center></h2>');
   writeln(F,'</body>');
   writeln(F,'<br><br>');
   writeln(F,'<table width=100% border=1>');
   writeln(F,'<tr>');
   writeln(F,'<td>Nome do fornecedores</td>');
   writeln(F,'<td>Descri��o do Forncedor</td>');
   writeln(F,'<td align=center>Quantidade de estoque </td>');
   writeln(F,'</tr>');
   QUEProduto.first;
    while not QUEProduto.Eof do
   Begin
     writeln(F,'<tr>');
     writeln(F,'<td>'+ QUEProdutoNomeFornecedor.asstring+'</TD>');
     writeln(F,'<td>'+ QUEProdutoDESCRICAO.asstring+'</TD>');
     writeln(F,'<td>'+QUEProdutoQTD_ESTOQUE.asstring+'</td>');
     writeln(F,' </td>');
     QUEProduto.Next;
   End;
   writeln(F,'</tr>');
   Writeln(F,'</table>');
   writeln(F,'</body>');
   writeln(F,'</html>');
   closefile(F);
   shellExecute(handle,'Open',Pchar('relatorioproduto.html'),'','',SW_SHOWMAXIMIZED);
end;

procedure TFRMProduto.QUEProdutoBeforePost(DataSet: TDataSet);
begin
  if Trim(DBEDescricaoProduto.Text) = '' then
  begin
    ShowMessage('O campo Descri��o n�o pode estar em branco!');
    DBEDescricaoProduto.SetFocus;
    Abort;
  end;
  if Trim(DBLCBFornecedores.Text) = '' then
  begin
    ShowMessage('O campo Fornecedores n�o pode estar em branco!');
    DBLCBFornecedores.SetFocus;
    Abort;
  end;

end;

end.
