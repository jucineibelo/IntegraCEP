object DmCon: TDmCon
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 325
  Width = 306
  object FDConexao: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\User-J\Desktop\Projetos\Projetos Delphi\Integr' +
        'aCEP\Banco de Dados\DADOS.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'Port=3050'
      'DriverID=FB')
    LoginPrompt = False
    Left = 40
    Top = 32
  end
  object QryPessoas: TFDQuery
    Connection = FDConexao
    SQL.Strings = (
      'select p.* from pessoa p ')
    Left = 40
    Top = 96
    object QryPessoasIDPESSOA: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'IDPESSOA'
      Origin = 'IDPESSOA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object QryPessoasFLNATUREZA: TIntegerField
      FieldName = 'FLNATUREZA'
      Origin = 'FLNATUREZA'
      Required = True
    end
    object QryPessoasDSDOCUMENTO: TStringField
      FieldName = 'DSDOCUMENTO'
      Origin = 'DSDOCUMENTO'
      Required = True
    end
    object QryPessoasNMPRIMEIRO: TStringField
      FieldName = 'NMPRIMEIRO'
      Origin = 'NMPRIMEIRO'
      Required = True
      Size = 100
    end
    object QryPessoasNMSEGUNDO: TStringField
      FieldName = 'NMSEGUNDO'
      Origin = 'NMSEGUNDO'
      Required = True
      Size = 100
    end
    object QryPessoasDTREGISTRO: TDateField
      FieldName = 'DTREGISTRO'
      Origin = 'DTREGISTRO'
    end
  end
  object dsPessoas: TDataSource
    DataSet = QryPessoas
    Left = 136
    Top = 96
  end
  object WaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 136
    Top = 32
  end
  object QryEndereco: TFDQuery
    Connection = FDConexao
    SQL.Strings = (
      'select e.*, p.nmprimeiro from endereco e'
      'left join pessoa p on (e.idpessoa = p.idpessoa)')
    Left = 40
    Top = 168
    object QryEnderecoIDENDERECO: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'IDENDERECO'
      Origin = 'IDENDERECO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object QryEnderecoIDPESSOA: TIntegerField
      FieldName = 'IDPESSOA'
      Origin = 'IDPESSOA'
      Required = True
    end
    object QryEnderecoDSCEP: TStringField
      FieldName = 'DSCEP'
      Origin = 'DSCEP'
      Size = 15
    end
    object QryEnderecoNMPRIMEIRO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NMPRIMEIRO'
      Origin = 'NMPRIMEIRO'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
  end
  object dsEndereco: TDataSource
    DataSet = QryEndereco
    Left = 136
    Top = 168
  end
  object QryIntegracao: TFDQuery
    Connection = FDConexao
    SQL.Strings = (
      'select * from endereco_integracao')
    Left = 40
    Top = 240
    object QryIntegracaoIDENDERECO: TIntegerField
      FieldName = 'IDENDERECO'
      Origin = 'IDENDERECO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QryIntegracaoDSUF: TStringField
      FieldName = 'DSUF'
      Origin = 'DSUF'
      Size = 50
    end
    object QryIntegracaoNMCIDADE: TStringField
      FieldName = 'NMCIDADE'
      Origin = 'NMCIDADE'
      Size = 100
    end
    object QryIntegracaoNMBAIRRO: TStringField
      FieldName = 'NMBAIRRO'
      Origin = 'NMBAIRRO'
      Size = 50
    end
    object QryIntegracaoNMLOGRADOURO: TStringField
      FieldName = 'NMLOGRADOURO'
      Origin = 'NMLOGRADOURO'
      Size = 100
    end
    object QryIntegracaoDSCOMPLEMENTO: TStringField
      FieldName = 'DSCOMPLEMENTO'
      Origin = 'DSCOMPLEMENTO'
      Size = 100
    end
  end
  object dsIntegracao: TDataSource
    DataSet = QryIntegracao
    Left = 136
    Top = 240
  end
end
