unit uClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask;

type
  TOperacao = (opNovo, opAlterar, opNavegar);

  TfmClientes = class(TForm)
    pgClientes: TPageControl;
    pnButon: TPanel;
    tbClientes: TTabSheet;
    tbCadClientes: TTabSheet;
    gdClientes: TDBGrid;
    lbNome: TLabel;
    lbDocumento: TLabel;
    lbDocumento2: TLabel;
    lbTelefone: TLabel;
    lbCelular: TLabel;
    lbEmail: TLabel;
    lbNomeMae: TLabel;
    lbNomePai: TLabel;
    edtNome: TEdit;
    edtEmail: TEdit;
    edtNomeMae: TEdit;
    edtNomePai: TEdit;
    btNovo: TSpeedButton;
    btEditar: TSpeedButton;
    btCancelar: TSpeedButton;
    btSalvar: TSpeedButton;
    btFechar: TSpeedButton;
    btExcluir: TSpeedButton;
    Panel1: TPanel;
    edtPesquisar: TEdit;
    btPesquisar: TSpeedButton;
    lbPesquisar: TLabel;
    dsPesquisar: TDataSource;
    edtCodigo: TEdit;
    lbCodigo: TLabel;
    dsClientes: TDataSource;
    edtCPF: TMaskEdit;
    edtRG: TMaskEdit;
    edtTelefone: TMaskEdit;
    edtCelular: TMaskEdit;
    procedure btFecharClick(Sender: TObject);
    procedure btPesquisarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btNovoClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btEditarClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FOperacao: TOperacao;
    procedure Novo;
    procedure Detalhar;
    procedure Configuracoes;
    procedure PesquisarCliente;
    procedure CarregarCliente;
    procedure Alterar;
    procedure Excluir;
    procedure Inserir;
    procedure Gravar;
    procedure HabilitarController(iOperacao:TOperacao);
  public
    { Public declarations }

  end;

var
  fmClientes: TfmClientes;

implementation

uses
  uControllerCliente, udmClientes, uCliente;

{$R *.dfm}

procedure TfmClientes.Alterar;
var
  iCliente: TClienteAbstract;
  iControllerCliente: TControllerCliente;
  sErro: String;
begin
  iCliente := TClienteAbstract.Create;
  iControllerCliente := TControllerCliente.create;
  try
    with iCliente do
    begin
      IDCLIENTE := StrToIntDef(edtCodigo.Text, 0);
      NOME  := edtNome.Text;
      Documento := edtCPF.Text;
      Documento2  := edtRG.Text;
      Telefone  := edtTelefone.Text;
      Celular := edtCelular.Text;
      EMAIL := edtEmail.Text;
      NomeMae := edtNomeMae.Text;
      NomePai := edtNomePai.Text;
    end;
    if iControllerCliente.AlterarCliente(iCliente, sErro) = False then
      raise Exception.Create(sErro)
    else
      showmessage('Cliente alterado com sucesso!')

  finally
    freeAndNil(iCliente);
    freeAndNil(iControllerCliente);

  end;

end;

procedure TfmClientes.btCancelarClick(Sender: TObject);
begin
  HabilitarController(opNavegar);
end;

procedure TfmClientes.btEditarClick(Sender: TObject);
begin
  fOperacao := opAlterar;
  HabilitarController(opAlterar);
end;

procedure TfmClientes.btExcluirClick(Sender: TObject);
begin
  Excluir;
end;

procedure TfmClientes.btFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfmClientes.btNovoClick(Sender: TObject);
begin
  Novo;
  HabilitarController(opNovo);
end;

procedure TfmClientes.btPesquisarClick(Sender: TObject);
begin
  PesquisarCliente;
end;

procedure TfmClientes.btSalvarClick(Sender: TObject);
begin
  Gravar;
  HabilitarController(opNavegar);
end;

procedure TfmClientes.CarregarCliente;
var
  iCliente: TClienteAbstract;
  iControllerCliente: TControllerCliente;
begin
  iCliente := TClienteAbstract.Create;
  iControllerCliente := TControllerCliente.create;
  try
    iControllerCliente.CarregarClientePesquisa(iCliente, dsPesquisar.DataSet.FieldByName('IDCLIENTE').AsInteger);
    with iCliente do
    begin
      edtCodigo.Text := inttostr(IdCliente);
      edtNome.Text   := Nome;
      edtCPF.Text    := Documento;
      edtRG.Text     := Documento2;
      edtTelefone.Text  := Telefone;
      edtCelular.Text   := Celular;
      edtEmail.Text  := Email;
      edtNomeMae.Text := NomeMae;
      edtNomePai.Text := NomePai;
    end;
  finally
    freeAndNil(iControllerCliente);
    freeAndNil(iCliente);
  end;

end;

procedure TfmClientes.Configuracoes;
begin
  tbClientes.Visible := False;
  tbCadClientes.Visible := False;
  pgClientes.ActivePage := tbClientes;
end;

procedure TfmClientes.Detalhar;
begin
  fOperacao := opNavegar;
  pgClientes.ActivePage := tbCadClientes;
end;

