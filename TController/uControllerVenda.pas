unit uControllerVenda;

interface

uses
  uAbstractVendas;
type
  TControllerVenda = class (TAbstractVendas)
    public

      procedure CarregarCliente(iVendas: TAbstractVendas; iDCliente: Integer);
      procedure CarregarProduto(iVendas: TAbstractVendas; iDProduto: Integer);
      procedure carregarRelatorio(iVendas: TAbstractVendas; IDVendas: Integer);
      procedure PesquisarVendas(iCodigo: Integer; iData: TDATE);
      function InserirVendas(iVendas: TAbstractVendas; out sErro: string): Boolean;
      function ExcluirVendas(iCodigo: Integer; out sErro: String): Boolean;
      function InserirItensVenda(iVendas: TAbstractVendas; out sErro: String): Boolean;

  end;

implementation

uses
  udmVendas;

{ TControllerVenda }

function TControllerVenda.ExcluirVendas(iCodigo: Integer;
  out sErro: String): Boolean;
begin
  Result := dmVendas.ExcluirVendas(iCodigo,sErro);
end;

function TControllerVenda.InserirItensVenda(iVendas: TAbstractVendas;
  out sErro: String): Boolean;
begin
  Result := dmVendas.InserirItensVenda(iVendas, sErro);
end;

function TControllerVenda.InserirVendas(iVendas: TAbstractVendas;
  out sErro: string): Boolean;
begin
  Result := dmVendas.InserirVendas(iVendas,sErro)
end;

procedure TControllerVenda.CarregarCliente(iVendas: TAbstractVendas;
  iDCliente: Integer);
begin
  dmVendas.CarregarCliente(iVendas,iDCliente);
end;

procedure TControllerVenda.CarregarProduto(iVendas: TAbstractVendas;
  iDProduto: Integer);
begin
  dmVendas.CarregarProduto(iVendas,IDProduto);
end;


procedure TControllerVenda.carregarRelatorio(iVendas: TAbstractVendas;
  IDVendas: Integer);
begin
  dmVendas.carregarRelatorio(iVendas,IDVendas);
end;

procedure TControllerVenda.PesquisarVendas(iCodigo: Integer; iDATA: TDATE);
begin
  dmVendas.PesquisarVendas(iCodigo, iDATA);
end;

end.
