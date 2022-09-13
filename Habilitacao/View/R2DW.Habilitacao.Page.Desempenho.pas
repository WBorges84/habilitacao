unit R2DW.Habilitacao.Page.Desempenho;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Effects, FMX.Objects, FMX.Layouts;

type
  TPageDesempenho = class(TForm)
    LayPrincipal: TLayout;
    LayTop: TLayout;
    Image5: TImage;
    ShadowEffect1: TShadowEffect;
    LayButtons: TLayout;
    Layout4: TLayout;
    btnAprovacao: TImage;
    Image2: TImage;
    Layout1: TLayout;
    Image3: TImage;
    Image4: TImage;
    Layout2: TLayout;
    Image1: TImage;
    Image6: TImage;
    Layout3: TLayout;
    Image7: TImage;
    Label1: TLabel;
    procedure Image7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PageDesempenho: TPageDesempenho;

implementation

{$R *.fmx}

procedure TPageDesempenho.Image7Click(Sender: TObject);
begin
close;
end;

end.
