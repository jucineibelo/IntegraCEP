unit Dm;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.VCLUI.Wait, FireDAC.Comp.UI, Inifiles;

type
  TDmCon = class(TDataModule)
    FDConexao: TFDConnection;
    QryPessoas: TFDQuery;
    QryPessoasIDPESSOA: TIntegerField;
    QryPessoasFLNATUREZA: TIntegerField;
    QryPessoasDSDOCUMENTO: TStringField;
    QryPessoasNMPRIMEIRO: TStringField;
    QryPessoasNMSEGUNDO: TStringField;
    QryPessoasDTREGISTRO: TDateField;
    dsPessoas: TDataSource;
    WaitCursor: TFDGUIxWaitCursor;
    QryEndereco: TFDQuery;
    dsEndereco: TDataSource;
    QryEnderecoIDENDERECO: TIntegerField;
    QryEnderecoIDPESSOA: TIntegerField;
    QryEnderecoDSCEP: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    function caminhDoConfigTxt: string;
  public
    { Public declarations }
  end;

var
  DmCon: TDmCon;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

function TDmCon.caminhDoConfigTxt: string;
  var
  ini: Tinifile;
  path: string;
begin
  ini := Tinifile.Create(ExtractFilePath(ParamStr(0)) + '\Config.ini');
  path := ini.ReadString('BASE', 'BASE', 'DESBRAVA');
  result := path;
end;

procedure TDmCon.DataModuleCreate(Sender: TObject);

  begin
  with FDConexao do
  begin
    Close;
    Params.Values['DataBase'] := caminhDoConfigTxt;
    Open;
  end;
end;

end.
