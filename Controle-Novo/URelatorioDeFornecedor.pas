unit URelatorioDeFornecedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Buttons;

type
  TFRMRelatorio = class(TForm)
    BitBtn1: TBitBtn;
    DTSFornecedor: TDataSource;
    QUEFornecedor: TADOQuery;
    QUEFornecedorCOD_FORNECEDOR: TAutoIncField;
    QUEFornecedorNOME: TStringField;
    QUEFornecedorTELEFONE: TStringField;
    QUEFornecedorENDERECO: TStringField;
    QUEFornecedorCIDADE: TStringField;
    QUEFornecedorESTADO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRMRelatorio: TFRMRelatorio;

implementation

{$R *.dfm}

end.