procedure TfmClientes.Excluir;
var
  iControllerCliente: TControllerCliente;
  sErro: String;
begin
  iControllerCliente := TControllerCliente.create;
  try
    if (dmClientes.cdsPesquisar.Active) and (dmClientes.cdsPesquisar.RecordCount > 0) then
    begin
      if MessageDlg('Deseja realmente excluir esse cliente?',mtConfirmation,[mbYes, mbNo], 0) = IDYES then
      begin
        if iControllerCliente.ExcluirCliente(dmClientes.cdsPesquisarIDCLIENTE.AsInteger,sErro) = False then
          raise Exception.Create(sErro);
        iControllerCliente.PesquisarCliente(edtPesquisar.Text);
      end;
    end
    else
      raise Exception.Create('N�o h� registros para ser exclu�dos!');

  finally
    freeAndNil(iControllerCliente);
  end;

end;

procedure TfmClientes.FormCreate(Sender: TObject);
begin
  dmClientes := TdmClientes.Create(Nil);
end;

procedure TfmClientes.FormDestroy(Sender: TObject);
begin
  freeAndNil(dmClientes);
end;

procedure TfmClientes.FormShow(Sender: TObject);
begin
  configuracoes;
end;

procedure TfmClientes.Gravar;
var
  iControllerCliente: TControllerCliente;
begin
  iControllerCliente := TControllerCliente.create;
  try
    case fOperacao of
      opNovo: Inserir;
      opAlterar: Alterar;
    end;
    iControllerCliente.PesquisarCliente(edtPesquisar.Text);
  finally
    freeAndNil(iControllerCliente);
  end;

end;

procedure TfmClientes.HabilitarController(iOperacao: TOperacao);
begin
  case iOperacao of
    opNovo:
    begin
      edtNome.Enabled := True;
      edtNome.Clear;
      edtCPF.Enabled  := True;
      edtCPF.Clear;
      edtRG.Enabled := True;
      edtRG.Clear;
      edtTelefone.Enabled := True;
      edtTelefone.Clear;
      edtCelular.Enabled  := True;
      edtCelular.Clear;
      edtEmail.Enabled  := True;
      edtEmail.Clear;
      edtNomeMae.Enabled  := True;
      edtNomeMae.Clear;
      edtNomePai.Enabled  := True;
      edtNomePai.Clear;
      btNovo.Enabled  := False;
      btEditar.Enabled  := False;
      btExcluir.Enabled := False;
      btFechar.Enabled  := False;
      btSalvar.Enabled := True;
      btCancelar.Enabled := True;
    end;

    opAlterar:
    begin
       edtNome.Enabled := True;
      edtCPF.Enabled  := True;
      edtRG.Enabled := True;
      edtTelefone.Enabled := True;
      edtCelular.Enabled  := True;
      edtEmail.Enabled  := True;
      edtNomeMae.Enabled  := True;
      edtNomePai.Enabled  := True;
      btNovo.Enabled  := False;
      btEditar.Enabled  := False;
      btExcluir.Enabled := False;
      btFechar.Enabled  := False;
      btSalvar.Enabled := True;
      btCancelar.Enabled := True;
    end;

    opNavegar:
    begin
      edtNome.Enabled := False;
      edtCPF.Enabled  := False;
      edtRG.Enabled := False;
      edtTelefone.Enabled := False;
      edtCelular.Enabled  := False;
      edtEmail.Enabled  := False;
      edtNomeMae.Enabled  := False;
      edtNomePai.Enabled  := False;
      btNovo.Enabled  := True;
      btEditar.Enabled  := True;
      btExcluir.Enabled := True;
      btFechar.Enabled  := True;
      btSalvar.Enabled := False;
      btCancelar.Enabled := False;
    end;
    end;

end;

procedure TfmClientes.Inserir;
var
  iCliente: TClienteAbstract;
  iControllerCliente: TControllerCliente;
  sErro: String;
begin
  iCliente := TClienteAbstract.Create;
  iControllerCliente  := TControllerCliente.create;
  try
    with iCliente do
    begin
      IDCLIENTE := 0;
      NOME  := edtNome.Text;
      Documento := edtCPF.Text;
      Documento2  := edtRG.Text;
      Telefone  := edtTelefone.Text;
      Celular := edtCelular.Text;
      Email   := edtEmail.Text;
      NomeMae := edtNomeMae.Text;
      NomePai := edtNomePai.Text;
    end;
    if iControllerCliente.InserirRegistoCliente(iCliente,sErro) = False then
      raise Exception.Create(sErro)
    else
      Showmessage('Registro inserido com sucesso!');

  finally
    freeAndNil(iCliente);
    freeAndNil(iControllerCliente);

  end;

end;

procedure TfmClientes.Novo;
begin
  FOperacao := OpNovo;
  pgClientes.ActivePage := tbCadClientes;
end;

procedure TfmClientes.PesquisarCliente;
var
  iControllerCliente: TControllerCliente;
begin

  iControllerCliente := TControllerCliente.create;
  try
    iControllerCliente.CarregarCodigoCliente(edtPesquisar.Text);
  finally
    freeAndNil(iControllerCliente);
  end;
end;

end.
