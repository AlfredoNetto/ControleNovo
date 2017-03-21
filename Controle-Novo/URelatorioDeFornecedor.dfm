object FRMRelatorio: TFRMRelatorio
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio De Fornecedor'
  ClientHeight = 240
  ClientWidth = 579
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn1: TBitBtn
    Left = 192
    Top = 64
    Width = 153
    Height = 89
    Caption = 'Imprimir'
    DoubleBuffered = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentDoubleBuffered = False
    ParentFont = False
    TabOrder = 0
  end
  object DTSFornecedor: TDataSource
    Left = 32
    Top = 72
  end
  object QUEFornecedor: TADOQuery
    Connection = FRMPrincipal.DBPrincipal
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT*'
      'FROM FORNECEDOR')
    Left = 32
    Top = 16
    object QUEFornecedorCOD_FORNECEDOR: TAutoIncField
      FieldName = 'COD_FORNECEDOR'
      ReadOnly = True
    end
    object QUEFornecedorNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object QUEFornecedorTELEFONE: TStringField
      FieldName = 'TELEFONE'
      EditMask = '!\(00\)0000-0000;1;_'
      FixedChar = True
      Size = 13
    end
    object QUEFornecedorENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 40
    end
    object QUEFornecedorCIDADE: TStringField
      FieldName = 'CIDADE'
    end
    object QUEFornecedorESTADO: TStringField
      FieldName = 'ESTADO'
      FixedChar = True
      Size = 2
    end
  end
end
