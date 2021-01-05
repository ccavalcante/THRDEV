unit uControllerCliente;

interface

uses
  uCliente;
type

  TControllerCliente = Class (TClienteAbstract)
    public
      procedure PesquisarCliente(iNome: String);
      procedure CarregarCodigoCliente(iNome: String);
      procedure CarregarClientePesquisa(iCliente: TClienteAbstract; iCodigo: Integer);
      function CarregarCliente(iCliente: TClienteAbstract): Boolean;
      function InserirRegistoCliente(iCliente: TClienteAbstract; out sErro: String): Boolean;
      function AlterarCliente(iCliente: TClienteAbstract; out sErro: String): Boolean;
      function ExcluirCliente(iCodigo: Integer; out sErro: String): Boolean;
  End;

implementation

uses
  udmClientes, System.SysUtils;

{ TControllerCliente }

function TControllerCliente.AlterarCliente(iCliente: TClienteAbstract;
  out sErro: String): Boolean;
begin
  Result := dmClientes.AlterarCliente(iCliente,sErro);
end;

function TControllerCliente.CarregarCliente(
  iCliente: TClienteAbstract): Boolean;
begin
  Result := dmClientes.CarregarCliente(iCliente);
end;

procedure TControllerCliente.CarregarClientePesquisa(iCliente: TClienteAbstract;
  iCodigo: Integer);
begin
  dmClientes.CarregarClientePesquisa(iCliente, iCodigo);
end;

procedure TControllerCliente.CarregarCodigoCliente(iNome: String);
begin
   dmClientes.PesquisarCliente(iNome);
end;

function TControllerCliente.ExcluirCliente(iCodigo: Integer;
  out sErro: String): Boolean;
begin
  Result := dmClientes.ExcluirCliente(iCodigo, sErro);
end;

function TControllerCliente.InserirRegistoCliente(iCliente: TClienteAbstract;
  out sErro: String): Boolean;
begin
  Result := dmClientes.InserirRegistoCliente(iCliente, sErro);
end;

procedure TControllerCliente.PesquisarCliente(iNome: String);
begin
   dmClientes.PesquisarCliente(iNome);
end;

end.
