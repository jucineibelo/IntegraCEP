program Desbrava;

uses
  Vcl.Forms,
  view.pessoa in 'src\views\view.pessoa.pas' {frmPessoa},
  Dm in 'src\services\Dm.pas' {DmCon: TDataModule},
  view.principal in 'src\views\view.principal.pas' {frmPrincipal},
  view.enderecos in 'src\views\view.enderecos.pas' {frmEndereco},
  Vcl.Themes,
  Vcl.Styles,
  dm.integra in 'src\services\dm.integra.pas' {DmIntegra: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDmCon, DmCon);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TDmIntegra, DmIntegra);
  Application.Run;
end.
