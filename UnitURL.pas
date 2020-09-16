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

// Unidade adaptada de:
// https://www.it-swarm.dev/pt/delphi/como-abrir-um-url-com-o-navegador-padrao-com-os-aplicativos-de-plataforma-cruzada-do-firemonkey/940112364/
// Muito grato ao portal it-swarm pela generosa contribuição pública.

unit UnitURL;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  {$IF Defined(IOS)}
    macapi.helpers, iOSapi.Foundation, FMX.helpers.iOS;
  {$ELSEIF Defined(Android)}
    Androidapi.JNI.GraphicsContentViewText,
    Androidapi.JNI.Net, Androidapi.JNI.App,
    Androidapi.helpers;
  {$ELSEIF Defined(MACOS)}
    Posix.Stdlib;
  {$ELSEIF Defined(MSWINDOWS)}
    Winapi.ShellAPI, Winapi.Windows;
  {$ENDIF}

type
  tURL = class
    class procedure Open(URL: string);
  end;

implementation

{---------------------------------[ CLASS PROCEDURE ]--------------------------}
class procedure tURL.Open(URL: string);
{$IF Defined(Android)}
var
  Intent: JIntent;
{$ENDIF}
begin
{$IF Defined(Android)}
  Intent := TJIntent.Create;
  Intent.setAction(TJIntent.JavaClass.ACTION_VIEW);
  Intent.setData(StrToJURI(URL));
  tandroidhelper.Activity.startActivity(Intent);
  // SharedActivity.startActivity(Intent);
{$ELSEIF Defined(MSWINDOWS)}
  ShellExecute(0, 'OPEN', PWideChar(URL), nil, nil, SW_SHOWNORMAL);
{$ELSEIF Defined(IOS)}
  SharedApplication.OpenURL(StrToNSUrl(URL));
{$ELSEIF Defined(MACOS)}
  _system(PAnsiChar('open ' + AnsiString(URL)));
{$ENDIF}
end;

end.
