// API LOJA INTEGRADA
// Comunidade Loja Integrada
//
// Keler Silva de Melo
// keler.melo@gmail.com
//
// 20/08/2020
//
// Link da Comunidade: https://comunidade.lojaintegrada.com.br/t/api-de-integracao-loja-integrada/52862
// Link da API: https://lojaintegrada.docs.apiary.io/#

unit UnitFormPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts, FMX.Effects,
  FMX.MultiView, System.Actions, FMX.ActnList, FMX.Menus, System.ImageList,
  FMX.ImgList, FMX.Filter.Effects, FMX.ani;

type
  TFormPrincipal = class(TForm)
    LayoutPrincipal: TLayout;
    LayoutAreaDeTrabalho: TLayout;
    ImageAreaDeTrabalho: TImage;
    LayoutCabecalho: TLayout;
    RectangleFundoDoCabecalho: TRectangle;
    ShadowEffectCabecalho: TShadowEffect;
    ImageEngrenagem: TImage;
    FillRGBEffect1: TFillRGBEffect;
    LayoutMenu: TLayout;
    MultiViewDaEsquerda: TMultiView;
    RectangleMenuDaEsquerda: TRectangle;
    VertScrollBoxMenuDaEsquerda: TVertScrollBox;
    ImagePerfil: TImage;
    ShadowEffect1: TShadowEffect;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    ActionListPrincipal: TActionList;
    ActionCabecalho: TAction;
    ActionEngrenagem: TAction;
    ActionLinkDaComunidade: TAction;
    ActionLinkDaAPI: TAction;
    ActionListarTodasAsCategorias: TAction;
    ImageIcone: TImage;
    LabelTitulo: TLabel;
    ActionListarTodasAsMarcas: TAction;
    ActionListarTodasAsGrades: TAction;
    ActionListarEstoque: TAction;
    ActionListarPrecos: TAction;
    ActionListarProdutos: TAction;
    ActionProdutoImagem: TAction;
    ActionSeo: TAction;
    ActionListarTodosOsClientes: TAction;
    Button11: TButton;
    ActionListarGrupos: TAction;
    Button12: TButton;
    ActionListarBancos: TAction;
    Button13: TButton;
    ActionListarPagamentos: TAction;
    Button14: TButton;
    Button15: TButton;
    ActionListarEnvios: TAction;
    Button16: TButton;
    ActionListarSituacao: TAction;
    Button17: TButton;
    ActionListarPedidos: TAction;

    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

    procedure FormVirtualKeyboardShown(Sender: TObject;
      KeyboardVisible: Boolean; const Bounds: TRect);
    procedure FormVirtualKeyboardHidden(Sender: TObject;
      KeyboardVisible: Boolean; const Bounds: TRect);

    procedure ImageEngrenagemClick(Sender: TObject);
    procedure LayoutMenuClick(Sender: TObject);

    procedure LabelTituloClick(Sender: TObject);
    procedure ImagePerfilClick(Sender: TObject);

    procedure ActionCabecalhoExecute(Sender: TObject);
    procedure ActionEngrenagemExecute(Sender: TObject);
    procedure ActionLinkDaComunidadeExecute(Sender: TObject);
    procedure ActionLinkDaAPIExecute(Sender: TObject);
    procedure ActionListarTodasAsCategoriasExecute(Sender: TObject);
    procedure ActionListarTodasAsMarcasExecute(Sender: TObject);
    procedure ActionListarTodasAsGradesExecute(Sender: TObject);
    procedure ActionListarEstoqueExecute(Sender: TObject);
    procedure ActionListarPrecosExecute(Sender: TObject);
    procedure ActionListarProdutosExecute(Sender: TObject);
    procedure ActionProdutoImagemExecute(Sender: TObject);
    procedure ActionSeoExecute(Sender: TObject);
    procedure ActionListarTodosOsClientesExecute(Sender: TObject);
    procedure ActionListarGruposExecute(Sender: TObject);
    procedure ActionListarBancosExecute(Sender: TObject);
    procedure ActionListarPagamentosExecute(Sender: TObject);
    procedure ActionListarEnviosExecute(Sender: TObject);
    procedure ActionListarSituacaoExecute(Sender: TObject);
    procedure ActionListarPedidosExecute(Sender: TObject);

  private
    { Private symbols }
    FObserverDeTecladoVirtual: array of TNotifyEvent;
    FTecladoVirtualVisivel: Boolean;

  private
    { Private declarations }
    procedure InicializaBarraDeNotificacao;

    procedure InicializaObserverDeTecladoVirtual;
    procedure FinalizaObserverDeTecladoVirtual;
    procedure DesregistraTodosObserversDeTecladoVirtual;
    procedure NotificaObserversDeTecladoVirtual;

    procedure AcionaMenuDaEsquerda;
    procedure AcionaEngrenagem;

    procedure ExecutaLinkDaComunidade;
    procedure ExecutaLinkDaAPI;

    procedure API_ListarTodasAsCategorias;
    procedure API_ListarTodasAsMarcas;
    procedure API_ListarTodasAsGrades;
    procedure API_ListarEstoque;
    procedure API_ListarPrecos;
    procedure API_ListarProdutos;
    procedure API_ProdutoImagem;
    procedure API_Seo;
    procedure API_ListarClientes;
    procedure API_ListarGrupos;
    procedure API_ListarBancos;
    procedure API_ListarPagamentos;
    procedure API_ListarEnvios;
    procedure API_ListarSituacao;
    procedure API_ListarPedidos;

  public
    { Public declarations }
    procedure RegistraObserverDeTecladoVirtual( Evento: TNotifyEvent );
    procedure DesregistraObserverDeTecladoVirtual( Evento: TNotifyEvent );
    function ObtemTecladoVirtualVisivel: Boolean;
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.fmx}

