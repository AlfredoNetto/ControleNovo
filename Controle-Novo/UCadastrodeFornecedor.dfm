object FRMCadFornecedor: TFRMCadFornecedor
  Left = 0
  Top = 0
  Caption = 'Cadastro De Fornecedor'
  ClientHeight = 264
  ClientWidth = 720
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
  object Label1: TLabel
    Left = 8
    Top = 64
    Width = 199
    Height = 23
    Caption = 'Nome do Fornecedor'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 360
    Top = 64
    Width = 82
    Height = 23
    Caption = 'Telefone'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 128
    Width = 88
    Height = 23
    Caption = 'Endere'#231'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 197
    Width = 65
    Height = 23
    Caption = 'Cidade'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 360
    Top = 197
    Width = 65
    Height = 23
    Caption = 'Estado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object IMAGEFORNECEDOR: TImage
    Left = 586
    Top = 69
    Width = 105
    Height = 105
    Stretch = True
  end
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 0
    Width = 720
    Height = 49
    DataSource = DTSFornecedor
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
  object DBENome: TDBEdit
    Left = 8
    Top = 89
    Width = 321
    Height = 21
    DataField = 'NOME'
    DataSource = DTSFornecedor
    TabOrder = 1
  end
  object DBETelefone: TDBEdit
    Left = 360
    Top = 89
    Width = 138
    Height = 21
    DataField = 'TELEFONE'
    DataSource = DTSFornecedor
    TabOrder = 2
  end
  object DBEEndereco: TDBEdit
    Left = 8
    Top = 153
    Width = 490
    Height = 21
    DataField = 'ENDERECO'
    DataSource = DTSFornecedor
    TabOrder = 3
  end
  object DBECidade: TDBEdit
    Left = 8
    Top = 222
    Width = 321
    Height = 21
    DataField = 'CIDADE'
    DataSource = DTSFornecedor
    TabOrder = 4
  end
  object DBCBEstado: TDBComboBox
    Left = 360
    Top = 222
    Width = 138
    Height = 21
    Style = csDropDownList
    DataField = 'ESTADO'
    DataSource = DTSFornecedor
    ItemHeight = 13
    Items.Strings = (
      'AC'
      'AL'
      'AM'
      'AP'
      'BA'
      'CE'
      'DF'
      'ES'
      'GO'
      'MA'
      'MG'
      'MS'
      'MT'
      'PA'
      'PB'
      'PE'
      'PI'
      'PR'
      'RJ'
      'RN'
      'RO'
      'RR'
      'RS'
      'SC'
      'SE'
      'SP'
      'TO')
    Sorted = True
    TabOrder = 5
  end
  object BTNCarregarimg: TButton
    Left = 586
    Top = 180
    Width = 105
    Height = 25
    Caption = 'Carregar Imagem'
    TabOrder = 6
    OnClick = BTNCarregarimgClick
  end
  object BTNLimparImg: TButton
    Left = 586
    Top = 211
    Width = 105
    Height = 25
    Caption = 'Limpar imagem'
    TabOrder = 7
    OnClick = BTNLimparImgClick
  end
  object BitBtn1: TBitBtn
    Left = 463
    Top = 58
    Width = 35
    Height = 25
    DoubleBuffered = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
      0003377777777777777308888888888888807F33333333333337088888888888
      88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
      8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
      8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
      03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
      03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
      33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
      33333337FFFF7733333333300000033333333337777773333333}
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 8
    OnClick = BitBtn1Click
  end
  object DTSFornecedor: TDataSource
    DataSet = QUEFornecedor
    Left = 528
    Top = 112
  end
  object OPDBuscaImage: TOpenPictureDialog
    Left = 528
    Top = 160
  end
  object QUEFornecedor: TADOQuery
    Connection = FRMPrincipal.DBPrincipal
    CursorType = ctStatic
    BeforePost = QUEFornecedorBeforePost
    Parameters = <>
    SQL.Strings = (
      'SELECT*'
      'FROM FORNECEDOR')
    Left = 528
    Top = 64
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
    object QUEFornecedorPATH: TStringField
      FieldName = 'PATH'
      Size = 200
    end
  end
end
