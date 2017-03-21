object FRMEntrada: TFRMEntrada
  Left = 0
  Top = 0
  Caption = 'Tela Para Entrada De Produtos'
  ClientHeight = 385
  ClientWidth = 661
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object LBLDescricao: TLabel
    Left = 8
    Top = 64
    Width = 173
    Height = 19
    Caption = 'Descri'#231#227'o do Produto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 8
    Top = 128
    Width = 182
    Height = 19
    Caption = 'Quantidade Comprada'
    FocusControl = DBEQuantidadeComprada
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LBLData: TLabel
    Left = 319
    Top = 64
    Width = 132
    Height = 19
    Caption = 'Data da Compra'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LBLValor: TLabel
    Left = 240
    Top = 128
    Width = 114
    Height = 19
    Caption = 'Valor Unit'#225'rio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBTSubtotal: TDBText
    Left = 378
    Top = 153
    Width = 121
    Height = 17
    DataField = 'Subtotal'
    DataSource = DTSEntrada
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 386
    Top = 128
    Width = 69
    Height = 19
    Caption = 'Subtotal'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 0
    Width = 661
    Height = 49
    DataSource = DTSEntrada
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel]
    Align = alTop
    Hints.Strings = (
      'Primeiro registro'
      'Registro anterior'
      'Pr'#243'ximo registro'
      #218'ltimo registro'
      'Inserir registro'
      'Excluir registro'
      'Editar registro'
      'Salvar registro'
      'Cancelar edi'#231#227'o')
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object DBLCBProduto: TDBLookupComboBox
    Left = 8
    Top = 89
    Width = 305
    Height = 21
    DataField = 'COD_PRODUTO'
    DataSource = DTSEntrada
    KeyField = 'COD_PRODUTO'
    ListField = 'DESCRICAO'
    ListSource = DTSProduto
    TabOrder = 1
  end
  object DBEQuantidadeComprada: TDBEdit
    Left = 8
    Top = 153
    Width = 182
    Height = 21
    DataField = 'QTD_COMPRADA'
    DataSource = DTSEntrada
    TabOrder = 2
  end
  object DBEValorUnitario: TDBEdit
    Left = 240
    Top = 153
    Width = 114
    Height = 21
    DataField = 'VALOR_UNITARIO'
    DataSource = DTSEntrada
    TabOrder = 3
  end
  object Imprimir: TBitBtn
    Left = 24
    Top = 199
    Width = 35
    Height = 25
    DoubleBuffered = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
      00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
      8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
      8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
      8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
      03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
      03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
      33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
      33333337FFFF7733333333300000033333333337777773333333}
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 4
    OnClick = ImprimirClick
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 240
    Width = 661
    Height = 145
    Align = alBottom
    DataSource = DTSEntrada
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Descricaoproduto'
        Title.Caption = 'Descric'#227'o do Produto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_ENTRADA'
        Title.Caption = 'DATA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTD_COMPRADA'
        Title.Caption = 'Quantidade Comprada'
        Width = 131
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_UNITARIO'
        Title.Caption = 'Valor'
        Visible = True
      end>
  end
  object MEData: TMaskEdit
    Left = 319
    Top = 89
    Width = 120
    Height = 21
    EditMask = '!99/99/0000;1;_'
    MaxLength = 10
    ReadOnly = True
    TabOrder = 6
    Text = '  /  /    '
  end
  object QUEProduto: TADOQuery
    Connection = FRMPrincipal.DBPrincipal
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT *'
      'FROM PRODUTO')
    Left = 456
    Top = 192
    object QUEProdutoCOD_PRODUTO: TAutoIncField
      FieldName = 'COD_PRODUTO'
      ReadOnly = True
    end
    object QUEProdutoCOD_FORNECEDOR: TIntegerField
      FieldName = 'COD_FORNECEDOR'
    end
    object QUEProdutoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 25
    end
    object QUEProdutoQTD_ESTOQUE: TIntegerField
      FieldName = 'QTD_ESTOQUE'
    end
  end
  object DTSProduto: TDataSource
    DataSet = QUEProduto
    Left = 528
    Top = 192
  end
  object QUEEntrada: TADOQuery
    Connection = FRMPrincipal.DBPrincipal
    CursorType = ctStatic
    AfterInsert = QUEEntradaAfterInsert
    AfterEdit = QUEEntradaAfterEdit
    BeforePost = QUEEntradaBeforePost
    AfterPost = QUEEntradaAfterPost
    AfterScroll = QUEEntradaAfterScroll
    OnCalcFields = QUEEntradaCalcFields
    OnNewRecord = QUEEntradaNewRecord
    Parameters = <>
    SQL.Strings = (
      'SELECT *'
      'FROM ENTRADA')
    Left = 384
    Top = 192
    object QUEEntradaCOD_ENTRADA: TAutoIncField
      FieldName = 'COD_ENTRADA'
      ReadOnly = True
    end
    object QUEEntradaCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
    end
    object QUEEntradaDATA_ENTRADA: TWideStringField
      FieldName = 'DATA_ENTRADA'
      Size = 10
    end
    object QUEEntradaQTD_COMPRADA: TIntegerField
      FieldName = 'QTD_COMPRADA'
    end
    object QUEEntradaVALOR_UNITARIO: TBCDField
      FieldName = 'VALOR_UNITARIO'
      DisplayFormat = '0.00'
      Precision = 6
      Size = 2
    end
    object QUEEntradaSubtotal: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Subtotal'
      DisplayFormat = 'R$ 0.00'
      Calculated = True
    end
    object QUEEntradaDescricaoproduto: TStringField
      FieldKind = fkLookup
      FieldName = 'Descricaoproduto'
      LookupDataSet = QUEProduto
      LookupKeyFields = 'COD_PRODUTO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'COD_PRODUTO'
      Lookup = True
    end
  end
  object DTSEntrada: TDataSource
    DataSet = QUEEntrada
    Left = 600
    Top = 192
  end
end
