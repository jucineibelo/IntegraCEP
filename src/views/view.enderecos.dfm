object frmEndereco: TfrmEndereco
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Endere'#231'o'
  ClientHeight = 453
  ClientWidth = 683
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlFundo: TPanel
    Left = 0
    Top = 0
    Width = 683
    Height = 453
    Align = alClient
    BevelOuter = bvNone
    Color = 16770250
    ParentBackground = False
    TabOrder = 0
    object pnlBotoesButton: TPanel
      Left = 0
      Top = 402
      Width = 683
      Height = 51
      Align = alBottom
      BevelOuter = bvNone
      Color = 10975773
      ParentBackground = False
      TabOrder = 1
      object btnNovo: TSpeedButton
        AlignWithMargins = True
        Left = 245
        Top = 3
        Width = 77
        Height = 45
        Cursor = crHandPoint
        Align = alRight
        AllowAllUp = True
        GroupIndex = 1
        Caption = '[ NOVO ]'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = btnNovoClick
        ExplicitLeft = 228
        ExplicitTop = 0
        ExplicitHeight = 34
      end
      object btnEditar: TSpeedButton
        AlignWithMargins = True
        Left = 328
        Top = 3
        Width = 77
        Height = 45
        Cursor = crHandPoint
        Align = alRight
        AllowAllUp = True
        GroupIndex = 1
        Caption = '[ EDITAR ]'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = btnEditarClick
        ExplicitLeft = 215
        ExplicitTop = 0
        ExplicitHeight = 34
      end
      object btnCancelar: TSpeedButton
        AlignWithMargins = True
        Left = 411
        Top = 3
        Width = 103
        Height = 45
        Cursor = crHandPoint
        Align = alRight
        AllowAllUp = True
        GroupIndex = 1
        Caption = '[ CANCELAR ]'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Segoe UI Semibold'
        Font.Pitch = fpFixed
        Font.Style = [fsBold]
        Font.Quality = fqProof
        ParentFont = False
        OnClick = btnCancelarClick
        ExplicitLeft = 298
        ExplicitTop = 0
        ExplicitHeight = 34
      end
      object btnSalvar: TSpeedButton
        AlignWithMargins = True
        Left = 520
        Top = 3
        Width = 77
        Height = 45
        Cursor = crHandPoint
        Align = alRight
        AllowAllUp = True
        GroupIndex = 1
        Caption = '[ SALVAR ]'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = btnSalvarClick
        ExplicitLeft = 490
        ExplicitTop = 0
        ExplicitHeight = 34
      end
      object btnExcluir: TSpeedButton
        AlignWithMargins = True
        Left = 603
        Top = 3
        Width = 77
        Height = 45
        Cursor = crHandPoint
        Align = alRight
        AllowAllUp = True
        GroupIndex = 1
        Caption = '[ EXCLUIR ]'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = btnExcluirClick
        ExplicitLeft = 490
        ExplicitTop = 0
        ExplicitHeight = 34
      end
    end
    object PageControl1: TPageControl
      Left = 0
      Top = 0
      Width = 683
      Height = 402
      ActivePage = TabSheet3
      Align = alClient
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'Cadastro'
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 675
          Height = 374
          Align = alClient
          BevelOuter = bvNone
          Color = 16770250
          ParentBackground = False
          TabOrder = 0
          object lblCadPessoa: TLabel
            Left = 230
            Top = 29
            Width = 206
            Height = 21
            Caption = 'CADASTRO DE ENDERE'#199'OS'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblCod: TLabel
            Left = 125
            Top = 131
            Width = 37
            Height = 13
            Caption = 'C'#243'digo:'
          end
          object lblPessoa: TLabel
            Left = 241
            Top = 131
            Width = 38
            Height = 13
            Caption = 'Pessoa:'
          end
          object lblCep: TLabel
            Left = 433
            Top = 131
            Width = 23
            Height = 13
            Caption = 'CEP:'
            FocusControl = edtCep
          end
          object DBTextCod: TDBText
            Left = 125
            Top = 153
            Width = 65
            Height = 17
            DataField = 'IDENDERECO'
            DataSource = DmCon.dsEndereco
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object edtCep: TDBEdit
            Left = 433
            Top = 150
            Width = 129
            Height = 21
            DataField = 'DSCEP'
            DataSource = DmCon.dsEndereco
            TabOrder = 0
          end
          object lookupPessoa: TDBLookupComboBox
            Left = 241
            Top = 150
            Width = 149
            Height = 21
            BevelInner = bvNone
            BevelOuter = bvNone
            DataField = 'IDPESSOA'
            DataSource = DmCon.dsEndereco
            KeyField = 'IDPESSOA'
            ListField = 'NMPRIMEIRO'
            ListSource = DmCon.dsPessoas
            TabOrder = 1
          end
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'CEP'
        ImageIndex = 2
      end
      object TabSheet2: TTabSheet
        Caption = 'Consulta'
        ImageIndex = 1
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 675
          Height = 43
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object edtPesquisa: TEdit
            Left = 4
            Top = 3
            Width = 538
            Height = 21
            TabOrder = 0
            TextHint = 'Digite aqui sua busca'
            OnKeyPress = edtPesquisaKeyPress
          end
          object btnPesquisa: TBitBtn
            Left = 561
            Top = 3
            Width = 92
            Height = 21
            Caption = 'Pesquisar'
            TabOrder = 1
            OnClick = btnPesquisaClick
          end
        end
        object DBGrid1: TDBGrid
          Left = 0
          Top = 43
          Width = 675
          Height = 331
          Align = alClient
          DataSource = DmCon.dsEndereco
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'IDENDERECO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IDPESSOA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DSCEP'
              Visible = True
            end>
        end
      end
    end
  end
end