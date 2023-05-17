unit view.pessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Dm, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls,
  Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.Buttons, Vcl.ComCtrls, DB;

type
  TfrmPessoa = class(TForm)
    pnlFundo: TPanel;
    pnlBotoesButton: TPanel;
    btnNovo: TSpeedButton;
    btnEditar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnExcluir: TSpeedButton;
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    edtPesquisa: TEdit;
    btnPesquisa: TBitBtn;
    TabSheet1: TTabSheet;
    Panel2: TPanel;
    lblCadPessoa: TLabel;
    edtData: TDBEdit;
    lblData: TLabel;
    edtCod: TDBText;
    lblCodigo: TLabel;
    lblNome: TLabel;
    edtNome: TDBEdit;
    edtSobrenome: TDBEdit;
    lblSobrenome: TLabel;
    edtDoc: TDBEdit;
    lblCPF: TLabel;
    rgTipoPessoa: TDBRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
    procedure edtPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure PageControl1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    procedure pesquisarGrid;
    procedure desativarBotoes;
    procedure ativarBotoes;

  public
    { Public declarations }
  end;

var
  frmPessoa: TfrmPessoa;

implementation

{$R *.dfm}

procedure TfrmPessoa.ativarBotoes;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TSpeedButton then
      TSpeedButton(Components[i]).Visible := True;
  end;
end;

procedure TfrmPessoa.btnCancelarClick(Sender: TObject);
begin
  ativarBotoes;
  if DmCon.QryPessoas.State in dsEditModes then
    DmCon.QryPessoas.Cancel;
  PageControl1.TabIndex := 1;
  btnSalvar.Visible := False;
end;

procedure TfrmPessoa.btnEditarClick(Sender: TObject);
begin
  desativarBotoes;
  if DmCon.QryPessoas.State = dsBrowse then
    PageControl1.TabIndex := 0;
  DmCon.QryPessoas.Edit;
  edtDoc.SetFocus;

end;

procedure TfrmPessoa.btnExcluirClick(Sender: TObject);
var
  aviso: integer;
begin
  Application.Title := 'Aten��o!';
  aviso := Application.MessageBox('Deseja mesmo excluir o registro? ',
    'Aten��o', MB_YESNO + MB_DEFBUTTON2 + MB_ICONQUESTION);
  if aviso <> IDNO then
    DmCon.QryPessoas.Delete;
  PageControl1.TabIndex := 1;
end;

procedure TfrmPessoa.btnNovoClick(Sender: TObject);
var
  regist: integer;
begin
  desativarBotoes;
  PageControl1.TabIndex := 0;
  DmCon.QryPessoas.Last;
  regist := DmCon.QryPessoasIDPESSOA.AsInteger + 1;
  DmCon.QryPessoas.Append;
  DmCon.QryPessoasIDPESSOA.AsInteger := regist;

  // receber a data atual
  DmCon.QryPessoasDTREGISTRO.AsDateTime := Now;
  edtDoc.SetFocus;
end;

procedure TfrmPessoa.btnPesquisaClick(Sender: TObject);
begin
  pesquisarGrid;
end;

procedure TfrmPessoa.btnSalvarClick(Sender: TObject);
begin
  try
    DmCon.QryPessoas.Post;
    MessageDlg('Registro salvo com sucesso!', mtInformation, [mbOK], 0);
    PageControl1.TabIndex := 1;
    ativarBotoes;
    btnSalvar.Visible := False;
except
    on E: EDatabaseError do
      begin
        Application.Title := 'Aten��o!';
        ShowMessage('Algum campo obrigat�rio n�o foi preenchido.'+#13+'Tente Novamente!');
      end;
    end;
end;

procedure TfrmPessoa.desativarBotoes;
begin
  btnNovo.Visible := False;
  btnEditar.Visible := False;
  btnExcluir.Visible := False;
  btnCancelar.Visible := True;
  btnSalvar.Visible := True;

end;

procedure TfrmPessoa.edtPesquisaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    pesquisarGrid;
end;

procedure TfrmPessoa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    if not DmCon.QryPessoas.Active then
    DmCon.QryPessoas.Active := False;
end;

procedure TfrmPessoa.FormCreate(Sender: TObject);
begin
  if not DmCon.QryPessoas.Active then
    DmCon.QryPessoas.Active := True;
  PageControl1.TabIndex := 0;
  btnSalvar.Visible := False;

end;

procedure TfrmPessoa.PageControl1Change(Sender: TObject);
begin
  if PageControl1.TabIndex = 1 then
    btnSalvar.Visible := False;
end;

procedure TfrmPessoa.pesquisarGrid;
begin
  DmCon.QryPessoas.Filtered := False;
  DmCon.QryPessoas.IndexFieldNames := DBGrid1.SelectedField.FieldName;
  DmCon.QryPessoas.FindNearest([edtPesquisa.Text]);
end;

end.
