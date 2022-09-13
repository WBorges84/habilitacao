unit R2DW.Habilitacao.Page.CadPergunta;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Effects,
  FMX.Objects, FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls,
  FMX.Memo.Types, FMX.Edit, FMX.ScrollBox, FMX.Memo, System.Rtti;

type
  TPageCadastro = class(TForm)
    LayPrincipal: TLayout;
    LayTop: TLayout;
    Image5: TImage;
    ShadowEffect1: TShadowEffect;
    LayButtons: TLayout;
    Layout1: TLayout;
    Label1: TLabel;
    Layout3: TLayout;
    MemoPergunta: TMemo;
    Layout4: TLayout;
    Label3: TLabel;
    Layout2: TLayout;
    Label2: TLabel;
    Layout5: TLayout;
    EdtResp1: TEdit;
    Layout7: TLayout;
    Label4: TLabel;
    Layout6: TLayout;
    EdtResp2: TEdit;
    Layout8: TLayout;
    Label5: TLabel;
    Layout9: TLayout;
    EdtResp3: TEdit;
    Layout10: TLayout;
    Label6: TLabel;
    Layout11: TLayout;
    EdtResp4: TEdit;
    Layout12: TLayout;
    btnLimpar: TButton;
    btnCadastro: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    Layout13: TLayout;
    checkImg: TCheckBox;
    edtNomeImg: TEdit;
    procedure btnLimparClick(Sender: TObject);
    procedure btnCadastroClick(Sender: TObject);
    procedure checkImgChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PageCadastro: TPageCadastro;

implementation

uses
  FireDAC.Comp.Client, R2DW.HABILITACAO.MODEL;

{$R *.fmx}

procedure TPageCadastro.btnCadastroClick(Sender: TObject);
var
  qryP, qryR: TFDQuery;
  idPergunta : Integer;

  img : boolean;
  Correta, nomeImg : String;
begin

  if (trim(MemoPergunta.Text) = '') or (trim(EdtResp1.Text) = '') or (trim(EdtResp2.Text) = '') or  (trim(EdtResp3.Text) = '') or  (trim(EdtResp4.Text) = '') then
  begin
    ShowMessage('Existe campo em Branco!');
    exit;
  end;

  if (checkImg.IsChecked) and (trim(edtNomeImg.Text) = '') then
  begin
    ShowMessage('Se for com imagem, terá que digitar um nome para a mesma.');
    edtNomeImg.SetFocus;
    exit;
  end;

  if checkImg.IsChecked then
  begin
    img := true;
    nomeImg := edtNomeImg.Text;
  end
  else
  begin
    img := false;
  end;


  if CheckBox1.IsChecked then
  Correta := 'A';

  if CheckBox2.IsChecked then
  Correta := 'B';

  if CheckBox3.IsChecked then
  Correta := 'C';

  if CheckBox4.IsChecked then
  Correta := 'D';

  try
    qryP := TFDQuery.Create(nil);
    qryP.Connection := DataModule1.conn;

    qryR := TFDQuery.Create(nil);
    qryR.Connection := DataModule1.conn;

    //Verifica se pergunta já existe
    qryP.SQL.Clear;
    qryP.SQL.Add('SELECT * FROM TAB_PERGUNTAS WHERE PERGUNTA = :PERGUNTA');
    qryP.ParamByName('PERGUNTA').AsString := MemoPergunta.Text;
    qryP.Open;



    if NOT qryP.IsEmpty then
    begin
      ShowMessage('Pergunta já cadastrarda');
      EXIT;
    end
    else
    begin

      qryP.SQL.Clear;
      qryP.SQL.Add('INSERT INTO TAB_PERGUNTAS(PERGUNTA, img_conf, img) values(:PERGUNTA, :img_conf, :img) ');
      qryP.ParamByName('PERGUNTA').AsString := MemoPergunta.Text;
      qryP.ParamByName('img_conf').AsBoolean := img;
      qryP.ParamByName('img').AsString := nomeImg;
      qryP.ExecSQL;

      qryP.SQL.Clear;
      qryP.SQL.Add('SELECT * FROM TAB_PERGUNTAS WHERE PERGUNTA = :PERGUNTA');
      qryP.ParamByName('PERGUNTA').AsString := MemoPergunta.Text;
      qryP.Open;


       idPergunta := qryP.FieldByName('ID').AsInteger;
    end;

    //INSERIR RESPOSTAS
    qryR.SQL.Clear;
    qryR.SQL.Add('INSERT INTO RESPOSTAS(RES_A,RES_B,RES_C,RES_D,RES_CERTA, ID_PERGUNTA)');
    qryR.SQL.Add('values(:RES_A,:RES_B,:RES_C,:RES_D,:RES_CERTA, :ID_PERGUNTA) ');
    qryR.ParamByName('RES_A').AsString := EdtResp1.Text;
    qryR.ParamByName('RES_B').AsString := EdtResp2.Text;
    qryR.ParamByName('RES_C').AsString := EdtResp3.Text;
    qryR.ParamByName('RES_D').AsString := EdtResp4.Text;
    qryR.ParamByName('RES_CERTA').AsString := Correta;
    qryR.ParamByName('ID_PERGUNTA').AsInteger := idPergunta ;
    qryR.ExecSQL;

    MemoPergunta.Text := '';
    EdtResp1.Text := '';
    EdtResp2.Text := '';
    EdtResp3.Text := '';
    EdtResp4.Text := '';
    CheckBox1.IsChecked := false;
    CheckBox2.IsChecked := false;
    CheckBox3.IsChecked := false;
    CheckBox4.IsChecked := false;
    checkImg.IsChecked := false;

    ShowMessage('CADASTRADO COM SUCESSO');

  except on E:Exception do
                raise Exception.Create('Erro ao cadastrar a Pergunta: ' + E.Message);


  end;
   qryP.DisposeOf;
end;

procedure TPageCadastro.btnLimparClick(Sender: TObject);
begin
  MemoPergunta.Text := '';
  EdtResp1.Text := '';
  EdtResp2.Text := '';
  EdtResp3.Text := '';
  EdtResp4.Text := '';
  edtNomeImg.Text := '';
  checkImg.IsChecked := false;


end;

procedure TPageCadastro.checkImgChange(Sender: TObject);
begin
 if checkImg.IsChecked then
 begin
   edtNomeImg.Enabled := true;
 end
 else
 begin
   edtNomeImg.Enabled := false;
   edtNomeImg.Text := '';
 end;

end;

end.
