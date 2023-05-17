object frmPessoa: TfrmPessoa
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Pessoas'
  ClientHeight = 381
  ClientWidth = 676
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlFundo: TPanel
    Left = 0
    Top = 0
    Width = 676
    Height = 381
    Align = alClient
    BevelOuter = bvNone
    Color = 16770250
    ParentBackground = False
    TabOrder = 0
    object pnlBotoesButton: TPanel
      Left = 0
      Top = 330
      Width = 676
      Height = 51
      Align = alBottom
      BevelOuter = bvNone
      Color = 10975773
      ParentBackground = False
      TabOrder = 1
      object btnNovo: TSpeedButton
        AlignWithMargins = True
        Left = 238
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
        Left = 321
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
        Left = 404
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
        Left = 513
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
        Left = 596
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
      Width = 676
      Height = 330
      ActivePage = TabSheet2
      Align = alClient
      TabOrder = 0
      OnChange = PageControl1Change
      object TabSheet1: TTabSheet
        Caption = 'Cadastro'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 668
          Height = 302
          Align = alClient
          BevelOuter = bvNone
          Color = 16770250
          ParentBackground = False
          TabOrder = 0
          object lblCadPessoa: TLabel
            Left = 234
            Top = 37
            Width = 186
            Height = 21
            Caption = 'CADASTRO DE PESSOAS '
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblData: TLabel
            Left = 207
            Top = 101
            Width = 85
            Height = 13
            Caption = 'Data do Registro:'
            FocusControl = edtData
          end
          object edtCod: TDBText
            Left = 111
            Top = 123
            Width = 49
            Height = 17
            DataField = 'IDPESSOA'
            DataSource = DmCon.dsPessoas
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblCodigo: TLabel
            Left = 111
            Top = 101
            Width = 37
            Height = 13
            Caption = 'C'#243'digo:'
          end
          object lblNome: TLabel
            Left = 111
            Top = 160
            Width = 27
            Height = 13
            Caption = 'Nome'
            FocusControl = edtNome
          end
          object lblSobrenome: TLabel
            Left = 365
            Top = 160
            Width = 90
            Height = 13
            Caption = 'Fantasia/2'#186' Nome:'
            FocusControl = edtSobrenome
          end
          object lblCPF: TLabel
            Left = 430
            Top = 101
            Width = 54
            Height = 13
            Caption = 'Documento'
            FocusControl = edtDoc
          end
          object edtData: TDBEdit
            Left = 207
            Top = 120
            Width = 113
            Height = 21
            DataField = 'DTREGISTRO'
            DataSource = DmCon.dsPessoas
            TabOrder = 0
          end
          object edtNome: TDBEdit
            Left = 111
            Top = 179
            Width = 180
            Height = 21
            DataField = 'NMPRIMEIRO'
            DataSource = DmCon.dsPessoas
            TabOrder = 3
          end
          object edtSobrenome: TDBEdit
            Left = 365
            Top = 179
            Width = 199
            Height = 21
            DataField = 'NMSEGUNDO'
            DataSource = DmCon.dsPessoas
            TabOrder = 4
          end
          object edtDoc: TDBEdit
            Left = 430
            Top = 120
            Width = 135
            Height = 21
            DataField = 'DSDOCUMENTO'
            DataSource = DmCon.dsPessoas
            TabOrder = 1
          end
          object rgTipoPessoa: TDBRadioGroup
            Left = 0
            Top = 0
            Width = 185
            Height = 42
            Columns = 2
            DataField = 'FLNATUREZA'
            DataSource = DmCon.dsPessoas
            Items.Strings = (
              'Fisica'
              'Jur'#237'dica')
            TabOrder = 2
            Values.Strings = (
              '1'
              '2')
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Consulta'
        ImageIndex = 1
        object DBGrid1: TDBGrid
          Left = 0
          Top = 43
          Width = 668
          Height = 259
          Align = alClient
          DataSource = DmCon.dsPessoas
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'IDPESSOA'
              Title.Caption = 'C'#243'digo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DSDOCUMENTO'
              Title.Caption = 'Documento'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NMPRIMEIRO'
              Title.Caption = 'Nome'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTREGISTRO'
              Title.Caption = 'Data do Registro'
              Width = 100
              Visible = True
            end>
        end
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 668
          Height = 43
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
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
      end
    end
  end
end
