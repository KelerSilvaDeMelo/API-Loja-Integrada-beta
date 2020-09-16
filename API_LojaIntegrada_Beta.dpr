program API_LojaIntegrada_Beta;

uses
  System.StartUpCopy,
  FMX.Forms,
  UnitFormPrincipal in 'UnitFormPrincipal.pas' {FormPrincipal},
  UnitFormPrincipalEngrenagem in 'UnitFormPrincipalEngrenagem.pas' {FormPrincipalEngrenagem},
  UnitFormBaseURL in 'UnitFormBaseURL.pas' {FormBaseURL},
  UnitParametrosHTTP in 'UnitParametrosHTTP.pas' {FormparametrosHTTP},
  UnitURL in 'UnitURL.pas',
  UnitFormApiListarCategorias in 'UnitFormApiListarCategorias.pas' {FormApiListarCategorias},
  UnitFormApiListarMarcas in 'UnitFormApiListarMarcas.pas' {FormApiListarMarcas},
  UnitFormApiListarGrades in 'UnitFormApiListarGrades.pas' {FormApiListarGrades},
  UnitFormApiListarEstoque in 'UnitFormApiListarEstoque.pas' {FormApiListarEstoque},
  UnitFormApiListarPrecos in 'UnitFormApiListarPrecos.pas' {FormApiListarPrecos},
  UnitFormApiListarProdutos in 'UnitFormApiListarProdutos.pas' {FormApiListarProdutos},
  UnitFormApiProdutoImagem in 'UnitFormApiProdutoImagem.pas' {FormApiProdutoImagem},
  UnitFormApiSeo in 'UnitFormApiSeo.pas' {FormApiSeo},
  UnitFormApiListarClientes in 'UnitFormApiListarClientes.pas' {FormApiListarClientes},
  UnitFormApiListarGrupos in 'UnitFormApiListarGrupos.pas' {FormApiListarGrupos},
  UnitFormApiListarBancos in 'UnitFormApiListarBancos.pas' {FormApiListarBancos},
  UnitFormApiListarPagamentos in 'UnitFormApiListarPagamentos.pas' {FormApiListarPagamentos},
  UnitFormApiListarEnvio in 'UnitFormApiListarEnvio.pas' {FormApiListarEnvio},
  UnitFormApiListarSituacao in 'UnitFormApiListarSituacao.pas' {FormApiListarSituacao},
  UnitFormApiListarPedidos in 'UnitFormApiListarPedidos.pas' {FormApiListarPedidos},
  UnitDataModulePrincipal in 'UnitDataModulePrincipal.pas' {DataModulePrincipal: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.CreateForm(TDataModulePrincipal, DataModulePrincipal);
  Application.CreateForm(TFormPrincipalEngrenagem, FormPrincipalEngrenagem);
  Application.CreateForm(TFormBaseURL, FormBaseURL);
  Application.CreateForm(TFormparametrosHTTP, FormparametrosHTTP);
  Application.CreateForm(TFormApiListarCategorias, FormApiListarCategorias);
  Application.CreateForm(TFormApiListarMarcas, FormApiListarMarcas);
  Application.CreateForm(TFormApiListarGrades, FormApiListarGrades);
  Application.CreateForm(TFormApiListarEstoque, FormApiListarEstoque);
  Application.CreateForm(TFormApiListarPrecos, FormApiListarPrecos);
  Application.CreateForm(TFormApiListarProdutos, FormApiListarProdutos);
  Application.CreateForm(TFormApiProdutoImagem, FormApiProdutoImagem);
  Application.CreateForm(TFormApiSeo, FormApiSeo);
  Application.CreateForm(TFormApiListarClientes, FormApiListarClientes);
  Application.CreateForm(TFormApiListarGrupos, FormApiListarGrupos);
  Application.CreateForm(TFormApiListarBancos, FormApiListarBancos);
  Application.CreateForm(TFormApiListarPagamentos, FormApiListarPagamentos);
  Application.CreateForm(TFormApiListarEnvio, FormApiListarEnvio);
  Application.CreateForm(TFormApiListarSituacao, FormApiListarSituacao);
  Application.CreateForm(TFormApiListarPedidos, FormApiListarPedidos);
  Application.CreateForm(TDataModulePrincipal, DataModulePrincipal);
  Application.Run;
end.
