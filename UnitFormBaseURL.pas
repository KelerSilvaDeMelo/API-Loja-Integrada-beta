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

unit UnitFormBaseURL;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.Layouts, UnitDataModulePrincipal,
  System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope, System.Actions,
  FMX.ActnList, FMX.Objects, FMX.Filter.Effects, FMX.Effects;

type
  TFormBaseURL = class(TForm)
    LayoutBaseURL: TLayout;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    RectangleTapaFundo: TRectangle;
    ActionList1: TActionList;
    ActionRetorna: TAction;
    LayoutCabecalho: TLayout;
    RectangleFundoDoCabecalho: TRectangle;
    ShadowEffectCabecalho: TShadowEffect;
    ImageSalva: TImage;
    FillRGBEffect1: TFillRGBEffect;
    RectangleBaseURL: TRectangle;
    EditBaseURL: TEdit;
    LabelBaseURL: TLabel;
    LabelTitulo: TLabel;
    ImageIconeCabecalho: TImage;

    procedure ActionRetornaExecute(Sender: TObject);
    procedure ImageSalvaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

  private
    { Private declarations }

  public
    { Public declarations }
    procedure ObserverDeTecladoVirtual( Sender: TObject );

  end;

var
  FormBaseURL: TFormBaseURL;

implementation


Uses
  UnitFormPrincipal;

{$R *.fmx}

{---------------------------------[ INTERNAL ]---------------------------------}
procedure TFormBaseURL.FormCreate(Sender: TObject);
begin
  FormPrincipal.RegistraObserverDeTecladoVirtual( Self.ObserverDeTecladoVirtual );
end;

procedure TFormBaseURL.FormDestroy(Sender: TObject);
begin
  FormPrincipal.DesregistraObserverDeTecladoVirtual( Self.ObserverDeTecladoVirtual );
end;

procedure TFormBaseURL.ImageSalvaClick(Sender: TObject);
begin
  Self.ActionRetorna.Execute;
end;

{---------------------------------[ ACTION ]-----------------------------------}
procedure TFormBaseURL.ActionRetornaExecute(Sender: TObject);
begin
  Self.LayoutBaseURL.Parent := Self;
end;

{---------------------------------[ PUBLIC ]-----------------------------------}
procedure TFormBaseURL.ObserverDeTecladoVirtual(Sender: TObject);
begin
  if FormPrincipal.ObtemTecladoVirtualVisivel then
  begin
    Self.RectangleBaseURL.Align := TAlignLayout.Top;
  end
  else
  begin
    Self.RectangleBaseURL.Align := TAlignLayout.VertCenter;
  end;
end;


end.
