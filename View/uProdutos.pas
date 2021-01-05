unit uProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TOperacao = (opNovo, opAlterar, opNavegar);

  TfmProdutos = class(TForm)
    pnButon: TPanel;
    btNovo: TSpeedButton;
    btEditar: TSpeedButton;
    btCancelar: TSpeedButton;
    btSalvar: TSpeedButton;
    btFechar: TSpeedButton;
    btExcluir: TSpeedButton;
    pgProdutos: TPageControl;
    tbProdutos: TTabSheet;
    tbCadProdutos: TTabSheet;
    gdProdutos: TDBGrid;
    Label1: TLabel;
    lbQuantidade: TLabel;
    lbValor: TLabel;
    edtDescricao: TEdit;
    edtQuantidade: TEdit;
    edtValor: TEdit;
    edtCodigo: TEdit;
    lbCodigo: TLabel;
    pnPesquisar: TPanel;
    lbDescricao: TLabel;
    edtDescricaoPes: TEdit;
    btPesquisar: TSpeedButton;
    dsPesquisar: TDataSource;
    procedure btFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btNovoClick(Sender: TObject);
    procedure btEditarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btPesquisarClick(Sender: TObject);
    procedure edtValorExit(Sender: TObject);
  private
    { Private declarations }
    FOperacao: TOperacao;
    procedure Novo;
    procedure Configuracoes;
    procedure Detalhar;
    procedure PesquisarProduto;
    procedure CarregarProduto;
    procedure Alterar;
    procedure Excluir;
    procedure Inserir;
    procedure Gravar;
    procedure HabilitarController(iOperacao:TOperacao);
  public
    { Public declarations }
  end;

var
  fmProdutos: TfmProdutos;

implementation

uses
  uControllerProduto, uAbstractProduto, udmProdutos;

{$R *.dfm}

procedure TfmProdutos.Alterar;
var
  iProduto: TAbstractProdutos;
  iControllerProduto: TControllerProduto;
  sErro: String;
begin
  iProduto := TAbstractProdutos.Create;
  iControllerProduto := TControllerProduto.Create;
  try
    with iProduto do
    begin
      IDProduto := StrToIntDef(edtCodigo.Text, 0);
      Descricao := edtDescricao.Text;
      Quantidade := edtQuantidade.Text;
      Valor := edtValor.Text;
    end;
    if iControllerProduto.AlterarProduto(iProduto, sErro) = False then
      raise Exception.Create(sErro)
    else
      showmessage('Produto alterado com sucesso!');

  finally
    FreeAndNil(iProduto);
    FreeAndNil(iControllerProduto);

  end;

end;

procedure TfmProdutos.btCancelarClick(Sender: TObject);
begin
  HabilitarController(opNavegar);
end;

procedure TfmProdutos.btEditarClick(Sender: TObject);
begin
  fOperacao := opAlterar;
  HabilitarController(opAlterar);
end;

procedure TfmProdutos.btExcluirClick(Sender: TObject);
begin
  Excluir;
end;

procedure TfmProdutos.btFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfmProdutos.btNovoClick(Sender: TObject);
begin
  Novo;
  HabilitarController(opNovo);
end;

procedure TfmProdutos.btPesquisarClick(Sender: TObject);
begin
  PesquisarProduto;
end;

procedure TfmProdutos.btSalvarClick(Sender: TObject);
begin
  Gravar;
  HabilitarController(opNavegar);
end;

procedure TfmProdutos.CarregarProduto;
var
  iProduto: TAbstractProdutos;
  iControllerProduto: TControllerProduto;
begin
  iProduto := TAbstractProdutos.Create;
  iControllerProduto := TControllerProduto.Create;
  try
    iControllerProduto.CarregarProdutoPesquisa(iProduto, dsPesquisar.DataSet.FieldByName('IDPRODUTOS').AsInteger);
    with iProduto do
    begin
      edtCodigo.Text  := IntToStr(IDProduto);
      edtDescricao.Text := Descricao;
      edtQuantidade.Text  := Quantidade;
      edtValor.Text := Valor;
    end;
  finally
    FreeAndNil(iProduto);
    FreeAndNil(iControllerProduto);
  end;

end;

