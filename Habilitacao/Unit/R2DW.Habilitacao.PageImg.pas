unit R2DW.Habilitacao.PageImg;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects;

type
  TPageImg = class(TForm)
    obras: TRectangle;
    oleo: TRectangle;
    nao: TRectangle;
    estacionar: TRectangle;
    filadupla: TRectangle;
    lombada: TRectangle;
    linha: TRectangle;
    estreitamentoesquerda: TRectangle;
    infracao: TRectangle;
    sinalizando: TRectangle;
    vireadireita: TRectangle;
    bateria: TRectangle;
    curva: TRectangle;
  private
    { Private declarations }
  public
  function PegaImagem(nome : string): TRectangle;
    { Public declarations }
  end;

var
  PageImg: TPageImg;

implementation

{$R *.fmx}

{ TPageImg }

function TPageImg.PegaImagem(nome: string): TRectangle;
begin

    if nome = 'obras' then
    begin
      Result := obras;
    end;

    if nome = 'oleo' then
    begin
      Result := oleo;
    end;

    if nome = 'filadupla' then
    begin
      Result := filadupla;
    end;

    if nome = 'estacionar' then
    begin
      Result := estacionar;
    end;

    if nome = 'lombada' then
    begin
      Result := lombada;
    end;

    if nome = 'infracao' then
    begin
      Result := infracao;
    end;

    if nome = 'estreitamentoesquerda' then
    begin
      Result := estreitamentoesquerda;
    end;

    if nome = 'linha' then
    begin
      Result := linha;
    end;

     if nome = 'sinalizando' then
    begin
      Result := sinalizando;
    end;

    if nome = 'vireadireita' then
    begin
    Result := vireadireita;
    end;

     if nome = 'bateria' then
    begin
    Result := bateria;
    end;

    if nome = 'curva' then
    begin
    Result := curva;
    end;

end;

end.
