unit view.principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Menus, Vcl.Imaging.pngimage, Dm, view.pessoa,
  view.enderecos;

type
  TfrmPrincipal = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel5: TPanel;
    btnPessoa: TBitBtn;
    btnEndereco: TBitBtn;
    BitBtn3: TBitBtn;
    Panel3: TPanel;
    lblBusca: TLabel;
    Image1: TImage;
    procedure btnFecharClick(Sender: TObject);
    procedure btnPessoaClick(Sender: TObject);
    procedure btnEnderecoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnPessoaClick(Sender: TObject);
begin
  frmPessoa := TfrmPessoa.Create(Self);
  try
    frmPessoa.ShowModal;
  finally
    FreeAndNil(frmPessoa);
   end;

end;

procedure TfrmPrincipal.btnEnderecoClick(Sender: TObject);
begin
    frmEndereco := TfrmEndereco.Create(Self);
  try
    frmEndereco.ShowModal;
  finally
    FreeAndNil(frmEndereco);
   end;

end;

procedure TfrmPrincipal.btnFecharClick(Sender: TObject);
begin
  Close;
end;

end.
