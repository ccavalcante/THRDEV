unit uCliente;

interface


type

  TClienteAbstract = Class
    private
      FNomePai: String;
      FEmail: String;
      FDocumento2: String;
      FFNome: string;
      FDocumento: String;
      FNomeMae: String;
      FTelefone: String;
      FCelular: String;
      FIdCliente: Integer;
      procedure SetCelular(const Value: String);
      procedure SetDocumento(const Value: String);
      procedure SetDocumento2(const Value: String);
      procedure SetEmail(const Value: String);
      procedure SetFNome(const Value: string);
      procedure SetNomeMae(const Value: String);
      procedure SetNomePai(const Value: String);
      procedure SetTelefone(const Value: String);
      procedure SetFIdCliente(const Value: Integer);

    public
      property IdCliente: Integer read FIdCliente write SetFIdCliente;
      property Nome: string read FFNome write SetFNome;
      property Documento: String read FDocumento write SetDocumento;
      property Documento2: String read FDocumento2 write SetDocumento2;
      property Telefone: String read FTelefone write SetTelefone;
      property Celular: String read FCelular write SetCelular;
      property Email: String read FEmail write SetEmail;
      property NomeMae: String read FNomeMae write SetNomeMae;
      property NomePai: String read FNomePai write SetNomePai;

  End;


implementation

{ Cliente }

procedure TClienteAbstract.SetCelular(const Value: String);
begin
  FCelular := Value;
end;

procedure TClienteAbstract.SetDocumento(const Value: String);
begin
  FDocumento := Value;
end;

procedure TClienteAbstract.SetDocumento2(const Value: String);
begin
  FDocumento2 := Value;
end;

procedure TClienteAbstract.SetEmail(const Value: String);
begin
  FEmail := Value;
end;

procedure TClienteAbstract.SetFIdCliente(const Value: Integer);
begin
  FIdCliente := Value;
end;

procedure TClienteAbstract.SetFNome(const Value: string);
begin
  FFNome := Value;
end;

procedure TClienteAbstract.SetNomeMae(const Value: String);
begin
  FNomeMae := Value;
end;

procedure TClienteAbstract.SetNomePai(const Value: String);
begin
  FNomePai := Value;
end;

procedure TClienteAbstract.SetTelefone(const Value: String);
begin
  FTelefone := Value;
end;

end.
