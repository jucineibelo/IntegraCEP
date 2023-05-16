unit view.enderecos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls,
  Vcl.ExtCtrls, Dm, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.UI.Intf, FireDAC.VCLUI.Wait, FireDAC.Comp.UI, REST.Client;

type
  TfrmEndereco = class(TForm)
    pnlFundo: TPanel;
    pnlBotoesButton: TPanel;
    btnNovo: TSpeedButton;
    btnEditar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnExcluir: TSpeedButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel2: TPanel;
    lblCadPessoa: TLabel;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    edtPesquisa: TEdit;
    btnPesquisa: TBitBtn;
    lblCod: TLabel;
    lblPessoa: TLabel;
    lblCep: TLabel;
    edtCep: TDBEdit;
    DBTextCod: TDBText;
    lookupPessoa: TDBLookupComboBox;
    TabSheet3: TTabSheet;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    lblNome: TLabel;
    lblUF: TLabel;
    edtUF: TDBEdit;
    lblCidade: TLabel;
    edtCidade: TDBEdit;
    lblBairro: TLabel;
    edtBairro: TDBEdit;
    lblLogradouro: TLabel;
    edtLogradouro: TDBEdit;
    lblComplemento: TLabel;
    edtComplemento: TDBEdit;
    lookupNomeIntegracao: TDBLookupComboBox;
    edtCepIntegracao: TDBEdit;
    btnPesquisaCep: TBitBtn;
    BitBtn1: TBitBtn;
    DBNavigator1: TDBNavigator;
    DBNavigator2: TDBNavigator;
    procedure btnNovoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
    procedure edtPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure PageControl1Change(Sender: TObject);
    procedure btnPesquisaCepClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure edtCepKeyPress(Sender: TObject; var Key: Char);
  private

    procedure pesquisarGrid;
    procedure desativarBotoes;
    procedure desativarBotoesAll;
    procedure ativarBotoes;

  public
    { Public declarations }
  end;

var
  frmEndereco: TfrmEndereco;

implementation

uses
  Dm.integra;

{$R *.dfm}
{ TfrmEndereco }

procedure TfrmEndereco.ativarBotoes;

var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TSpeedButton then
      TSpeedButton(Components[i]).Visible := True;
  end;
end;

procedure TfrmEndereco.BitBtn1Click(Sender: TObject);
begin // Salvar tabela integra��o
  try
    DmCon.QryIntegracao.Post;
    DmCon.QryIntegracao.Refresh;
    MessageDlg('Registro salvo com sucesso!', mtInformation, [mbOK], 0);
    PageControl1.TabIndex := 1;
    ativarBotoes;
    btnSalvar.Visible := False;
    PageControl1.TabIndex := 2;
  except
    on E: EDatabaseError do
    begin
      Application.Title := 'Aten��o!';
      ShowMessage('Algum campo obrigat�rio n�o foi preenchido.' + #13 +
        'Tente Novamente!');
    end;
  end;
end;

procedure TfrmEndereco.btnCancelarClick(Sender: TObject);
begin
  ativarBotoes;
  if DmCon.QryEndereco.State in dsEditModes then
    DmCon.QryEndereco.Cancel;

  if DmCon.QryIntegracao.State in dsEditModes then
    DmCon.QryIntegracao.Cancel;

  PageControl1.TabIndex := 2;
  btnSalvar.Visible := False;
end;

procedure TfrmEndereco.btnEditarClick(Sender: TObject);
begin
  desativarBotoes;
  if DmCon.QryEndereco.State = dsBrowse then
    PageControl1.TabIndex := 0;
  DmCon.QryEndereco.Edit;
  edtCep.SetFocus;

end;

procedure TfrmEndereco.btnExcluirClick(Sender: TObject);
var
  aviso: integer;
begin
  Application.Title := 'Aten��o!';
  aviso := Application.MessageBox('Deseja mesmo excluir o registro? ',
    'Aten��o', MB_YESNO + MB_DEFBUTTON2 + MB_ICONQUESTION);
  if aviso <> IDNO then
    DmCon.QryEndereco.Delete;
end;

procedure TfrmEndereco.btnNovoClick(Sender: TObject);
var
  regist: integer;
