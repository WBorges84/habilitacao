unit R2DW.Habilitacao.Page.Relatorio;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Effects, FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls;

type
  TPageRelatorio = class(TForm)
    LayPrincipal: TLayout;
    LayTop: TLayout;
    Image5: TImage;
    ShadowEffect1: TShadowEffect;
    LayButtons: TLayout;
    Layout4: TLayout;
    btnNovaProva: TImage;
    Image2: TImage;
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
  PageRelatorio: TPageRelatorio;

implementation

{$R *.fmx}

procedure TPageRelatorio.Image7Click(Sender: TObject);
begin
close;
end;

end.
