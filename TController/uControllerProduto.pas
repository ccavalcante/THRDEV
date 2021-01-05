unit uControllerProduto;

interface

uses
  uAbstractProduto;
 type
  TControllerProduto = Class (TAbstractProdutos)
  public
    procedure PesquisarProduto(iDescricao: String);
    procedure CarregarProdutoPesquisa(iProduto: TAbstractProdutos; iCodigo: Integer);
    function InserirRegistoProduto(iProduto: TAbstractProdutos; out sErro: String): Boolean;
    function AlterarProduto(iProduto: TAbstractProdutos; out sErro: String): Boolean;
    function ExcluirProduto(iCodigo: Integer; out sErro: String): Boolean;

 End;


implementation

uses
  udmProdutos, System.SysUtils;

{ TControllerProduto }

function TControllerProduto.AlterarProduto(iProduto: TAbstractProdutos;
  out sErro: String): Boolean;
begin
  Result := dmProdutos.AlterarProduto(iProduto, sErro);
end;

procedure TControllerProduto.CarregarProdutoPesquisa(
  iProduto: TAbstractProdutos; iCodigo: Integer);
begin
  dmProdutos.CarregarProdutoPesquisa(iProduto,iCodigo);
end;

function TControllerProduto.ExcluirProduto(iCodigo: Integer;
  out sErro: String): Boolean;
begin
  Result := dmProdutos.ExcluirProduto(iCodigo, sErro);
end;

function TControllerProduto.InserirRegistoProduto(iProduto: TAbstractProdutos;
  out sErro: String): Boolean;
begin
  Result := dmProdutos.InserirRegistoProduto(iProduto, sErro);
end;

procedure TControllerProduto.PesquisarProduto(iDescricao: String);
begin
  dmProdutos.PesquisarProduto(iDescricao);
end;

end.
