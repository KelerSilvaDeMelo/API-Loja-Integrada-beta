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

unit UnitFormPrincipalEngrenagem;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, System.Actions,
  FMX.ActnList, UnitFormBaseURL, UnitParametrosHTTP, FMX.Effects, FMX.ani;

type
  TFormPrincipalEngrenagem = class(TForm)
    LayoutEngrenagem: TLayout;
    ActionList1: TActionList;
    ActionBaseURL: TAction;
    ActionParametrosHTTP: TAction;
    ActionSair: TAction;
    RectangleTapaFundo: TRectangle;
    RectangleMenuEngrenagem: TRectangle;
    ButtonBaseURL: TButton;
    ButtonParametrosHTTP: TButton;
    ButtonSair: TButton;
    ShadowEffectMenuEngrenagem: TShadowEffect;
    TimerFecha: TTimer;

    procedure FormDestroy(Sender: TObject);

    procedure LayoutEngrenagemClick(Sender: TObject);
    procedure RectangleEngrenagemClick(Sender: TObject);
    procedure RectangleTapaFundoClick(Sender: TObject);

    procedure ActionBaseURLExecute(Sender: TObject);
    procedure ActionParametrosHTTPExecute(Sender: TObject);
    procedure ActionSairExecute(Sender: TObject);
    procedure TimerFechaTimer(Sender: TObject);

  private
    { Private symbols }
    FFormFechar: TForm;
    FImageEngrenagem: TImage;
    FLayoutTransicao: TLayout;
    FPopUpMargem: Single;
    FPopUpEmAcao: Boolean;
    FComandoFechar: Boolean;

  private
    { Private declarations }
    procedure DeslizaParaDentro;
    procedure DeslizaParaFora;

    procedure LiberaEngrenagem;

  public
    { Public declarations }
    procedure AcionaEngrenagem( FormClose: TForm; Engrenagem: TImage; Layout: TLayout; Margem: Single );

  end;

var
  FormPrincipalEngrenagem: TFormPrincipalEngrenagem;

implementation

{$R *.fmx}

{---------------------------------[ INTERNAL ]---------------------------------}
procedure TFormPrincipalEngrenagem.FormDestroy(Sender: TObject);
begin
  Self.FImageEngrenagem  := nil;
  Self.FLayoutTransicao  := nil;
  Self.FPopUpMargem      := 0;
end;

procedure TFormPrincipalEngrenagem.LayoutEngrenagemClick(Sender: TObject);
begin
  Self.LiberaEngrenagem;
end;

procedure TFormPrincipalEngrenagem.RectangleEngrenagemClick(Sender: TObject);
begin
  Self.LiberaEngrenagem;
end;

procedure TFormPrincipalEngrenagem.RectangleTapaFundoClick(Sender: TObject);
begin
  Self.LiberaEngrenagem;
end;

procedure TFormPrincipalEngrenagem.TimerFechaTimer(Sender: TObject);
begin
  Self.TimerFecha.Enabled       := False;
  Self.LayoutEngrenagem.Parent  := Self;

  if Self.FComandoFechar then
  begin
    Self.FComandoFechar := False;
    Self.FFormFechar.Close;
  end;
  Self.FFormFechar := nil;
end;

{---------------------------------[ ACTION ]-----------------------------------}
procedure TFormPrincipalEngrenagem.ActionBaseURLExecute(Sender: TObject);
begin
  FormBaseURL.LayoutBaseURL.Parent := Self.LayoutEngrenagem.Parent;
end;

procedure TFormPrincipalEngrenagem.ActionParametrosHTTPExecute(Sender: TObject);
begin
  FormparametrosHTTP.LayoutParametrosHTTP.Parent := Self.LayoutEngrenagem.Parent;
end;

procedure TFormPrincipalEngrenagem.ActionSairExecute(Sender: TObject);
begin
  Self.FComandoFechar := True;
  Self.LiberaEngrenagem;
end;


