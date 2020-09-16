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
//
// Url Base: https://api.awsli.com.br/v1
// Uri Categoria/Categorias/Listar todas as categorias: /categoria
// Uri Marca/Marcas/Listar todas as marcas: /marca
//


unit UnitDataModulePrincipal;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.StorageBin, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TDataModulePrincipal = class(TDataModule)
    FDMemTableParametroSistema: TFDMemTable;
    FDMemTableParametroSistemaBaseURL: TStringField;
    FDMemTableParametroHTTP: TFDMemTable;
    FDMemTableParametroHTTPKey: TStringField;
    FDMemTableParametroHTTPValue: TStringField;

  private
    { Private declarations }

  public
    { Public declarations }

  end;

var
  DataModulePrincipal: TDataModulePrincipal;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

end.