uses
{$IF DEFINED (ANDROID) || (IOS)}
//  cnnConexao.Params.Values['Database'] := TPath.Combine(TPath.GetDocumentsPath, 'contatos.sdb');
  AndroidAPI.Helpers, AndroidAPI.JNI.App,
{$ENDIF}
{$IF DEFINED (MSWINDOWS)}
//  cnnConexao.Params.Values['DataBase'] := '${CAMINHO_DB}';
{$ENDIF}
  UnitFormPrincipalEngrenagem, UnitURL, UnitFormApiListarCategorias,
  UnitFormApiListarMarcas, UnitFormApiListarGrades, UnitFormApiListarEstoque,
  UnitFormApiListarPrecos, UnitFormApiListarProdutos, UnitFormApiProdutoImagem,
  UnitFormApiSeo, UnitFormApiListarClientes, UnitFormApiListarGrupos,
  UnitFormApiListarBancos, UnitFormApiListarPagamentos, UnitFormApiListarEnvio,
  UnitFormApiListarSituacao, UnitFormApiListarPedidos;

{---------------------------------[ INTERNAL ]---------------------------------}
procedure TFormPrincipal.FormCreate(Sender: TObject);
begin
  Self.InicializaBarraDeNotificacao;
  Self.InicializaObserverDeTecladoVirtual;
end;

procedure TFormPrincipal.FormDestroy(Sender: TObject);
begin
  Self.FinalizaObserverDeTecladoVirtual;
end;

procedure TFormPrincipal.FormVirtualKeyboardShown(Sender: TObject;
  KeyboardVisible: Boolean; const Bounds: TRect);
begin
  Self.FTecladoVirtualVisivel := True;
  Self.NotificaObserversDeTecladoVirtual;
end;

procedure TFormPrincipal.FormVirtualKeyboardHidden(Sender: TObject;
  KeyboardVisible: Boolean; const Bounds: TRect);
begin
  Self.FTecladoVirtualVisivel := False;
  Self.NotificaObserversDeTecladoVirtual;
end;

procedure TFormPrincipal.ImageEngrenagemClick(Sender: TObject);
begin
  Self.AcionaEngrenagem;
end;

procedure TFormPrincipal.LayoutMenuClick(Sender: TObject);
begin
  Self.AcionaMenuDaEsquerda;
end;

procedure TFormPrincipal.LabelTituloClick(Sender: TObject);
begin
  Self.AcionaMenuDaEsquerda;
end;

procedure TFormPrincipal.ImagePerfilClick(Sender: TObject);
begin
  Self.AcionaMenuDaEsquerda;
end;


{---------------------------------[ ACTION ]-----------------------------------}
procedure TFormPrincipal.ActionCabecalhoExecute(Sender: TObject);
begin
  Self.AcionaMenuDaEsquerda;
end;

procedure TFormPrincipal.ActionEngrenagemExecute(Sender: TObject);
begin
  Self.AcionaEngrenagem;
end;