procedure TfmProdutos.Configuracoes;
begin
  tbProdutos.Visible := False;
  tbCadProdutos.Visible := False;
  pgProdutos.ActivePage := tbProdutos;
end;

procedure TfmProdutos.Detalhar;
begin
  fOperacao := opNavegar;
  pgProdutos.ActivePage := tbCadProdutos;
end;

procedure TfmProdutos.edtValorExit(Sender: TObject);
begin
  edtValor.Text := FormatFloat('R$ 0.00',StrToFloat(edtValor.Text));
end;

procedure TfmProdutos.Excluir;
var
  iControllerProduto: TControllerProduto;
  sErro: String;
begin
  iControllerProduto := TControllerProduto.Create;
  try
    if (dmProdutos.cdsPesquisar.Active) and (dmProdutos.cdsPesquisar.RecordCount > 0) then
    begin
      if MessageDlg('Deseja realmente excluir esse cliente?',mtConfirmation,[mbYes, mbNo], 0) = IDYES then
      begin
        if iControllerProduto.ExcluirProduto(dmProdutos.cdsPesquisarIDPRODUTOS.AsInteger,sErro) = False then
          raise Exception.Create(sErro);
        iControllerProduto.PesquisarProduto(edtDescricaoPes.Text);
      end;
    end
    else
      raise Exception.Create('N�o h� registros para ser exclu�dos!');

  finally
    FreeAndNil(iControllerProduto);
  end;

end;

procedure TfmProdutos.FormCreate(Sender: TObject);
begin
  dmProdutos := TdmProdutos.Create(nil);
end;

procedure TfmProdutos.FormDestroy(Sender: TObject);
begin
  freeAndNil(dmProdutos);
end;

procedure TfmProdutos.Gravar;
var
  iControllerProduto: TControllerProduto;
begin
  iControllerProduto := TControllerProduto.create;
  try
    case fOperacao of
      opNovo: Inserir;
      opAlterar: Alterar;
    end;
    iControllerProduto.PesquisarProduto(edtDescricaoPes.Text);
  finally
    freeAndNil(iControllerProduto);
  end;

end;

procedure TfmProdutos.HabilitarController(iOperacao: TOperacao);
begin
   case iOperacao of
    opNovo, opAlterar:
    begin
      edtDescricao.Enabled := True;
      edtDescricao.Clear;
      edtQuantidade.Enabled  := True;
      edtQuantidade.Clear;
      edtValor.Enabled := True;
      edtValor.Clear;
      btNovo.Enabled  := False;
      btEditar.Enabled  := False;
      btExcluir.Enabled := False;
      btFechar.Enabled  := False;
      btSalvar.Enabled := True;
      btCancelar.Enabled := True;
    end;
    opNavegar:
    begin
      edtDescricao.Enabled := False;
      edtQuantidade.Enabled  := False;
      edtValor.Enabled := False;
      btNovo.Enabled  := True;
      btEditar.Enabled  := True;
      btExcluir.Enabled := True;
      btFechar.Enabled  := True;
      btSalvar.Enabled := False;
      btCancelar.Enabled := False;
    end;
  end;
end;

procedure TfmProdutos.Inserir;
var
  iProduto: TAbstractProdutos;
  iControllerProduto: TControllerProduto;
  sErro: String;
begin
  iProduto := TAbstractProdutos.Create;
  iControllerProduto  := TControllerProduto.create;
  try
    with iProduto do
    begin
      IDProduto := 0;
      Descricao  := edtDescricao.Text;
      Quantidade := edtQuantidade.Text;
      Valor  := edtValor.Text;

    end;
    if iControllerProduto.InserirRegistoProduto(iProduto,sErro) = False then
      raise Exception.Create(sErro)
    else
      Showmessage('Registro inserido com sucesso!');

  finally
    freeAndNil(iProduto);
    freeAndNil(iControllerProduto);

  end;

end;

procedure TfmProdutos.Novo;
begin
  FOperacao := OpNovo;
  pgProdutos.ActivePage := tbCadProdutos;
end;

procedure TfmProdutos.PesquisarProduto;
Var
  iControllerProduto: TControllerProduto;
begin
  iControllerProduto := TControllerProduto.Create;
  try
    iControllerProduto.PesquisarProduto(edtDescricaoPes.Text);
  finally
    FreeAndNil(iControllerProduto);
  end;

end;

end.