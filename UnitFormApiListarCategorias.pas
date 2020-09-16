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

unit UnitFormApiListarCategorias;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Filter.Effects, FMX.Effects,
  FMX.Objects, FMX.Layouts, FMX.TabControl, FMX.ScrollBox, FMX.Memo,
  System.Actions, FMX.ActnList, FMX.Edit, REST.Types, REST.Response.Adapter,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, System.Rtti,
  FMX.Grid.Style, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FMX.Grid,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.Grid, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.Grid, Data.Bind.DBScope, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView;

type
  TFormApiListarCategorias = class(TForm)
    LayoutApiListarCategorias: TLayout;
    TabControlAPI: TTabControl;
    TabItemListaCategoria: TTabItem;
    TabItemHttpRequestGet: TTabItem;
    TabItemHttpResponseJson: TTabItem;
    TabItemJsomParseGrid: TTabItem;
    EditURL: TEdit;
    ButtonHttpRequest: TButton;
    MemoResponse: TMemo;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    LabelURL: TLabel;
    LabelParametros: TLabel;
    GridCategoria: TGrid;
    GridParametros: TGrid;

    FDMemTableCategoria: TFDMemTable;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    BindSourceDB2: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB2: TLinkGridToDataSource;

    ActionListApiListarCategorias: TActionList;
    ActionRequest: TAction;
    ActionVoltar: TAction;
    ListViewCategoria: TListView;
    LinkFillControlToField1: TLinkFillControlToField;
    Rectangle1: TRectangle;
    LabelURI: TLabel;
    EditURI: TEdit;
    BindSourceDB3: TBindSourceDB;
    LinkControlToField1: TLinkControlToField;
    LayoutCabecalho: TLayout;
    RectangleFundoDoCabecalho: TRectangle;
    ImageCabecalho: TImage;
    FillRGBEffect2: TFillRGBEffect;
    ShadowEffectCabecalho: TShadowEffect;
    ImageEngrenagem: TImage;
    FillRGBEffect1: TFillRGBEffect;
    LabelTitulo: TLabel;

    procedure ImageEngrenagemClick(Sender: TObject);

    procedure ActionVoltarExecute(Sender: TObject);
    procedure ActionRequestExecute(Sender: TObject);

  private
    { Private declarations }
    procedure ExecutaSolicitacaoHttpGet;

  public
    { Public declarations }
    procedure Mostra(Leiaute: TLayout);

  end;

var
  FormApiListarCategorias: TFormApiListarCategorias;

implementation

{$R *.fmx}

uses UnitDataModulePrincipal;

{ TFormApiListarCategorias }

{---------------------------------[ INTERNAL ]---------------------------------}
procedure TFormApiListarCategorias.ImageEngrenagemClick(Sender: TObject);
begin
  Self.ActionVoltar.Execute;
end;

{---------------------------------[ ACTION ]-----------------------------------}
procedure TFormApiListarCategorias.ActionRequestExecute(Sender: TObject);
begin
  Self.ExecutaSolicitacaoHttpGet;
end;

procedure TFormApiListarCategorias.ActionVoltarExecute(Sender: TObject);
begin
  Self.LayoutApiListarCategorias.Parent := Self;
end;

{---------------------------------[ PRIVATE ]----------------------------------}
procedure TFormApiListarCategorias.ExecutaSolicitacaoHttpGet;
var
  BaseURL, UriListarCategorias: string;
  chave, valor: String;
begin
  Self.TabControlAPI.ActiveTab  := Self.TabItemListaCategoria;
  BaseURL                       := Self.EditURL.Text;
  UriListarCategorias           := Self.EditURI.Text;

  Self.RESTResponseDataSetAdapter1.Active := False;
  Self.FDMemTableCategoria.Active         := False;

//  Self.RESTRequest1.Params.Clear;
//
//  DataModulePrincipal.FDMemTableParametroHTTP.First;
//  while not DataModulePrincipal.FDMemTableParametroHTTP.Eof do
//  begin
//    chave := DataModulePrincipal.FDMemTableParametroHTTPKey.AsString;
//    valor := DataModulePrincipal.FDMemTableParametroHTTPValue.AsString;
//    Self.RESTRequest1.AddParameter( chave, valor );
//
//    DataModulePrincipal.FDMemTableParametroHTTP.Next;
//  end;

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

//
// Final do bloco de substituição
//

  Self.MemoResponse.Lines.Clear;
  Self.MemoResponse.Lines.Add( 'Solicitação HTTP Get em andamento, pode levar alguns segundos.' );
  Self.RESTRequest1.Execute;
  Self.MemoResponse.Lines.Add( Self.RESTResponse1.Content );

  Self.MemoResponse.Lines.Add( 'Analisando retorno JSON.' );
  Self.RESTResponseDataSetAdapter1.Active := True;

  Self.MemoResponse.Lines.Add( 'Pronto.' );
end;

{---------------------------------[ PUBLIC ]-----------------------------------}
procedure TFormApiListarCategorias.Mostra(Leiaute: TLayout);
begin
  Self.TabControlAPI.ActiveTab   := TabItemListaCategoria;
  Self.LayoutApiListarCategorias.Parent := Leiaute;
end;


end.