procedure TFormPrincipal.ActionLinkDaComunidadeExecute(Sender: TObject);
begin
  Self.ExecutaLinkDaComunidade;
end;

procedure TFormPrincipal.ActionLinkDaAPIExecute(Sender: TObject);
begin
  Self.ExecutaLinkDaAPI;
end;

procedure TFormPrincipal.ActionListarTodasAsCategoriasExecute(Sender: TObject);
begin
  Self.API_ListarTodasAsCategorias;
end;

procedure TFormPrincipal.ActionListarTodasAsMarcasExecute(Sender: TObject);
begin
  Self.API_ListarTodasAsMarcas;
end;

procedure TFormPrincipal.ActionListarTodasAsGradesExecute(Sender: TObject);
begin
  Self.API_ListarTodasAsGrades;
end;

procedure TFormPrincipal.ActionListarEstoqueExecute(Sender: TObject);
begin
  Self.API_ListarEstoque;
end;

procedure TFormPrincipal.ActionListarPrecosExecute(Sender: TObject);
begin
  Self.API_ListarPrecos;
end;

procedure TFormPrincipal.ActionListarProdutosExecute(Sender: TObject);
begin
  Self.API_ListarProdutos;
end;

procedure TFormPrincipal.ActionProdutoImagemExecute(Sender: TObject);
begin
  Self.API_ProdutoImagem;
end;

procedure TFormPrincipal.ActionSeoExecute(Sender: TObject);
begin
  Self.API_Seo;
end;

procedure TFormPrincipal.ActionListarTodosOsClientesExecute(Sender: TObject);
begin
  Self.API_ListarClientes;
end;

procedure TFormPrincipal.ActionListarGruposExecute(Sender: TObject);
begin
  Self.API_ListarGrupos;
end;

procedure TFormPrincipal.ActionListarBancosExecute(Sender: TObject);
begin
  Self.API_ListarBancos;
end;

procedure TFormPrincipal.ActionListarPagamentosExecute(Sender: TObject);
begin
  Self.API_ListarPagamentos;
end;

procedure TFormPrincipal.ActionListarEnviosExecute(Sender: TObject);
begin
  Self.API_ListarEnvios;
end;

procedure TFormPrincipal.ActionListarSituacaoExecute(Sender: TObject);
begin
  Self.API_ListarSituacao;
end;

procedure TFormPrincipal.ActionListarPedidosExecute(Sender: TObject);
begin
  Self.API_ListarPedidos;
end;


{---------------------------------[ PRIVATE ]----------------------------------}
procedure TFormPrincipal.InicializaBarraDeNotificacao;
begin
  {$IF DEFINED (ANDROID) || (IOS)}
    TAndroidHelper.Activity.getWindow.setStatusBarColor( TAlphaColorRec.Blue ); //#FFB0BF34
  {$ENDIF}
  {$IF DEFINED (MSWINDOWS)}
    //...
  {$ENDIF}
end;

procedure TFormPrincipal.InicializaObserverDeTecladoVirtual;
begin
  SetLength( Self.FObserverDeTecladoVirtual, 0 );
end;

procedure TFormPrincipal.FinalizaObserverDeTecladoVirtual;
begin
  Self.DesregistraTodosObserversDeTecladoVirtual;
  SetLength( Self.FObserverDeTecladoVirtual, 0 );
end;

procedure TFormPrincipal.DesregistraTodosObserversDeTecladoVirtual;
var
  Tamanho, Indice: Integer;
begin
  Tamanho := Length( Self.FObserverDeTecladoVirtual );
  for Indice := Pred( Tamanho ) downto 0 do
  begin
    Self.FObserverDeTecladoVirtual[ Indice ] := nil;
  end;  
end;

procedure TFormPrincipal.NotificaObserversDeTecladoVirtual;
var
  Tamanho, Indice: Integer;
  Evento: TNotifyEvent;
begin
  Tamanho := Length( Self.FObserverDeTecladoVirtual );
  for Indice := Pred( Tamanho ) downto 0 do
  begin
    if Assigned( Self.FObserverDeTecladoVirtual[ Indice ] ) then
    begin
      Evento := TNotifyEvent( Self.FObserverDeTecladoVirtual[ Indice ] );
      Evento( Self );
      Evento := nil;
    end;
  end;
end;

procedure TFormPrincipal.AcionaMenuDaEsquerda;
begin
  if Self.MultiViewDaEsquerda.IsShowed then
  begin
    Self.MultiViewDaEsquerda.HideMaster;
  end
  else
  begin
    Self.MultiViewDaEsquerda.ShowMaster;
  end;
