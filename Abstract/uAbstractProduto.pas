unit uAbstractProduto;

interface

type
  TAbstractProdutos = class
  private
    FValor: String;
    FDescricao: String;
    FQuantidade: String;
    FIDProduto: Integer;
    procedure SetDescricao(const Value: String);
    procedure SetQuantidade(const Value: String);
    procedure SetValor(const Value: String);
    procedure SetIDProduto(const Value: Integer);
  public
    property IDProduto: Integer read FIDProduto write SetIDProduto;
    property Descricao: String read FDescricao write SetDescricao;
    property Quantidade: String read FQuantidade write SetQuantidade;
    property Valor: String read FValor write SetValor;

  end;

implementation

{ TAbstractProdutos }

procedure TAbstractProdutos.SetDescricao(const Value: String);
begin
  FDescricao := Value;
end;

procedure TAbstractProdutos.SetIDProduto(const Value: Integer);
begin
  FIDProduto := Value;
end;

procedure TAbstractProdutos.SetQuantidade(const Value: String);
begin
  FQuantidade := Value;
end;

procedure TAbstractProdutos.SetValor(const Value: String);
begin
  FValor := Value;
end;

end.
