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

unit UnitParametrosHTTP;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  System.Rtti, FMX.Grid.Style, FMX.ScrollBox, FMX.Grid, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Objects, UnitDataModulePrincipal,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.Grid, System.Bindings.Outputs,
  Fmx.Bind.Editors, System.Actions, FMX.ActnList, Data.Bind.Components,
  Data.Bind.Grid, Data.Bind.DBScope, FMX.Filter.Effects, FMX.Effects;

type
  TFormparametrosHTTP = class(TForm)
    LayoutParametrosHTTP: TLayout;
    ActionList1: TActionList;
    ActionAltera: TAction;
    ActionRetorna: TAction;
    RectangleTapaFundo: TRectangle;
    Rectangle1: TRectangle;
    Grid1: TGrid;
    LayoutCabecalho: TLayout;
    RectangleFundoDoCabecalho: TRectangle;
    ShadowEffectCabecalho: TShadowEffect;
    ImageSalva: TImage;
    FillRGBEffect1: TFillRGBEffect;
    LabelTitulo: TLabel;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    ImageIcone: TImage;

    procedure ImageSalvaClick(Sender: TObject);

    procedure ActionRetornaExecute(Sender: TObject);

  private
    { Private declarations }

  public
    { Public declarations }

  end;

var
  FormparametrosHTTP: TFormparametrosHTTP;

implementation

{$R *.fmx}

{---------------------------------[ INTERNAL ]---------------------------------}
procedure TFormparametrosHTTP.ImageSalvaClick(Sender: TObject);
begin
  Self.ActionRetorna.Execute;
end;

{---------------------------------[ ACTION ]-----------------------------------}
procedure TFormparametrosHTTP.ActionRetornaExecute(Sender: TObject);
begin
  Self.LayoutParametrosHTTP.Parent := Self;
end;


end.
