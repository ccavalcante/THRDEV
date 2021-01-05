unit udmProdutos;

interface

uses
  System.SysUtils, System.Classes, Datasnap.DBClient, Datasnap.Provider,
  Data.Win.ADODB, Data.DB, uAbstractProduto;

type
  TdmProdutos = class(TDataModule)
    qrProdutosInsert: TADOQuery;
    dsPesquisar: TADODataSet;
    dspPesquisar: TDataSetProvider;
    cdsPesquisar: TClientDataSet;
    qrProdExcluir: TADOQuery;
    qrProdUpdate: TADOQuery;
    dsPesquisarIDPRODUTOS: TAutoIncField;
    dsPesquisarDESCRICAO: TStringField;
    dsPesquisarQUANTIDADE: TBCDField;
    dsPesquisarVALOR: TBCDField;
    cdsPesquisarIDPRODUTOS: TAutoIncField;
    cdsPesquisarDESCRICAO: TStringField;
    cdsPesquisarQUANTIDADE: TBCDField;
    cdsPesquisarVALOR: TBCDField;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure PesquisarProduto(iDescricao: String);
    procedure CarregarProdutoPesquisa(iProduto: TAbstractProdutos; iCodigo: Integer);
    function InserirRegistoProduto(iProduto: TAbstractProdutos; out sErro: String): Boolean;
    function AlterarProduto(iProduto: TAbstractProdutos; out sErro: String): Boolean;
    function ExcluirProduto(iCodigo: Integer; out sErro: String): Boolean;
  end;

var
  dmProdutos: TdmProdutos;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uDmConexao;

{$R *.dfm}

{ TdmProdutos }

function TdmProdutos.AlterarProduto(iProduto: TAbstractProdutos;
  out sErro: String): Boolean;
begin
  with qrProdUpdate do
  begin
    Sql.Clear;
    sql.Add('update Produtos' +
            'set DESCRICAO = :DESCRICAO,' +
            'QUANTIDADE = :QUANTIDADE,' +
            'VALOR = :VALOR,' +
            'where (IDPRODUTOS = :IDPRODUTOS)');

    parameters.ParamByName('DESCRICAO').Value := iProduto.Descricao;
    parameters.ParamByName('QUANTIDADE').Value  := iProduto.Quantidade;
    parameters.ParamByName('VALOR').Value := iProduto.Valor;

    try
      execSQL;
      Result := True;
      except on E: exception do
      begin
        sErro := 'Ocorreu um erro ao atualizar os dados do produto!' + sLineBreak + E.Message;
        Result := False;
      end;

    end;
  end;
end;

procedure TdmProdutos.CarregarProdutoPesquisa(iProduto: TAbstractProdutos; iCodigo: Integer);
var
  sqlProduto: TADODATASET;
begin
  sqlProduto := TADODATASET.Create(NIL);
  try
    with sqlProduto do
    begin
      Connection := dmConexao.sqlConexao;
      commandText := 'select * from Produtos where (IDPRODUTOS = ' + inttostr(iCodigo) + ')';
      open;

      iProduto.IDProduto := FieldByName('IDProdutos').AsInteger;
      iProduto.Descricao := FieldByName('Descricao').AsString;
      iProduto.Quantidade := FieldByname('Quantidade').AsString;
      iProduto.Valor  := FieldByname('Valor').AsString;
    end;
  finally
    freeAndNil(sqlProduto);

  end;

end;

function TdmProdutos.ExcluirProduto(iCodigo: Integer;
  out sErro: String): Boolean;
begin
  with qrProdExcluir do
  begin
    Sql.Clear;
    Sql.Add('delete from Produtos');
    Sql.Add('where (IDProdutos = :IDProdutos) ');

    parameters[0].Value := iCodigo;
    try
      ExecSQL();
      Result := True;
      except on E: Exception do
      begin
        sErro := 'Ocorreu um erro ao excluir o produto selecionado!' + sLineBreak + E.Message;
        Result := False;
      end;
    end;
  end;
end;

function TdmProdutos.InserirRegistoProduto(iProduto: TAbstractProdutos;
  out sErro: String): Boolean;
begin
  with qrProdutosInsert do
  begin
    parameters.ParamByName('pDESCRICAO').Value := iProduto.Descricao;
    parameters.ParamByName('pQUANTIDADE').Value  := iProduto.Quantidade;
    parameters.ParamByName('pVALOR').Value := iProduto.Valor;
    try
      execSQL;
      Result := True;
      except
        on E: Exception do
        begin
          sErro := 'Ocorreu um erro ao gravar o produto!' + sLineBreak + E.Message;
          Result := False;
        end;
    end;
  end;
end;

procedure TdmProdutos.PesquisarProduto(iDescricao: String);
begin
  if cdsPesquisar.Active then
    cdsPesquisar.Close;
  cdsPesquisar.ParamByName('pDESCRICAO').AsString := '%' + iDESCRICAO + '%';
  cdsPesquisar.Open;
  cdsPesquisar.First;
end;

end.
