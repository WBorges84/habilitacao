program Habilitacao;

uses
  System.StartUpCopy,
  FMX.Forms,
  R2DW.Habilitacao.Page.Main in 'R2DW.Habilitacao.Page.Main.pas' {PageMain},
  R2DW.Habilitacao.Page.Prova in 'R2DW.Habilitacao.Page.Prova.pas' {PageProva},
  R2DW.HABILITACAO.MODEL in '..\Model\R2DW.HABILITACAO.MODEL.pas' {DataModule1: TDataModule},
  R2DW.Habilitacao.Page.CadPergunta in 'R2DW.Habilitacao.Page.CadPergunta.pas' {PageCadastro},
  R2DW.Habilitacao.PageImg in '..\Unit\R2DW.Habilitacao.PageImg.pas' {PageImg},
  R2DW.Habilitacao.Page.Relatorio in 'R2DW.Habilitacao.Page.Relatorio.pas' {PageRelatorio},
  R2DW.Habilitacao.Page.Desempenho in 'R2DW.Habilitacao.Page.Desempenho.pas' {PageDesempenho};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TPageMain, PageMain);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TPageImg, PageImg);
  Application.CreateForm(TPageRelatorio, PageRelatorio);
  Application.CreateForm(TPageDesempenho, PageDesempenho);
  Application.Run;
end.
