unit uVendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, System.Actions, Vcl.ActnList,
  Vcl.Buttons, Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.DBCtrls, Vcl.ComCtrls,uClientes,uProdutos, Vcl.Mask, Datasnap.DBClient,
  frxClass, frxPreview, frxDBSet;

type
  TfmTHRVendas = class(TForm)
    mmCadastros: TMainMenu;
    actCadastros: TActionList;
    Clientes1: TMenuItem;
    Produtos1: TMenuItem;
    N1: TMenuItem;
    Clientes2: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Produtos2: TMenuItem;
    N4: TMenuItem;
    actCliente: TAction;
    actProduto: TAction;
    pnButoes: TPanel;
    btNovo: TSpeedButton;
    btEditar: TSpeedButton;
    btCancelar: TSpeedButton;
    btSalvar: TSpeedButton;
    btFechar: TSpeedButton;
    pgVendas: TPageControl;
    tbVendas: TTabSheet;
    tbPesquisar: TTabSheet;
    pnVendas: TPanel;
    pnPesquisa: TPanel;
    lbCliente: TLabel;
    lbCodigoProduto: TLabel;
    edtCodigo: TEdit;
    lbDescricao: TLabel;
    edtDescricaoProd: TEdit;
    pnGrid: TPanel;
    lbQuantidade: TLabel;
    lbValor: TLabel;
    lbValorTotal: TLabel;
    edtQuantidade: TEdit;
    edtValorTotal: TEdit;
    edtValor: TEdit;
    gdItens: TDBGrid;
    pnPesq: TPanel;
    grPesq: TDBGrid;
    edtDescricaoPes: TEdit;
    lbCod: TLabel;
    btPesquisar: TSpeedButton;
    edtCliente: TEdit;
    lbCodCli: TLabel;
    edtCodCli: TEdit;
    lbDATA: TLabel;
    btInsert: TSpeedButton;
    btCliente: TSpeedButton;
    btAlte: TSpeedButton;
    dsItens: TDataSource;
    dsPesquisa: TDataSource;
    edtInicial: TMaskEdit;
    Label1: TLabel;
    Rel_vendas: TfrxReport;
    rel_dsVendas: TfrxDBDataset;
    procedure btFecharClick(Sender: TObject);
    procedure actClienteExecute(Sender: TObject);
    procedure actProdutoExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edtCodCliExit(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
    procedure edtQuantidadeExit(Sender: TObject);
    procedure btClienteClick(Sender: TObject);
    procedure btAlteClick(Sender: TObject);
    procedure btInsertClick(Sender: TObject);
    procedure btPesquisarClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
  private
    { Private declarations }
    procedure CarregarCliente;
    procedure CarregarProduto;
    procedure InserirVenda;
    procedure InserirItensVenda;
    procedure PesquisarVendas;
    procedure CarregarRelatorio;
  public
    { Public declarations }
  end;

var
  fmTHRVendas: TfmTHRVendas;

implementation

{$R *.dfm}

uses udmVendas, uControllerVenda, uAbstractVendas;

procedure TfmTHRVendas.actClienteExecute(Sender: TObject);
begin
  fmClientes := TfmClientes.Create(nil);

  try
    fmClientes.ShowModal;

  finally
    freeAndNil(fmClientes);
  end;
end;

procedure TfmTHRVendas.actProdutoExecute(Sender: TObject);
begin
  fmProdutos := TfmProdutos.Create(nil);
  try
    fmProdutos.ShowModal;

  finally
    freeAndNil(fmProdutos);
  end;
end;

procedure TfmTHRVendas.btAlteClick(Sender: TObject);
begin
  edtCodCli.Enabled := True;
end;

procedure TfmTHRVendas.btClienteClick(Sender: TObject);
begin
  InserirVenda;
  edtCodCli.Enabled := False;
  edtCodigo.Enabled := True;
  edtQuantidade.Enabled := True;
end;

procedure TfmTHRVendas.btFecharClick(Sender: TObject);
begin
  close;
end;

procedure TfmTHRVendas.btInsertClick(Sender: TObject);
begin
  InserirItensVenda;
end;

procedure TfmTHRVendas.btPesquisarClick(Sender: TObject);
begin
  PesquisarVendas;
end;

procedure TfmTHRVendas.btSalvarClick(Sender: TObject);
begin
  CarregarRelatorio;
  if MessageDlg('Deseja visualizar a impress�o na tela?',mtConfirmation,[mbYes, mbNo], 0) = IDYES then
  begin
    rel_vendas.PrepareReport;
    rel_vendas.ShowReport(true);
   //rel_vendas.print;
  end;
end;

procedure TfmTHRVendas.CarregarCliente;
var
  iControllerVenda: TControllerVenda;
  iVenda: TAbstractVendas;
  sErro: String;
begin
  iControllerVenda := TControllerVenda.Create;
  iVenda := TAbstractVendas.Create;
  try
    iControllerVenda.CarregarCliente(iVenda,strtoint(edtCodCli.Text));
    with iVenda do
    begin
      edtCliente.Text := Nome;
    end;
  finally
    freeAndNil(iControllerVenda);
    freeAndNil(iVenda);
  end;

end;

procedure TfmTHRVendas.CarregarProduto;
var
  iVenda: TAbstractVendas;
  iControllerVenda: TControllerVenda;
begin
  iVenda := TAbstractVendas.Create;
  iControllerVenda := TControllerVenda.Create;
  try
    iControllerVenda.CarregarProduto(iVenda, strtoint(edtCodigo.Text));
    with iVenda do
    begin
      edtDescricaoProd.Text := Descricao;
      edtValor.Text := Valor;
    end;
  finally
    freeAndNil(iVenda);
    freeAndNil(iControllerVenda);
  end;

end;

procedure TfmTHRVendas.CarregarRelatorio;
var
  iVenda: TAbstractVendas;
  iControllerVenda: TControllerVenda;
begin
  iVenda := TAbstractVendas.Create;
  iControllerVenda := TControllerVenda.Create;
  try
    iControllerVenda.carregarRelatorio(iVenda,11);
    with iVenda do
    begin
      rel_dsVendas.Initialize;
      rel_dsVendas.Open;

    //  rel_dsVendas.DataSet.FindField('pIDVENDAS').AsInteger := 11;
    end;
  finally
    freeAndNil(iVenda);
    freeAndNil(iControllerVenda);
  end;

end;

procedure TfmTHRVendas.edtCodCliExit(Sender: TObject);
begin
  CarregarCliente;
  InserirVenda;
  edtCodCli.Enabled := False;
  edtCodigo.Enabled := True;
  edtQuantidade.Enabled := True;
  edtCodigo.SetFocus;
end;

procedure TfmTHRVendas.edtCodigoExit(Sender: TObject);
begin
  CarregarProduto;
end;


procedure TfmTHRVendas.edtQuantidadeExit(Sender: TObject);
var
  Quant: Currency;
  Valor: Double;
begin
  Quant := StrToFloat(edtQuantidade.Text);
  Valor := StrToInt(edtValor.Text);
  edtValorTotal.Text := FloatToStr(Quant * Valor);
  edtValor.Text := FormatFloat('R$ 0.00',StrToFloat(edtValor.Text));
  edtValorTotal.Text := FormatFloat('R$ 0.00',StrToFloat(edtValorTotal.Text));
  InserirItensVenda;

end;

procedure TfmTHRVendas.FormCreate(Sender: TObject);
begin
  dmVendas := TdmVendas.Create(nil);
end;

procedure TfmTHRVendas.FormDestroy(Sender: TObject);
begin
  FreeAndNil(dmVendas);
end;

procedure TfmTHRVendas.InserirItensVenda;
var
  iVendas: TAbstractVendas;
  iControllerVenda: TControllerVenda;
  sErro: String;
begin

  iVendas := TAbstractVendas.Create;
  iControllerVenda := TControllerVenda.Create;
  try
    with iVendas do
    begin
      IDPRODUTO := STRTOINT(edtCodigo.Text);
      DESCRICAO := edtDescricaoProd.Text;
      QUANTIDADE  := edtQuantidade.Text;
      VALOR := edtValor.Text;
      ValorTotal  := edtValorTotal.Text;
    end;
    if iControllerVenda.InserirItensVenda(iVendas,sErro) = false then
      raise Exception.Create(sErro);
    edtCodigo.Clear;
    edtQuantidade.Clear;
    edtValor.Clear;
    edtValorTotal.Clear;
   finally
    freeAndNil(iVendas);
    freeAndNil(iControllerVenda);
  end;

end;

procedure TfmTHRVendas.InserirVenda;
var
  iVendas: TAbstractVendas;
  iControllerVenda: TControllerVenda;
  sErro: String;
begin
  iVendas := TAbstractVendas.Create;
  iControllerVenda := TControllerVenda.Create;
  try
    with iVendas do
    begin
      IDCLIENTE := STRTOINT(edtCodcli.Text);
    end;
    if iControllerVenda.InserirVendas(iVendas, sErro) = False then
      raise Exception.Create(sErro);

  finally
    freeAndNil(iVendas);
    freeAndNil(iControllerVenda);
  end;

end;

procedure TfmTHRVendas.PesquisarVendas;
var
  iControllerVenda: TControllerVenda;
begin

  iControllerVenda := TControllerVenda.Create;
  try
    iControllerVenda.PesquisarVendas(strtoint(edtDescricaoPes.Text), strtodate(edtInicial.Text));
  finally
    freeAndNil(iControllerVenda);
  end;
end;

end.
