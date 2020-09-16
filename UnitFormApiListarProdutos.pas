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


unit UnitFormApiListarProdutos;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  UnitDataModulePrincipal, FMX.Edit, FMX.TabControl, FMX.Effects,
  FMX.Filter.Effects, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects,
  FMX.Layouts, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, System.Rtti, FMX.Grid.Style, FMX.ScrollBox,
  FMX.Grid, FMX.ListView, System.Actions, FMX.ActnList, FMX.Memo, REST.Types,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Fmx.Bind.Grid, Data.Bind.Grid, Data.Bind.Components,
  Data.Bind.DBScope, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  REST.Response.Adapter, REST.Client, Data.Bind.ObjectScope;

type
  TFormApiListarProdutos = class(TForm)
    LayoutApiListarProdutos: TLayout;
    LayoutCabecalho: TLayout;
    RectangleFundoDoCabecalho: TRectangle;
    ImageCabecalho: TImage;
    LabelTitulo: TLabel;
    ImageEngrenagem: TImage;
    FillRGBEffect1: TFillRGBEffect;
    FillRGBEffect2: TFillRGBEffect;
    ShadowEffect1: TShadowEffect;
    TabControlAPI: TTabControl;
    TabItemListaGrades: TTabItem;
    TabItemHttpRequestGet: TTabItem;
    TabItemHttpResponseJSon: TTabItem;
    TabItemJSonParseGrid: TTabItem;
    RectangleFundoListaMarca: TRectangle;
    ButtonHttpRequest: TButton;
    ListViewMarcas: TListView;
    Rectangle1: TRectangle;
    LabelUrlBase: TLabel;
    EditUrl: TEdit;
    LabelURI: TLabel;
    EditURI: TEdit;
    LabelParametros: TLabel;
    GridParametros: TGrid;
    MemoResponse: TMemo;
    GridProdutos: TGrid;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    FDMemTableProdutos: TFDMemTable;
    ActionListApiListarProdutos: TActionList;
    ActionVoltar: TAction;
    ActionRequest: TAction;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    BindSourceDB2: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB2: TLinkGridToDataSource;
    BindSourceDB3: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB3: TLinkGridToDataSource;
    LinkFillControlToField1: TLinkFillControlToField;

    procedure ActionVoltarExecute(Sender: TObject);
    procedure ActionRequestExecute(Sender: TObject);

    procedure ImageEngrenagemClick(Sender: TObject);

  private
    { Private declarations }
    procedure ExecutaSolicitacaoHttpGet;

  public
    { Public declarations }
    procedure Mostra(Leiaute: TLayout);

  end;

var
  FormApiListarProdutos: TFormApiListarProdutos;

implementation

{$R *.fmx}


{---------------------------------[ INTERNAL ]---------------------------------}
procedure TFormApiListarProdutos.ImageEngrenagemClick(Sender: TObject);
begin
  Self.ActionVoltar.Execute;
end;

{---------------------------------[ ACTION ]-----------------------------------}
procedure TFormApiListarProdutos.ActionRequestExecute(Sender: TObject);
begin
  Self.ExecutaSolicitacaoHttpGet;
end;

procedure TFormApiListarProdutos.ActionVoltarExecute(Sender: TObject);
begin
  Self.LayoutApiListarProdutos.Parent := Self;
end;

{---------------------------------[ PRIVATE ]----------------------------------}
procedure TFormApiListarProdutos.ExecutaSolicitacaoHttpGet;
var
  BaseURL, UriListarCategorias: string;
  chave, valor: String;
begin
  Self.TabControlAPI.ActiveTab  := Self.TabItemListaGrades;
  BaseURL                       := Self.EditURL.Text;
  UriListarCategorias           := Self.EditURI.Text;

  Self.RESTResponseDataSetAdapter1.Active := False;
  Self.FDMemTableProdutos.Active   := False;

  Self.RESTClient1.Params.Clear;
  Self.RESTRequest1.Params.Clear;

  Self.RESTClient1.BaseURL  := BaseURL + UriListarCategorias;
  DataModulePrincipal.FDMemTableParametroHTTP.First;
  while not DataModulePrincipal.FDMemTableParametroHTTP.Eof do
  begin
    chave := DataModulePrincipal.FDMemTableParametroHTTPKey.AsString;
    valor := DataModulePrincipal.FDMemTableParametroHTTPValue.AsString;
    Self.RESTClient1.AddParameter( chave, valor );

    DataModulePrincipal.FDMemTableParametroHTTP.Next;
  end;

  Self.MemoResponse.Lines.Clear;
  Self.MemoResponse.Lines.Add( 'Solicitação HTTP Get em andamento, pode levar alguns segundos.' );
  Self.RESTRequest1.Execute;
  Self.MemoResponse.Lines.Add( Self.RESTResponse1.Content );

  Self.MemoResponse.Lines.Add( 'Analisando retorno JSON.' );
  Self.RESTResponseDataSetAdapter1.Active := True;

  Self.MemoResponse.Lines.Add( 'Pronto.' );
end;

{---------------------------------[ PUBLIC ]-----------------------------------}
procedure TFormApiListarProdutos.Mostra(Leiaute: TLayout);
begin
  Self.TabControlAPI.ActiveTab        := TabItemListaGrades;
  Self.LayoutApiListarProdutos.Parent := Leiaute;
end;


end.