{---------------------------------[ PRIVATE ]----------------------------------}
procedure TFormPrincipalEngrenagem.DeslizaParaDentro;
var
  PosicaoX, Largura, Margem: Single;
  PosicaoFora, PosicaoDentro: Single;
begin
  PosicaoX      := Self.FLayoutTransicao.Width;
  Largura       := Self.RectangleMenuEngrenagem.Width;
  Margem        := Self.FPopUpMargem;
  PosicaoFora   := PosicaoX + Margem;
  PosicaoDentro := PosicaoX - Largura - Margem;

  Self.RectangleTapaFundo.Opacity         := 0.1;
  Self.RectangleMenuEngrenagem.Opacity    := 0.1;
  Self.LayoutEngrenagem.Parent            := Self.FLayoutTransicao;
  Self.RectangleMenuEngrenagem.Position.X := PosicaoFora;

  TAnimator.AnimateFloat( Self.FImageEngrenagem       , 'RotationAngle', Self.FImageEngrenagem.RotationAngle+90, 0.15, TAnimationType.&In, TInterpolationType.Exponential );
  TAnimator.AnimateFloat( Self.RectangleMenuEngrenagem, 'Position.X'   , PosicaoDentro                         , 0.15, TAnimationType.&In, TInterpolationType.Exponential );
  TAnimator.AnimateFloat( Self.RectangleTapaFundo     , 'Opacity'      , 1                                     , 0.15, TAnimationType.&In, TInterpolationType.Exponential );
  TAnimator.AnimateFloat( Self.RectangleMenuEngrenagem, 'Opacity'      , 1                                     , 0.15, TAnimationType.&In, TInterpolationType.Exponential );
end;

procedure TFormPrincipalEngrenagem.DeslizaParaFora;
var
  PosicaoX, Largura, Margem: Single;
  PosicaoFora, PosicaoDentro: Single;
begin
  PosicaoX      := Self.FLayoutTransicao.Width;
  Largura       := Self.RectangleMenuEngrenagem.Width;
  Margem        := Self.FPopUpMargem;
  PosicaoFora   := PosicaoX + Margem;
  PosicaoDentro := PosicaoX - Largura - Margem;

  Self.RectangleTapaFundo.Opacity         := 1;
  Self.RectangleMenuEngrenagem.Opacity    := 1;
  Self.RectangleMenuEngrenagem.Position.X := PosicaoDentro;
  Self.LayoutEngrenagem.Parent            := Self.FLayoutTransicao;

  TAnimator.AnimateFloat( Self.FImageEngrenagem       , 'RotationAngle', Self.FImageEngrenagem.RotationAngle-90 , 0.15, TAnimationType.&In, TInterpolationType.Exponential );
  TAnimator.AnimateFloat( Self.RectangleMenuEngrenagem, 'Position.X'   , PosicaoFora                            , 0.15, TAnimationType.&In, TInterpolationType.Exponential );
  TAnimator.AnimateFloat( Self.RectangleTapaFundo     , 'Opacity'      , 0.1                                    , 0.15, TAnimationType.&In, TInterpolationType.Exponential );
  TAnimator.AnimateFloat( Self.RectangleMenuEngrenagem, 'Opacity'      , 0.1                                    , 0.15, TAnimationType.&In, TInterpolationType.Exponential );

  Self.TimerFecha.Enabled := True;
end;

procedure TFormPrincipalEngrenagem.LiberaEngrenagem;
begin
  Self.DeslizaParaFora;

  Self.FPopUpEmAcao      := False;
end;

{---------------------------------[ PUBLIC ]-----------------------------------}
procedure TFormPrincipalEngrenagem.AcionaEngrenagem( FormClose: TForm;  Engrenagem: TImage;
  Layout: TLayout; Margem: Single );
begin
  while Self.FPopUpEmAcao do
  begin
    Sleep( 100 );
  end;

  Self.FPopUpEmAcao      := True;

  Self.FFormFechar       := FormClose;
  Self.FImageEngrenagem  := Engrenagem;
  Self.FLayoutTransicao  := Layout;
  Self.FPopUpMargem      := Margem;

  Self.DeslizaParaDentro;
end;


end.