end;

procedure TFormPrincipal.AcionaEngrenagem;
begin
  FormPrincipalEngrenagem.AcionaEngrenagem( Self, Self.ImageEngrenagem, Self.LayoutAreaDeTrabalho, 4 );
end;

procedure TFormPrincipal.ExecutaLinkDaComunidade;
var
  EnderecoURL: String;
begin
  EnderecoURL := 'https://comunidade.lojaintegrada.com.br/t/api-de-integracao-loja-integrada/52862';
  tURL.Open( EnderecoURL );
end;

procedure TFormPrincipal.ExecutaLinkDaAPI;
var
  EnderecoURL: String;
begin
  EnderecoURL := 'https://lojaintegrada.docs.apiary.io/#';
  tURL.Open( EnderecoURL );
end;

procedure TFormPrincipal.API_ListarTodasAsCategorias;
begin
  FormApiListarCategorias.Mostra( Self.LayoutPrincipal );
end;

procedure TFormPrincipal.API_ListarTodasAsMarcas;
begin
  FormApiListarMarcas.Mostra( Self.LayoutPrincipal );
end;

procedure TFormPrincipal.API_ListarTodasAsGrades;
begin
  FormApiListarGrades.Mostra( Self.LayoutPrincipal );
end;

procedure TFormPrincipal.API_ListarEstoque;
begin
  FormApiListarEstoque.Mostra( Self.LayoutPrincipal );
end;

procedure TFormPrincipal.API_ListarPrecos;
begin
  FormApiListarPrecos.Mostra( Self.LayoutPrincipal );
end;

procedure TFormPrincipal.API_ListarProdutos;
begin
  FormApiListarProdutos.Mostra( Self.LayoutPrincipal );
end;

procedure TFormPrincipal.API_ProdutoImagem;
begin
  FormApiProdutoImagem.Mostra( Self.LayoutPrincipal );
end;

procedure TFormPrincipal.API_Seo;
begin
  FormApiSeo.Mostra( Self.LayoutPrincipal );
end;

procedure TFormPrincipal.API_ListarClientes;
begin
  FormApiListarClientes.Mostra( Self.LayoutPrincipal );
end;

procedure TFormPrincipal.API_ListarGrupos;
begin
  FormApiListarGrupos.Mostra( Self.LayoutPrincipal );
end;

procedure TFormPrincipal.API_ListarBancos;
begin
  FormApiListarBancos.Mostra( Self.LayoutPrincipal );
end;

procedure TFormPrincipal.API_ListarPagamentos;
begin
  FormApiListarPagamentos.Mostra( Self.LayoutPrincipal );
end;

procedure TFormPrincipal.API_ListarEnvios;
begin
  FormApiListarEnvio.Mostra( Self.LayoutPrincipal );
end;

procedure TFormPrincipal.API_ListarSituacao;
begin
  FormApiListarSituacao.Mostra( Self.LayoutPrincipal );
end;

procedure TFormPrincipal.API_ListarPedidos;
begin
  FormApiListarPedidos.Mostra( Self.LayoutPrincipal );
end;

{---------------------------------[ PUBLIC ]-----------------------------------}
procedure TFormPrincipal.RegistraObserverDeTecladoVirtual(Evento: TNotifyEvent);
var
  Tamanho: Integer;
begin
  Tamanho := Length( Self.FObserverDeTecladoVirtual );
  SetLength( Self.FObserverDeTecladoVirtual, Succ( Tamanho ) );
  Self.FObserverDeTecladoVirtual[Tamanho] := Evento;
end;

procedure TFormPrincipal.DesregistraObserverDeTecladoVirtual(Evento: TNotifyEvent);
var
  Tamanho, Indice: Integer;
begin
  Tamanho := Length( Self.FObserverDeTecladoVirtual );
  for Indice := Pred( Tamanho ) downto 0 do
  begin
    if ( @Self.FObserverDeTecladoVirtual[ Indice ] = @Evento ) then
    begin
      Self.FObserverDeTecladoVirtual[ Indice ] := nil;
    end;
  end;  
end;

function TFormPrincipal.ObtemTecladoVirtualVisivel: Boolean;
var
  Retorno: Boolean;
begin
  Retorno := Self.FTecladoVirtualVisivel;
  Result := Retorno;
end;


end.
