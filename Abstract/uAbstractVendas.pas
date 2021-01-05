unit uAbstractVendas;

interface

uses
  System.SysUtils, System.DateUtils;

type
  TAbstractVendas = Class
    private
      FValor: String;
      FDescricao: String;
      FIDProduto: Integer;
      FValorTotal: String;
      FIDCliente: Integer;
      FNome: String;
      FDataVenda: TDateTime;
    FID: Integer;
    FQuantidade: String;
      procedure SetDescricao(const Value: String);
      procedure SetIDCliente(const Value: Integer);
      procedure SetIDProduto(const Value: Integer);
      procedure SetNome(const Value: String);
      procedure SetValor(const Value: String);
      procedure SetValorTotal(const Value: String);
    procedure SetDataVenda(const Value: TDateTime);
    procedure SetID(const Value: Integer);
    procedure SetQuantidade(const Value: String);
    public
      property ID: Integer read FID write SetID;
      property IDCliente: Integer read FIDCliente write SetIDCliente;
      property Nome: String read FNome write SetNome;
      property IDProduto: Integer read FIDProduto write SetIDProduto;
      property Descricao: String read FDescricao write SetDescricao;
      property Valor: String read FValor write SetValor;
      property Quantidade: String read FQuantidade write SetQuantidade;
      property ValorTotal: String read FValorTotal write SetValorTotal;
      property DataVenda: TDateTime read FDataVenda write SetDataVenda;

  End;

implementation

{ TAbstractVendas }

procedure TAbstractVendas.SetDataVenda(const Value: TDateTime);
begin
  FDataVenda := Value;
end;

procedure TAbstractVendas.SetDescricao(const Value: String);
begin
  FDescricao := Value;
end;

procedure TAbstractVendas.SetID(const Value: Integer);
begin
  FID := Value;
end;

procedure TAbstractVendas.SetIDCliente(const Value: Integer);
begin
  FIDCliente := Value;
end;

procedure TAbstractVendas.SetIDProduto(const Value: Integer);
begin
  FIDProduto := Value;
end;

procedure TAbstractVendas.SetNome(const Value: String);
begin
  FNome := Value;
end;

procedure TAbstractVendas.SetQuantidade(const Value: String);
begin
  FQuantidade := Value;
end;

procedure TAbstractVendas.SetValor(const Value: String);
begin
  FValor := Value;
end;

procedure TAbstractVendas.SetValorTotal(const Value: String);
begin
  FValorTotal := Value;
end;

end.
