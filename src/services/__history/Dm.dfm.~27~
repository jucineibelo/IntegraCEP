object DmCon: TDmCon
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 325
  Width = 306
  object FDConexao: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\User-J\Desktop\DESBRAVADOR\Banco de Dados\DADO' +
        'S.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'Port=3050'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 40
    Top = 32
  end
  object QryPessoas: TFDQuery
    Connection = FDConexao
    SQL.Strings = (
      'select * from pessoa')
    Left = 40
    Top = 96
    object QryPessoasIDPESSOA: TIntegerField
      FieldName = 'IDPESSOA'
      Origin = 'IDPESSOA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
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
      EditMask = '!99/99/0000;1;_'
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
      'select * from endereco')
    Left = 32
    Top = 176
    object QryEnderecoIDENDERECO: TIntegerField
      FieldName = 'IDENDERECO'
      Origin = 'IDENDERECO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
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
  end
  object dsEndereco: TDataSource
    DataSet = QryEndereco
    Left = 136
    Top = 176
  end
end
