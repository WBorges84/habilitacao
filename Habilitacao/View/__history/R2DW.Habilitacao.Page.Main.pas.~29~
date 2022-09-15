unit R2DW.Habilitacao.Page.Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts, FMX.Effects;

type
  TPageMain = class(TForm)
    LayPrincipal: TLayout;
    LayTop: TLayout;
    LayBanner: TLayout;
    ImgBanner: TImage;
    Label1: TLabel;
    LayButtons: TLayout;
    Layout4: TLayout;
    btnNovaProva: TImage;
    Image2: TImage;
    Layout1: TLayout;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    ShadowEffect1: TShadowEffect;
    Layout2: TLayout;
    Image1: TImage;
    procedure btnNovaProvaClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
  private
    { Private declarations }
  public
  testeGIT : String;
    { Public declarations }
  end;

var
  PageMain: TPageMain;

implementation

{$R *.fmx}

uses R2DW.Habilitacao.Page.Prova, R2DW.Habilitacao.Page.CadPergunta,
  R2DW.HABILITACAO.MODEL, R2DW.Habilitacao.Page.Relatorio,
  R2DW.Habilitacao.Page.Desempenho;

procedure TPageMain.btnNovaProvaClick(Sender: TObject);
begin
  if NOT Assigned(PageProva) then
  Application.CreateForm(TPageProva, PageProva);

  PageProva.Show;
  DataModule1.chamaPergunta;
  PageProva.lblCronometro.Visible := true;
  PageProva.lblNQuestao.Text := 'Questão: 1 de 30';
  PageProva.btnAnterior.Enabled := false;
  PageProva.ComErros := false;
  PageProva.Act1.Execute;

end;

procedure TPageMain.Image1Click(Sender: TObject);
begin
   if NOT Assigned(PageCadastro) then
  Application.CreateForm(TPageCadastro, PageCadastro);

  PageCadastro.Show;

end;

procedure TPageMain.Image2Click(Sender: TObject);
begin
    if NOT Assigned(PageProva) then
  Application.CreateForm(TPageProva, PageProva);

  PageProva.Show;
  DataModule1.ProvaComErros;
  PageProva.Act1.Execute;
  PageProva.lblNQuestao.Text := 'Questão: 1 de 30';
  PageProva.btnAnterior.Enabled := false;
  PageProva.ComErros := true;
  PageProva.lblCronometro.Visible := true;
end;

procedure TPageMain.Image3Click(Sender: TObject);
begin
 if NOT Assigned(PageRelatorio) then
  Application.CreateForm(TPageRelatorio, PageRelatorio);

  PageRelatorio.Show;

end;

procedure TPageMain.Image4Click(Sender: TObject);
begin
 if NOT Assigned(PageDesempenho) then
  Application.CreateForm(TPageDesempenho, PageDesempenho);

  PageDesempenho.Show;
end;

end.
