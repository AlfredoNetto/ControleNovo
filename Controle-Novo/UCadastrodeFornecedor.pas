unit UCadastrodeFornecedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtDlgs, DB, ADODB, StdCtrls, Buttons, DBCtrls, Mask, ExtCtrls,shellapi;

type
  TFRMCadFornecedor = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    IMAGEFORNECEDOR: TImage;
    DBNavigator1: TDBNavigator;
    DBENome: TDBEdit;
    DBETelefone: TDBEdit;
    DBEEndereco: TDBEdit;
    DBECidade: TDBEdit;
    DBCBEstado: TDBComboBox;
    BTNCarregarimg: TButton;
    BTNLimparImg: TButton;
    DTSFornecedor: TDataSource;
    OPDBuscaImage: TOpenPictureDialog;
    BitBtn1: TBitBtn;
    QUEFornecedor: TADOQuery;
    QUEFornecedorCOD_FORNECEDOR: TAutoIncField;
    QUEFornecedorNOME: TStringField;
    QUEFornecedorTELEFONE: TStringField;
    QUEFornecedorENDERECO: TStringField;
    QUEFornecedorCIDADE: TStringField;
    QUEFornecedorESTADO: TStringField;
    QUEFornecedorPATH: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BTNCarregarimgClick(Sender: TObject);
    procedure BTNLimparImgClick(Sender: TObject);
    procedure QUEFornecedorBeforePost(DataSet: TDataSet);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRMCadFornecedor: TFRMCadFornecedor;

implementation

{$R *.dfm}

procedure TFRMCadFornecedor.BitBtn1Click(Sender: TObject);
var
  F: textfile;
begin
   assignfile (F,'relatoriofornecedores.html');
   rewrite(F);
   Writeln(F,'<Html>');
   writeln(F,'<Head>');
   writeln(F,'<Title>Rel�torio de Fornecedores</Title>');
   writeln(F,'</Head>');
   writeln(F,'<Body>');
   writeln(F,'<H2><Center>Relat�rio de Fornecedores</CENTER><H2>');
   WRITELN(F,'<p><p>');
   writeln(F,'<Table Border=1 width=100%>');
   writeln(F,'<TR>');
   writeln(F,'<TD>Nome</TD>');
   writeln(F,'<TD>Telefone</TD>');
   writeln(F,'<TD>Endere�o</TD>');
   writeln(F,'<TD>Cidade</TD>');
   writeln(F,'<TD>Estado</TD>');
   writeln(F,'</TR>');
   QUEFornecedor.First;
   while not QUEFornecedor.Eof do
   Begin
     writeln(f,'<tr>');
     writeln(f,'<td>'+ QUEFornecedorNOME.AsString+'</TD>');
     writeln(f,'<td>'+ QUEFornecedorTelefone.AsString+'</TD>');
     writeln(f,'<td>'+ QUEFornecedorEndereco.AsString+'</TD>');
     writeln(f,'<td>'+ QUEFornecedorCidade.AsString+'</TD>');
     writeln(f,'<td>'+ QUEFornecedorEstado.AsString+'</TD>');
     writeln(f,' </td>');
     QUEFornecedor.Next;
   End;
   writeln(F,'</tr>');
   writeln(F,'</table>');
   writeln(F,'</body>');
   writeln(F,'</Html>');
   closefile(F);
   shellExecute(handle,'Open',Pchar('relatoriofornecedores.html'),'','',SW_SHOWMAXIMIZED);
end;
procedure TFRMCadFornecedor.BTNCarregarimgClick(Sender: TObject);
begin
    if OPDBuscaImage.Execute then
    begin
      if OPDBuscaImage.FileName <> '' then
      begin
         IMAGEFORNECEDOR.Picture.LoadFromFile(OPDBuscaImage.FileName);

          if QUEFornecedor.State = dsBrowse then
          QUEFornecedor.Edit;
          QUEFornecedorPATH.value := OPDBuscaImage.FileName;
          IMAGEFORNECEDOR.Visible := true;
      end;

    end;

end;

procedure TFRMCadFornecedor.BTNLimparImgClick(Sender: TObject);
begin
  QUEFornecedor.Edit;
  QUEFornecedorPATH.Value := '';
  QUEFornecedor.Post;
  IMAGEFORNECEDOR.Visible := false;

end;

procedure TFRMCadFornecedor.FormClose(Sender: TObject; var Action: TCloseAction);

begin
  QUEFornecedor.Close;
  action := cafree;
end;

procedure TFRMCadFornecedor.FormCreate(Sender: TObject);
begin
  QUEFornecedor.Open;
end;

procedure TFRMCadFornecedor.QUEFornecedorBeforePost(DataSet: TDataSet);
begin
  if Trim(DBENome.Text) = '' then
  begin
    ShowMessage('O campo Nome n�o pode estar em branco!');
    DBENome.SetFocus;
    Abort;
  end;

  if (DBETelefone.Text) = '(  )    -    ' then
  begin
    ShowMessage('O campo Telefone n�o pode estar em branco!');
    DBETelefone.SetFocus;
    Abort;
  end;

  if Trim(DBEEndereco.Text) = '' then
  begin
    ShowMessage('O campo Endere�o n�o pode estar em branco!');
    DBEEndereco.SetFocus;
    Abort;
  end;

  if Trim(DBECidade.Text) = '' then
  begin
    ShowMessage('O campo Cidade n�o pode estar em branco!');
    DBECidade.SetFocus;
    Abort;
  end;

  if Trim(DBCBEstado.Text) = '' then
  begin
    ShowMessage('O campo Estado n�o pode estar em branco!');
    DBCBEstado.SetFocus;
    Abort;
  end;
   end;
end.
