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
  FireDAC.UI.Intf, FireDAC.VCLUI.Wait, FireDAC.Comp.UI;

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
    procedure btnNovoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
    procedure edtPesquisaKeyPress(Sender: TObject; var Key: Char);
  private

    procedure pesquisarGrid;
    procedure desativarBotoes;
    procedure ativarBotoes;

  public
    { Public declarations }
  end;

var
  frmEndereco: TfrmEndereco;

implementation

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

procedure TfrmEndereco.btnCancelarClick(Sender: TObject);
begin
  ativarBotoes;
  if DmCon.QryEndereco.State in dsEditModes then
    DmCon.QryEndereco.Cancel;
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
  PageControl1.TabIndex := 1;
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

procedure TfrmEndereco.btnPesquisaClick(Sender: TObject);
begin
  pesquisarGrid;
end;

procedure TfrmEndereco.btnSalvarClick(Sender: TObject);
begin
  DmCon.QryEndereco.Post;
  MessageDlg('Registro salvo com sucesso!', mtInformation, [mbOK], 0);
  PageControl1.TabIndex := 2;
  ativarBotoes;
  btnSalvar.Visible := False;

end;

procedure TfrmEndereco.desativarBotoes;
begin
  btnNovo.Visible := False;
  btnEditar.Visible := False;
  btnExcluir.Visible := False;
  btnCancelar.Visible := True;
  btnSalvar.Visible := True;

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
  PageControl1.TabIndex := 0;
  btnSalvar.Visible := False;
end;

procedure TfrmEndereco.pesquisarGrid;
begin
  DmCon.QryPessoas.Filtered := False;
  DmCon.QryPessoas.IndexFieldNames := DBGrid1.SelectedField.FieldName;
  DmCon.QryPessoas.FindNearest([edtPesquisa.Text]);

end;

end.