begin
  desativarBotoes;
  PageControl1.TabIndex := 0;
  DmCon.QryEndereco.Last;
  regist := DmCon.QryEnderecoIDENDERECO.AsInteger + 1;
  DmCon.QryEndereco.Append;
  DmCon.QryEnderecoIDENDERECO.AsInteger := regist;
  edtCep.SetFocus;
end;

procedure TfrmEndereco.btnPesquisaCepClick(Sender: TObject);
begin // Pesquisa na API
  if Length(edtCepIntegracao.Text) <> 8 then
  begin
    ShowMessage('CEP Inv�lido, corrija e tente novamente!');
    Close;
  end;

  if Length(edtCepIntegracao.Text) = 8 then
  try
    DmIntegra.RESTClient1.BaseURL := 'http://viacep.com.br/ws/' + edtCepIntegracao.Text + '/json/';
    DmIntegra.RESTRequest1.Execute;
    // ShowMessage(DmIntegra.RESTResponse1.Content);   <- teste para ver se retornava
    edtCidade.Text := DmIntegra.FDMemTable1.FieldByName('localidade').AsString;
    edtBairro.Text := DmIntegra.FDMemTable1.FieldByName('bairro').AsString;
    edtLogradouro.Text := DmIntegra.FDMemTable1.FieldByName('logradouro').AsString;
    edtComplemento.Text := DmIntegra.FDMemTable1.FieldByName('complemento').AsString;
    edtUF.Text := DmIntegra.FDMemTable1.FieldByName('uf').AsString;
  except
    on E: EDatabaseError do
    begin
      Application.Title := 'Aten��o!';
      ShowMessage('CEP n�o encontrado!');
    end;
  end;
end;

procedure TfrmEndereco.btnPesquisaClick(Sender: TObject);
begin
  pesquisarGrid;
end;

procedure TfrmEndereco.btnSalvarClick(Sender: TObject);
begin
  try
    DmCon.QryEndereco.Post;
    DmCon.QryEndereco.Refresh;
    MessageDlg('Registro salvo com sucesso!', mtInformation, [mbOK], 0);
    PageControl1.TabIndex := 1;
    ativarBotoes;
    btnSalvar.Visible := False;
  except
    on E: EDatabaseError do
    begin
      Application.Title := 'Aten��o!';
      ShowMessage('Algum campo obrigat�rio n�o foi preenchido.' + #13 +
        'Tente Novamente!');
    end;
  end;
  desativarBotoesAll;

end;

procedure TfrmEndereco.desativarBotoes;
begin
  btnNovo.Visible := False;
  btnEditar.Visible := False;
  btnExcluir.Visible := False;
  btnCancelar.Visible := True;
  btnSalvar.Visible := True;

end;

procedure TfrmEndereco.desativarBotoesAll;
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TSpeedButton then
      TSpeedButton(Components[i]).Visible := False;
  end;
end;

procedure TfrmEndereco.edtCepKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8, #13, #27]) then
    Key := #0; //
end;

procedure TfrmEndereco.edtPesquisaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    pesquisarGrid;
end;

procedure TfrmEndereco.FormCreate(Sender: TObject);
begin
  if not DmCon.QryEndereco.Active then
    DmCon.QryEndereco.Active := True;

  if not DmCon.QryPessoas.Active then
    DmCon.QryPessoas.Active := True;

  if not DmCon.QryIntegracao.Active then
    DmCon.QryIntegracao.Active := True;
  PageControl1.TabIndex := 0;
  btnSalvar.Visible := False;
end;

procedure TfrmEndereco.PageControl1Change(Sender: TObject);
var
  i: integer;
begin
  if PageControl1.TabIndex = 0 then
    ativarBotoes;
  if PageControl1.TabIndex = 1 then
    desativarBotoesAll;
  if PageControl1.TabIndex = 2 then
    ativarBotoes;
  btnSalvar.Visible := False;

end;

procedure TfrmEndereco.pesquisarGrid;
begin
  DmCon.QryPessoas.Filtered := False;
  DmCon.QryPessoas.IndexFieldNames := DBGrid1.SelectedField.FieldName;
  DmCon.QryPessoas.FindNearest([edtPesquisa.Text]);

end;

end.
