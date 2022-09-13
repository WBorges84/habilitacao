unit R2DW.HABILITACAO.MODEL;

interface

uses
   System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.FMXUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FMX.Types, FMX.Controls, FMX.Objects;

type
  TDataModule1 = class(TDataModule)
    conn: TFDConnection;
    procedure DataModuleCreate(Sender: TObject);
  private



    { Private declarations }
  public
    acertos, erros : double;
    procedure CheckFalse;
    procedure chamaPergunta;
    procedure ProvaComErros;
    procedure CorrigirComErradas;
    procedure Corrigir;
    procedure LimpaSelecionadas;
    procedure PreencheImagem1(id: Integer; ret: TRectangle);
    procedure PreencheImagem2(id: Integer; ret: TRectangle);
    procedure PreencheImagem3(id: Integer; ret: TRectangle);
    procedure PreencheImagem4(id: Integer; ret: TRectangle);
    procedure PreencheImagem5(id: Integer; ret: TRectangle);
    procedure PreencheImagem6(id: Integer; ret: TRectangle);
    procedure PreencheImagem7(id: Integer; ret: TRectangle);
    procedure PreencheImagem8(id: Integer; ret: TRectangle);
    procedure PreencheImagem9(id: Integer; ret: TRectangle);
    procedure PreencheImagem10(id: Integer; ret: TRectangle);
    procedure PreencheImagem11(id: Integer; ret: TRectangle);
    procedure PreencheImagem12(id: Integer; ret: TRectangle);
    procedure PreencheImagem13(id: Integer; ret: TRectangle);
    procedure PreencheImagem14(id: Integer; ret: TRectangle);
    procedure PreencheImagem15(id: Integer; ret: TRectangle);
    procedure PreencheImagem16(id: Integer; ret: TRectangle);
    procedure PreencheImagem17(id: Integer; ret: TRectangle);
    procedure PreencheImagem18(id: Integer; ret: TRectangle);
    procedure PreencheImagem19(id: Integer; ret: TRectangle);
    procedure PreencheImagem20(id: Integer; ret: TRectangle);
    procedure PreencheImagem21(id: Integer; ret: TRectangle);
    procedure PreencheImagem22(id: Integer; ret: TRectangle);
    procedure PreencheImagem23(id: Integer; ret: TRectangle);
    procedure PreencheImagem24(id: Integer; ret: TRectangle);
    procedure PreencheImagem25(id: Integer; ret: TRectangle);
    procedure PreencheImagem26(id: Integer; ret: TRectangle);
    procedure PreencheImagem27(id: Integer; ret: TRectangle);
    procedure PreencheImagem28(id: Integer; ret: TRectangle);
    procedure PreencheImagem29(id: Integer; ret: TRectangle);
    procedure PreencheImagem30(id: Integer; ret: TRectangle);


    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses R2DW.Habilitacao.Page.Prova, R2DW.Habilitacao.PageImg,
  R2DW.Habilitacao.Page.CadPergunta, R2DW.Habilitacao.Page.Main, FMX.Forms,
  System.IOUtils;

{$R *.dfm}

procedure TDAtaModule1.ProvaComErros;
var
  reg, ID, REGIS,CONTAGEM : Integer;
  consulta : Boolean;
  qry, qryS, qryR : TFDQuery;
  questao : array[1..30] of Integer;
  img: array[1..30] of Boolean;
  resp: array[1..30] of String;
begin
  try

    qry := TFDQuery.Create(nil);
    qry.Connection := conn;

    qryS := TFDQuery.Create(nil);
    qryS.Connection := conn;

    qryR := TFDQuery.Create(nil);
    qryR.Connection := conn;

    QRY.SQL.Clear;
    QRY.SQL.Add('SELECT COUNT(ID_ERRADAS) AS QTD FROM TAB_ERRADAS');
    QRY.Open;

    reg := qry.FieldByName('QTD').AsInteger;


    if reg > 29 then

    begin

         // PERGUNTA 1

      qry.SQL.Clear;
      qry.SQL.Add('SELECT * FROM TAB_ERRADAS ORDER BY RANDOM() LIMIT 1');
      qry.Open;

      ID := qry.FieldByName('ID_ERRADAS').AsInteger;


      PageProva.questao[1] := ID;
      img[1] := qry.FieldByName('img_conf').AsBoolean;

      if img[1] = true then
      begin
        PageProva.imgPergunta1.Visible := true;
        PreencheImagem1(ID, PageProva.imgPergunta1);
      end
      else
      begin
        PageProva.imgPergunta1.Visible := false;

      end;




      qryS.SQL.Clear;
      qryS.SQL.Add('INSERT INTO TAB_PERGUNTAS_SELECT(COD_PERGUNTA) values(:COD_PERGUNTA) ');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.ExecSQL;



    //ADICIONA PERGUNTA
    PageProva.lblPergunta1.Text := qry.FieldByName('PERGUNTAS').AsString;

    qryR.SQL.Clear;
    qryR.SQL.Add('SELECT * FROM RESPOSTAS WHERE ID_PERGUNTA = :ID');
    qryR.ParamByName('ID').AsInteger := ID;
    qryR.Open;
    resp[1] := qryR.FieldByName('RES_CERTA').AsString;
    PageProva.lblRespA1.Text := qryR.FieldByName('RES_A').AsString;
    PageProva.lblRespB1.Text := qryR.FieldByName('RES_B').AsString;
    PageProva.lblRespC1.Text := qryR.FieldByName('RES_C').AsString;
    PageProva.lblRespD1.Text := qryR.FieldByName('RES_D').AsString;

    qryS.SQL.Clear;
    qryS.SQL.Add('UPDATE TAB_PERGUNTAS_SELECT SET COD_RESPOSTA = :COD_RESPOSTA WHERE COD_PERGUNTA = :ID ');
    qryS.ParamByName('COD_RESPOSTA').AsString := resp[1];
    qryS.ParamByName('ID').AsInteger := ID;
    qryS.ExecSQL;

     //---- PERGUNTA 2  ----//

         //VERIFICA SE PERGUNTA J� ESTA ADICIONADA



      REGIS := 1;
      while REGIS = 1 do
      begin
        qry.SQL.Clear;
        qry.SQL.Add('SELECT * FROM TAB_ERRADAS ORDER BY RANDOM() LIMIT 1');
        qry.Open;

        ID := qry.FieldByName('ID_erradas').AsInteger;

        PageProva.questao[2] := ID;

        img[2] := qry.FieldByName('img_conf').AsBoolean;

       if img[2] = true then
        begin
          PageProva.imgPergunta2.Visible := true;
          PreencheImagem2(ID, PageProva.imgPergunta2);
        end
        else
        begin
          PageProva.imgPergunta2.Visible := false;

        end;

        qryS.SQL.Clear;
        qryS.SQL.Add('SELECT * FROM TAB_PERGUNTAS_SELECT WHERE COD_PERGUNTA = :COD_PERGUNTA');
        qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
        qryS.Open;

        CONTAGEM := CONTAGEM + 1;

        if CONTAGEM > 30 then
        begin
          exit;
        end;

        //consulta := qryS.Get;

        if qryS.Eof then
        begin
          REGIS := 0;
        end;

      end;

      qryS.SQL.Clear;
      qryS.SQL.Add('INSERT INTO TAB_PERGUNTAS_SELECT(COD_PERGUNTA) values(:COD_PERGUNTA) ');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.ExecSQL;

      PageProva.lblPergunta2.Text := qry.FieldByName('PERGUNTAS').AsString;

      qryR.SQL.Clear;
      qryR.SQL.Add('SELECT * FROM RESPOSTAS WHERE ID_PERGUNTA = :ID');
      qryR.ParamByName('ID').AsInteger := ID;
      qryR.Open;


      resp[2] := qryR.FieldByName('RES_CERTA').AsString;
      PageProva.lblRespA2.Text := qryR.FieldByName('RES_A').AsString;
      PageProva.lblRespB2.Text := qryR.FieldByName('RES_B').AsString;
      PageProva.lblRespC2.Text := qryR.FieldByName('RES_C').AsString;
      PageProva.lblRespD2.Text := qryR.FieldByName('RES_D').AsString;


      qryS.SQL.Clear;
      qryS.SQL.Add('UPDATE TAB_PERGUNTAS_SELECT SET COD_RESPOSTA = :COD_RESPOSTA WHERE COD_PERGUNTA = :ID ');
      qryS.ParamByName('COD_RESPOSTA').AsString := resp[2];
      qryS.ParamByName('ID').AsInteger := ID;
      qryS.ExecSQL;

     //---- PERGUNTA 2  ----//

     //---- PERGUNTA 3  ----//

         //VERIFICA SE PERGUNTA J� ESTA ADICIONADA



      REGIS := 1;
      while REGIS = 1 do
      begin
        qry.SQL.Clear;
        qry.SQL.Add('SELECT * FROM TAB_ERRADAS ORDER BY RANDOM() LIMIT 1');
        qry.Open;

        ID := qry.FieldByName('ID_ERRADAS').AsInteger;

        PageProva.questao[3] := ID;

        img[3] := qry.FieldByName('img_conf').AsBoolean;

       if img[3] = true then
        begin
          PageProva.imgPergunta3.Visible := true;
          PreencheImagem3(ID, PageProva.imgPergunta3);
        end
        else
        begin
          PageProva.imgPergunta3.Visible := false;

        end;

        qryS.SQL.Clear;
        qryS.SQL.Add('SELECT * FROM TAB_PERGUNTAS_SELECT WHERE COD_PERGUNTA = :COD_PERGUNTA');
        qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
        qryS.Open;

        if qryS.IsEmpty then
        begin
          REGIS := 0;
        end;

      end;

      qryS.SQL.Clear;
      qryS.SQL.Add('INSERT INTO TAB_PERGUNTAS_SELECT(COD_PERGUNTA) values(:COD_PERGUNTA) ');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.ExecSQL;

      PageProva.lblPergunta3.Text := qry.FieldByName('PERGUNTAS').AsString;

      qryR.SQL.Clear;
      qryR.SQL.Add('SELECT * FROM RESPOSTAS WHERE ID_PERGUNTA = :ID');
      qryR.ParamByName('ID').AsInteger := ID;
      qryR.Open;


      resp[3] := qryR.FieldByName('RES_CERTA').AsString;
      PageProva.lblRespA3.Text := qryR.FieldByName('RES_A').AsString;
      PageProva.lblRespB3.Text := qryR.FieldByName('RES_B').AsString;
      PageProva.lblRespC3.Text := qryR.FieldByName('RES_C').AsString;
      PageProva.lblRespD3.Text := qryR.FieldByName('RES_D').AsString;


      qryS.SQL.Clear;
      qryS.SQL.Add('UPDATE TAB_PERGUNTAS_SELECT SET COD_RESPOSTA = :COD_RESPOSTA WHERE COD_PERGUNTA = :ID ');
      qryS.ParamByName('COD_RESPOSTA').AsString := resp[3];
      qryS.ParamByName('ID').AsInteger := ID;
      qryS.ExecSQL;

     //---- PERGUNTA 3  ----//

          //---- PERGUNTA 4  ----//

         //VERIFICA SE PERGUNTA J� ESTA ADICIONADA



      REGIS := 1;
      while REGIS = 1 do
      begin
        qry.SQL.Clear;
        qry.SQL.Add('SELECT * FROM TAB_ERRADAS ORDER BY RANDOM() LIMIT 1');
        qry.Open;

        ID := qry.FieldByName('ID_ERRADAS').AsInteger;

        PageProva.questao[4] := ID;

        img[4] := qry.FieldByName('img_conf').AsBoolean;

       if img[4] = true then
        begin
          PageProva.imgPergunta4.Visible := true;
          PreencheImagem4(ID, PageProva.imgPergunta4);
        end
        else
        begin
          PageProva.imgPergunta4.Visible := false;

        end;

        qryS.SQL.Clear;
        qryS.SQL.Add('SELECT * FROM TAB_PERGUNTAS_SELECT WHERE COD_PERGUNTA = :COD_PERGUNTA');
        qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
        qryS.Open;

        if qryS.IsEmpty then
        begin
          REGIS := 0;

        end;

      end;

      qryS.SQL.Clear;
      qryS.SQL.Add('INSERT INTO TAB_PERGUNTAS_SELECT(COD_PERGUNTA) values(:COD_PERGUNTA) ');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.ExecSQL;

      PageProva.lblPergunta4.Text := qry.FieldByName('PERGUNTAS').AsString;

      qryR.SQL.Clear;
      qryR.SQL.Add('SELECT * FROM RESPOSTAS WHERE ID_PERGUNTA = :ID');
      qryR.ParamByName('ID').AsInteger := ID;
      qryR.Open;


      resp[4] := qryR.FieldByName('RES_CERTA').AsString;
      PageProva.lblRespA4.Text := qryR.FieldByName('RES_A').AsString;
      PageProva.lblRespB4.Text := qryR.FieldByName('RES_B').AsString;
      PageProva.lblRespC4.Text := qryR.FieldByName('RES_C').AsString;
      PageProva.lblRespD4.Text := qryR.FieldByName('RES_D').AsString;


      qryS.SQL.Clear;
      qryS.SQL.Add('UPDATE TAB_PERGUNTAS_SELECT SET COD_RESPOSTA = :COD_RESPOSTA WHERE COD_PERGUNTA = :ID ');
      qryS.ParamByName('COD_RESPOSTA').AsString := resp[4];
      qryS.ParamByName('ID').AsInteger := ID;
      qryS.ExecSQL;

     //---- PERGUNTA 4  ----//

               //---- PERGUNTA 5  ----//

         //VERIFICA SE PERGUNTA J� ESTA ADICIONADA



      REGIS := 1;
      while REGIS = 1 do
      begin
        qry.SQL.Clear;
        qry.SQL.Add('SELECT * FROM TAB_ERRADAS ORDER BY RANDOM() LIMIT 1');
        qry.Open;

        ID := qry.FieldByName('ID_ERRADAS').AsInteger;

        PageProva.questao[5] := ID;

        img[5] := qry.FieldByName('img_conf').AsBoolean;

       if img[5] = true then
        begin
          PageProva.imgPergunta5.Visible := true;
          PreencheImagem5(ID, PageProva.imgPergunta5);
        end
        else
        begin
          PageProva.imgPergunta5.Visible := false;

        end;

        qryS.SQL.Clear;
        qryS.SQL.Add('SELECT * FROM TAB_PERGUNTAS_SELECT WHERE COD_PERGUNTA = :COD_PERGUNTA');
        qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
        qryS.Open;

        if qryS.IsEmpty then
        begin
          REGIS := 0;

        end;

      end;

      qryS.SQL.Clear;
      qryS.SQL.Add('INSERT INTO TAB_PERGUNTAS_SELECT(COD_PERGUNTA) values(:COD_PERGUNTA) ');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.ExecSQL;

      PageProva.lblPergunta5.Text := qry.FieldByName('PERGUNTAS').AsString;

      qryR.SQL.Clear;
      qryR.SQL.Add('SELECT * FROM RESPOSTAS WHERE ID_PERGUNTA = :ID');
      qryR.ParamByName('ID').AsInteger := ID;
      qryR.Open;


      resp[5] := qryR.FieldByName('RES_CERTA').AsString;
      PageProva.lblRespA5.Text := qryR.FieldByName('RES_A').AsString;
      PageProva.lblRespB5.Text := qryR.FieldByName('RES_B').AsString;
      PageProva.lblRespC5.Text := qryR.FieldByName('RES_C').AsString;
      PageProva.lblRespD5.Text := qryR.FieldByName('RES_D').AsString;


      qryS.SQL.Clear;
      qryS.SQL.Add('UPDATE TAB_PERGUNTAS_SELECT SET COD_RESPOSTA = :COD_RESPOSTA WHERE COD_PERGUNTA = :ID ');
      qryS.ParamByName('COD_RESPOSTA').AsString := resp[5];
      qryS.ParamByName('ID').AsInteger := ID;
      qryS.ExecSQL;

     //---- PERGUNTA 5  ----//


               //---- PERGUNTA 6  ----//

         //VERIFICA SE PERGUNTA J� ESTA ADICIONADA



      REGIS := 1;
      while REGIS = 1 do
      begin
        qry.SQL.Clear;
        qry.SQL.Add('SELECT * FROM TAB_ERRADAS ORDER BY RANDOM() LIMIT 1');
        qry.Open;

        ID := qry.FieldByName('ID_ERRADAS').AsInteger;

        PageProva.questao[6] := ID;

        img[6] := qry.FieldByName('img_conf').AsBoolean;

       if img[6] = true then
        begin
          PageProva.imgPergunta6.Visible := true;
          PreencheImagem6(ID, PageProva.imgPergunta6);
        end
        else
        begin
          PageProva.imgPergunta6.Visible := false;

        end;

        qryS.SQL.Clear;
        qryS.SQL.Add('SELECT * FROM TAB_PERGUNTAS_SELECT WHERE COD_PERGUNTA = :COD_PERGUNTA');
        qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
        qryS.Open;

        if qryS.IsEmpty then
        begin
          REGIS := 0;

        end;

      end;

      qryS.SQL.Clear;
      qryS.SQL.Add('INSERT INTO TAB_PERGUNTAS_SELECT(COD_PERGUNTA) values(:COD_PERGUNTA) ');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.ExecSQL;

      PageProva.lblPergunta6.Text := qry.FieldByName('PERGUNTAS').AsString;

      qryR.SQL.Clear;
      qryR.SQL.Add('SELECT * FROM RESPOSTAS WHERE ID_PERGUNTA = :ID');
      qryR.ParamByName('ID').AsInteger := ID;
      qryR.Open;


      resp[6] := qryR.FieldByName('RES_CERTA').AsString;
      PageProva.lblRespA6.Text := qryR.FieldByName('RES_A').AsString;
      PageProva.lblRespB6.Text := qryR.FieldByName('RES_B').AsString;
      PageProva.lblRespC6.Text := qryR.FieldByName('RES_C').AsString;
      PageProva.lblRespD6.Text := qryR.FieldByName('RES_D').AsString;


      qryS.SQL.Clear;
      qryS.SQL.Add('UPDATE TAB_PERGUNTAS_SELECT SET COD_RESPOSTA = :COD_RESPOSTA WHERE COD_PERGUNTA = :ID ');
      qryS.ParamByName('COD_RESPOSTA').AsString := resp[6];
      qryS.ParamByName('ID').AsInteger := ID;
      qryS.ExecSQL;

     //---- PERGUNTA 6  ----//

                    //---- PERGUNTA 7  ----//

         //VERIFICA SE PERGUNTA J� ESTA ADICIONADA



      REGIS := 1;
      while REGIS = 1 do
      begin
        qry.SQL.Clear;
        qry.SQL.Add('SELECT * FROM TAB_ERRADAS ORDER BY RANDOM() LIMIT 1');
        qry.Open;

        ID := qry.FieldByName('ID_ERRADAS').AsInteger;

        PageProva.questao[7] := ID;

        img[7] := qry.FieldByName('img_conf').AsBoolean;

       if img[7] = true then
        begin
          PageProva.imgPergunta7.Visible := true;
          PreencheImagem7(ID, PageProva.imgPergunta7);
        end
        else
        begin
          PageProva.imgPergunta7.Visible := false;

        end;

        qryS.SQL.Clear;
        qryS.SQL.Add('SELECT * FROM TAB_PERGUNTAS_SELECT WHERE COD_PERGUNTA = :COD_PERGUNTA');
        qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
        qryS.Open;

        if qryS.IsEmpty then
        begin
          REGIS := 0;

        end;

      end;

      qryS.SQL.Clear;
      qryS.SQL.Add('INSERT INTO TAB_PERGUNTAS_SELECT(COD_PERGUNTA) values(:COD_PERGUNTA) ');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.ExecSQL;

      PageProva.lblPergunta7.Text := qry.FieldByName('PERGUNTAS').AsString;

      qryR.SQL.Clear;
      qryR.SQL.Add('SELECT * FROM RESPOSTAS WHERE ID_PERGUNTA = :ID');
      qryR.ParamByName('ID').AsInteger := ID;
      qryR.Open;


      resp[7] := qryR.FieldByName('RES_CERTA').AsString;
      PageProva.lblRespA7.Text := qryR.FieldByName('RES_A').AsString;
      PageProva.lblRespB7.Text := qryR.FieldByName('RES_B').AsString;
      PageProva.lblRespC7.Text := qryR.FieldByName('RES_C').AsString;
      PageProva.lblRespD7.Text := qryR.FieldByName('RES_D').AsString;


      qryS.SQL.Clear;
      qryS.SQL.Add('UPDATE TAB_PERGUNTAS_SELECT SET COD_RESPOSTA = :COD_RESPOSTA WHERE COD_PERGUNTA = :ID ');
      qryS.ParamByName('COD_RESPOSTA').AsString := resp[7];
      qryS.ParamByName('ID').AsInteger := ID;
      qryS.ExecSQL;

     //---- PERGUNTA 7  ----//

                    //---- PERGUNTA 8  ----//

         //VERIFICA SE PERGUNTA J� ESTA ADICIONADA



      REGIS := 1;
      while REGIS = 1 do
      begin
        qry.SQL.Clear;
        qry.SQL.Add('SELECT * FROM TAB_ERRADAS ORDER BY RANDOM() LIMIT 1');
        qry.Open;

        ID := qry.FieldByName('ID_ERRADAS').AsInteger;

        PageProva.questao[8] := ID;

        img[8] := qry.FieldByName('img_conf').AsBoolean;

       if img[8] = true then
        begin
          PageProva.imgPergunta8.Visible := true;
          PreencheImagem8(ID, PageProva.imgPergunta8);
        end
        else
        begin
          PageProva.imgPergunta8.Visible := false;

        end;

        qryS.SQL.Clear;
        qryS.SQL.Add('SELECT * FROM TAB_PERGUNTAS_SELECT WHERE COD_PERGUNTA = :COD_PERGUNTA');
        qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
        qryS.Open;

        if qryS.IsEmpty then
        begin
          REGIS := 0;

        end;

      end;

      qryS.SQL.Clear;
      qryS.SQL.Add('INSERT INTO TAB_PERGUNTAS_SELECT(COD_PERGUNTA) values(:COD_PERGUNTA) ');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.ExecSQL;

      PageProva.lblPergunta8.Text := qry.FieldByName('PERGUNTAS').AsString;

      qryR.SQL.Clear;
      qryR.SQL.Add('SELECT * FROM RESPOSTAS WHERE ID_PERGUNTA = :ID');
      qryR.ParamByName('ID').AsInteger := ID;
      qryR.Open;


      resp[8] := qryR.FieldByName('RES_CERTA').AsString;
      PageProva.lblRespA8.Text := qryR.FieldByName('RES_A').AsString;
      PageProva.lblRespB8.Text := qryR.FieldByName('RES_B').AsString;
      PageProva.lblRespC8.Text := qryR.FieldByName('RES_C').AsString;
      PageProva.lblRespD8.Text := qryR.FieldByName('RES_D').AsString;


      qryS.SQL.Clear;
      qryS.SQL.Add('UPDATE TAB_PERGUNTAS_SELECT SET COD_RESPOSTA = :COD_RESPOSTA WHERE COD_PERGUNTA = :ID ');
      qryS.ParamByName('COD_RESPOSTA').AsString := resp[8];
      qryS.ParamByName('ID').AsInteger := ID;
      qryS.ExecSQL;

     //---- PERGUNTA 8  ----//



                    //---- PERGUNTA 9  ----//

         //VERIFICA SE PERGUNTA J� ESTA ADICIONADA



      REGIS := 1;
      while REGIS = 1 do
      begin
        qry.SQL.Clear;
        qry.SQL.Add('SELECT * FROM TAB_ERRADAS ORDER BY RANDOM() LIMIT 1');
        qry.Open;

        ID := qry.FieldByName('ID_ERRADAS').AsInteger;

        PageProva.questao[9] := ID;

        img[9] := qry.FieldByName('img_conf').AsBoolean;

       if img[9] = true then
        begin
          PageProva.imgPergunta9.Visible := true;
          PreencheImagem9(ID, PageProva.imgPergunta9);
        end
        else
        begin
          PageProva.imgPergunta9.Visible := false;

        end;

        qryS.SQL.Clear;
        qryS.SQL.Add('SELECT * FROM TAB_PERGUNTAS_SELECT WHERE COD_PERGUNTA = :COD_PERGUNTA');
        qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
        qryS.Open;

        if qryS.IsEmpty then
        begin
          REGIS := 0;

        end;

      end;

      qryS.SQL.Clear;
      qryS.SQL.Add('INSERT INTO TAB_PERGUNTAS_SELECT(COD_PERGUNTA) values(:COD_PERGUNTA) ');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.ExecSQL;

      PageProva.lblPergunta9.Text := qry.FieldByName('PERGUNTAS').AsString;

      qryR.SQL.Clear;
      qryR.SQL.Add('SELECT * FROM RESPOSTAS WHERE ID_PERGUNTA = :ID');
      qryR.ParamByName('ID').AsInteger := ID;
      qryR.Open;


      resp[9] := qryR.FieldByName('RES_CERTA').AsString;
      PageProva.lblRespA9.Text := qryR.FieldByName('RES_A').AsString;
      PageProva.lblRespB9.Text := qryR.FieldByName('RES_B').AsString;
      PageProva.lblRespC9.Text := qryR.FieldByName('RES_C').AsString;
      PageProva.lblRespD9.Text := qryR.FieldByName('RES_D').AsString;


      qryS.SQL.Clear;
      qryS.SQL.Add('UPDATE TAB_PERGUNTAS_SELECT SET COD_RESPOSTA = :COD_RESPOSTA WHERE COD_PERGUNTA = :ID ');
      qryS.ParamByName('COD_RESPOSTA').AsString := resp[9];
      qryS.ParamByName('ID').AsInteger := ID;
      qryS.ExecSQL;

     //---- PERGUNTA 9  ----//



                    //---- PERGUNTA 10  ----//

         //VERIFICA SE PERGUNTA J� ESTA ADICIONADA



      REGIS := 1;
      while REGIS = 1 do
      begin
        qry.SQL.Clear;
        qry.SQL.Add('SELECT * FROM TAB_ERRADAS ORDER BY RANDOM() LIMIT 1');
        qry.Open;

        ID := qry.FieldByName('ID_ERRADAS').AsInteger;

        PageProva.questao[10] := ID;

        img[10] := qry.FieldByName('img_conf').AsBoolean;

       if img[10] = true then
        begin
          PageProva.imgPergunta10.Visible := true;
          PreencheImagem10(ID, PageProva.imgPergunta10);
        end
        else
        begin
          PageProva.imgPergunta10.Visible := false;

        end;

        qryS.SQL.Clear;
        qryS.SQL.Add('SELECT * FROM TAB_PERGUNTAS_SELECT WHERE COD_PERGUNTA = :COD_PERGUNTA');
        qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
        qryS.Open;

        if qryS.IsEmpty then
        begin
          REGIS := 0;

        end;

      end;

      qryS.SQL.Clear;
      qryS.SQL.Add('INSERT INTO TAB_PERGUNTAS_SELECT(COD_PERGUNTA) values(:COD_PERGUNTA) ');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.ExecSQL;

      PageProva.lblPergunta10.Text := qry.FieldByName('PERGUNTAS').AsString;

      qryR.SQL.Clear;
      qryR.SQL.Add('SELECT * FROM RESPOSTAS WHERE ID_PERGUNTA = :ID');
      qryR.ParamByName('ID').AsInteger := ID;
      qryR.Open;


      resp[10] := qryR.FieldByName('RES_CERTA').AsString;
      PageProva.lblRespA10.Text := qryR.FieldByName('RES_A').AsString;
      PageProva.lblRespB10.Text := qryR.FieldByName('RES_B').AsString;
      PageProva.lblRespC10.Text := qryR.FieldByName('RES_C').AsString;
      PageProva.lblRespD10.Text := qryR.FieldByName('RES_D').AsString;


      qryS.SQL.Clear;
      qryS.SQL.Add('UPDATE TAB_PERGUNTAS_SELECT SET COD_RESPOSTA = :COD_RESPOSTA WHERE COD_PERGUNTA = :ID ');
      qryS.ParamByName('COD_RESPOSTA').AsString := resp[10];
      qryS.ParamByName('ID').AsInteger := ID;
      qryS.ExecSQL;

     //---- PERGUNTA 10  ----//

             //---- PERGUNTA 11  ----//

         //VERIFICA SE PERGUNTA J� ESTA ADICIONADA



      REGIS := 1;
      while REGIS = 1 do
      begin
        qry.SQL.Clear;
        qry.SQL.Add('SELECT * FROM TAB_ERRADAS ORDER BY RANDOM() LIMIT 1');
        qry.Open;

        ID := qry.FieldByName('ID_ERRADAS').AsInteger;

        PageProva.questao[11] := ID;

        img[11] := qry.FieldByName('img_conf').AsBoolean;

       if img[11] = true then
        begin
          PageProva.imgPergunta11.Visible := true;
          PreencheImagem11(ID, PageProva.imgPergunta11);
        end
        else
        begin
          PageProva.imgPergunta11.Visible := false;

        end;

        qryS.SQL.Clear;
        qryS.SQL.Add('SELECT * FROM TAB_PERGUNTAS_SELECT WHERE COD_PERGUNTA = :COD_PERGUNTA');
        qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
        qryS.Open;

        if qryS.IsEmpty then
        begin
          REGIS := 0;

        end;

      end;

      qryS.SQL.Clear;
      qryS.SQL.Add('INSERT INTO TAB_PERGUNTAS_SELECT(COD_PERGUNTA) values(:COD_PERGUNTA) ');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.ExecSQL;

      PageProva.lblPergunta11.Text := qry.FieldByName('PERGUNTAS').AsString;

      qryR.SQL.Clear;
      qryR.SQL.Add('SELECT * FROM RESPOSTAS WHERE ID_PERGUNTA = :ID');
      qryR.ParamByName('ID').AsInteger := ID;
      qryR.Open;


      resp[11] := qryR.FieldByName('RES_CERTA').AsString;
      PageProva.lblRespA11.Text := qryR.FieldByName('RES_A').AsString;
      PageProva.lblRespB11.Text := qryR.FieldByName('RES_B').AsString;
      PageProva.lblRespC11.Text := qryR.FieldByName('RES_C').AsString;
      PageProva.lblRespD11.Text := qryR.FieldByName('RES_D').AsString;


      qryS.SQL.Clear;
      qryS.SQL.Add('UPDATE TAB_PERGUNTAS_SELECT SET COD_RESPOSTA = :COD_RESPOSTA WHERE COD_PERGUNTA = :ID ');
      qryS.ParamByName('COD_RESPOSTA').AsString := resp[11];
      qryS.ParamByName('ID').AsInteger := ID;
      qryS.ExecSQL;

     //---- PERGUNTA 11  ----//


                 //---- PERGUNTA 12  ----//

         //VERIFICA SE PERGUNTA J� ESTA ADICIONADA



      REGIS := 1;
      while REGIS = 1 do
      begin
        qry.SQL.Clear;
        qry.SQL.Add('SELECT * FROM TAB_ERRADAS ORDER BY RANDOM() LIMIT 1');
        qry.Open;

        ID := qry.FieldByName('ID_ERRADAS').AsInteger;

        PageProva.questao[12] := ID;

        img[12] := qry.FieldByName('img_conf').AsBoolean;

       if img[12] = true then
        begin
          PageProva.imgPergunta12.Visible := true;
          PreencheImagem12(ID, PageProva.imgPergunta12);
        end
        else
        begin
          PageProva.imgPergunta12.Visible := false;

        end;

        qryS.SQL.Clear;
        qryS.SQL.Add('SELECT * FROM TAB_PERGUNTAS_SELECT WHERE COD_PERGUNTA = :COD_PERGUNTA');
        qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
        qryS.Open;

        if qryS.IsEmpty then
        begin
          REGIS := 0;

        end;

      end;

      qryS.SQL.Clear;
      qryS.SQL.Add('INSERT INTO TAB_PERGUNTAS_SELECT(COD_PERGUNTA) values(:COD_PERGUNTA) ');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.ExecSQL;

      PageProva.lblPergunta12.Text := qry.FieldByName('PERGUNTAS').AsString;

      qryR.SQL.Clear;
      qryR.SQL.Add('SELECT * FROM RESPOSTAS WHERE ID_PERGUNTA = :ID');
      qryR.ParamByName('ID').AsInteger := ID;
      qryR.Open;


      resp[12] := qryR.FieldByName('RES_CERTA').AsString;
      PageProva.lblRespA12.Text := qryR.FieldByName('RES_A').AsString;
      PageProva.lblRespB12.Text := qryR.FieldByName('RES_B').AsString;
      PageProva.lblRespC12.Text := qryR.FieldByName('RES_C').AsString;
      PageProva.lblRespD12.Text := qryR.FieldByName('RES_D').AsString;


      qryS.SQL.Clear;
      qryS.SQL.Add('UPDATE TAB_PERGUNTAS_SELECT SET COD_RESPOSTA = :COD_RESPOSTA WHERE COD_PERGUNTA = :ID ');
      qryS.ParamByName('COD_RESPOSTA').AsString := resp[12];
      qryS.ParamByName('ID').AsInteger := ID;
      qryS.ExecSQL;

     //---- PERGUNTA 12  ----//


                 //---- PERGUNTA 13  ----//

         //VERIFICA SE PERGUNTA J� ESTA ADICIONADA



      REGIS := 1;
      while REGIS = 1 do
      begin
        qry.SQL.Clear;
        qry.SQL.Add('SELECT * FROM TAB_ERRADAS ORDER BY RANDOM() LIMIT 1');
        qry.Open;

        ID := qry.FieldByName('ID_ERRADAS').AsInteger;

        PageProva.questao[13] := ID;

        img[13] := qry.FieldByName('img_conf').AsBoolean;

       if img[13] = true then
        begin
          PageProva.imgPergunta13.Visible := true;
          PreencheImagem13(ID, PageProva.imgPergunta13);
        end
        else
        begin
          PageProva.imgPergunta13.Visible := false;

        end;

        qryS.SQL.Clear;
        qryS.SQL.Add('SELECT * FROM TAB_PERGUNTAS_SELECT WHERE COD_PERGUNTA = :COD_PERGUNTA');
        qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
        qryS.Open;

        if qryS.IsEmpty then
        begin
          REGIS := 0;

        end;

      end;

      qryS.SQL.Clear;
      qryS.SQL.Add('INSERT INTO TAB_PERGUNTAS_SELECT(COD_PERGUNTA) values(:COD_PERGUNTA) ');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.ExecSQL;

      PageProva.lblPergunta13.Text := qry.FieldByName('PERGUNTAS').AsString;

      qryR.SQL.Clear;
      qryR.SQL.Add('SELECT * FROM RESPOSTAS WHERE ID_PERGUNTA = :ID');
      qryR.ParamByName('ID').AsInteger := ID;
      qryR.Open;


      resp[13] := qryR.FieldByName('RES_CERTA').AsString;
      PageProva.lblRespA13.Text := qryR.FieldByName('RES_A').AsString;
      PageProva.lblRespB13.Text := qryR.FieldByName('RES_B').AsString;
      PageProva.lblRespC13.Text := qryR.FieldByName('RES_C').AsString;
      PageProva.lblRespD13.Text := qryR.FieldByName('RES_D').AsString;


      qryS.SQL.Clear;
      qryS.SQL.Add('UPDATE TAB_PERGUNTAS_SELECT SET COD_RESPOSTA = :COD_RESPOSTA WHERE COD_PERGUNTA = :ID ');
      qryS.ParamByName('COD_RESPOSTA').AsString := resp[13];
      qryS.ParamByName('ID').AsInteger := ID;
      qryS.ExecSQL;

     //---- PERGUNTA 13  ----//

                 //---- PERGUNTA 14  ----//

         //VERIFICA SE PERGUNTA J� ESTA ADICIONADA



      REGIS := 1;
      while REGIS = 1 do
      begin
        qry.SQL.Clear;
        qry.SQL.Add('SELECT * FROM TAB_ERRADAS ORDER BY RANDOM() LIMIT 1');
        qry.Open;

        ID := qry.FieldByName('ID_ERRADAS').AsInteger;

        PageProva.questao[14] := ID;

        img[14] := qry.FieldByName('img_conf').AsBoolean;

       if img[14] = true then
        begin
          PageProva.imgPergunta14.Visible := true;
          PreencheImagem14(ID, PageProva.imgPergunta14);
        end
        else
        begin
          PageProva.imgPergunta14.Visible := false;

        end;

        qryS.SQL.Clear;
        qryS.SQL.Add('SELECT * FROM TAB_PERGUNTAS_SELECT WHERE COD_PERGUNTA = :COD_PERGUNTA');
        qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
        qryS.Open;

        if qryS.IsEmpty then
        begin
          REGIS := 0;

        end;

      end;

      qryS.SQL.Clear;
      qryS.SQL.Add('INSERT INTO TAB_PERGUNTAS_SELECT(COD_PERGUNTA) values(:COD_PERGUNTA) ');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.ExecSQL;

      PageProva.lblPergunta14.Text := qry.FieldByName('PERGUNTAS').AsString;

      qryR.SQL.Clear;
      qryR.SQL.Add('SELECT * FROM RESPOSTAS WHERE ID_PERGUNTA = :ID');
      qryR.ParamByName('ID').AsInteger := ID;
      qryR.Open;


      resp[14] := qryR.FieldByName('RES_CERTA').AsString;
      PageProva.lblRespA14.Text := qryR.FieldByName('RES_A').AsString;
      PageProva.lblRespB14.Text := qryR.FieldByName('RES_B').AsString;
      PageProva.lblRespC14.Text := qryR.FieldByName('RES_C').AsString;
      PageProva.lblRespD14.Text := qryR.FieldByName('RES_D').AsString;


      qryS.SQL.Clear;
      qryS.SQL.Add('UPDATE TAB_PERGUNTAS_SELECT SET COD_RESPOSTA = :COD_RESPOSTA WHERE COD_PERGUNTA = :ID ');
      qryS.ParamByName('COD_RESPOSTA').AsString := resp[14];
      qryS.ParamByName('ID').AsInteger := ID;
      qryS.ExecSQL;

     //---- PERGUNTA 14  ----//


                 //---- PERGUNTA 15  ----//

         //VERIFICA SE PERGUNTA J� ESTA ADICIONADA



      REGIS := 1;
      while REGIS = 1 do
      begin
        qry.SQL.Clear;
        qry.SQL.Add('SELECT * FROM TAB_ERRADAS ORDER BY RANDOM() LIMIT 1');
        qry.Open;

        ID := qry.FieldByName('ID_ERRADAS').AsInteger;

        PageProva.questao[15] := ID;

        img[15] := qry.FieldByName('img_conf').AsBoolean;

       if img[15] = true then
        begin
          PageProva.imgPergunta15.Visible := true;
          PreencheImagem15(ID, PageProva.imgPergunta15);
        end
        else
        begin
          PageProva.imgPergunta15.Visible := false;

        end;

        qryS.SQL.Clear;
        qryS.SQL.Add('SELECT * FROM TAB_PERGUNTAS_SELECT WHERE COD_PERGUNTA = :COD_PERGUNTA');
        qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
        qryS.Open;

        if qryS.IsEmpty then
        begin
          REGIS := 0;

        end;

      end;

      qryS.SQL.Clear;
      qryS.SQL.Add('INSERT INTO TAB_PERGUNTAS_SELECT(COD_PERGUNTA) values(:COD_PERGUNTA) ');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.ExecSQL;

      PageProva.lblPergunta15.Text := qry.FieldByName('PERGUNTAS').AsString;

      qryR.SQL.Clear;
      qryR.SQL.Add('SELECT * FROM RESPOSTAS WHERE ID_PERGUNTA = :ID');
      qryR.ParamByName('ID').AsInteger := ID;
      qryR.Open;


      resp[15] := qryR.FieldByName('RES_CERTA').AsString;
      PageProva.lblRespA5.Text := qryR.FieldByName('RES_A').AsString;
      PageProva.lblRespB5.Text := qryR.FieldByName('RES_B').AsString;
      PageProva.lblRespC5.Text := qryR.FieldByName('RES_C').AsString;
      PageProva.lblRespD5.Text := qryR.FieldByName('RES_D').AsString;


      qryS.SQL.Clear;
      qryS.SQL.Add('UPDATE TAB_PERGUNTAS_SELECT SET COD_RESPOSTA = :COD_RESPOSTA WHERE COD_PERGUNTA = :ID ');
      qryS.ParamByName('COD_RESPOSTA').AsString := resp[15];
      qryS.ParamByName('ID').AsInteger := ID;
      qryS.ExecSQL;

     //---- PERGUNTA 15  ----//

            //---- PERGUNTA 16  ----//

         //VERIFICA SE PERGUNTA J� ESTA ADICIONADA



      REGIS := 1;
      while REGIS = 1 do
      begin
        qry.SQL.Clear;
        qry.SQL.Add('SELECT * FROM TAB_ERRADAS ORDER BY RANDOM() LIMIT 1');
        qry.Open;

        ID := qry.FieldByName('ID_ERRADAS').AsInteger;

        PageProva.questao[16] := ID;

        img[16] := qry.FieldByName('img_conf').AsBoolean;

       if img[16] = true then
        begin
          PageProva.imgPergunta16.Visible := true;
          PreencheImagem16(ID, PageProva.imgPergunta16);
        end
        else
        begin
          PageProva.imgPergunta16.Visible := false;

        end;

        qryS.SQL.Clear;
        qryS.SQL.Add('SELECT * FROM TAB_PERGUNTAS_SELECT WHERE COD_PERGUNTA = :COD_PERGUNTA');
        qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
        qryS.Open;

        if qryS.IsEmpty then
        begin
          REGIS := 0;

        end;

      end;

      qryS.SQL.Clear;
      qryS.SQL.Add('INSERT INTO TAB_PERGUNTAS_SELECT(COD_PERGUNTA) values(:COD_PERGUNTA) ');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.ExecSQL;

      PageProva.lblPergunta16.Text := qry.FieldByName('PERGUNTAS').AsString;

      qryR.SQL.Clear;
      qryR.SQL.Add('SELECT * FROM RESPOSTAS WHERE ID_PERGUNTA = :ID');
      qryR.ParamByName('ID').AsInteger := ID;
      qryR.Open;


      resp[16] := qryR.FieldByName('RES_CERTA').AsString;
      PageProva.lblRespA16.Text := qryR.FieldByName('RES_A').AsString;
      PageProva.lblRespB16.Text := qryR.FieldByName('RES_B').AsString;
      PageProva.lblRespC16.Text := qryR.FieldByName('RES_C').AsString;
      PageProva.lblRespD16.Text := qryR.FieldByName('RES_D').AsString;


      qryS.SQL.Clear;
      qryS.SQL.Add('UPDATE TAB_PERGUNTAS_SELECT SET COD_RESPOSTA = :COD_RESPOSTA WHERE COD_PERGUNTA = :ID ');
      qryS.ParamByName('COD_RESPOSTA').AsString := resp[16];
      qryS.ParamByName('ID').AsInteger := ID;
      qryS.ExecSQL;

     //---- PERGUNTA 16  ----//

            //---- PERGUNTA 17  ----//

         //VERIFICA SE PERGUNTA J� ESTA ADICIONADA



      REGIS := 1;
      while REGIS = 1 do
      begin
        qry.SQL.Clear;
        qry.SQL.Add('SELECT * FROM TAB_ERRADAS ORDER BY RANDOM() LIMIT 1');
        qry.Open;

        ID := qry.FieldByName('ID_ERRADAS').AsInteger;

        PageProva.questao[17] := ID;

        img[17] := qry.FieldByName('img_conf').AsBoolean;

       if img[17] = true then
        begin
          PageProva.imgPergunta17.Visible := true;
          PreencheImagem17(ID, PageProva.imgPergunta17);
        end
        else
        begin
          PageProva.imgPergunta17.Visible := false;

        end;

        qryS.SQL.Clear;
        qryS.SQL.Add('SELECT * FROM TAB_PERGUNTAS_SELECT WHERE COD_PERGUNTA = :COD_PERGUNTA');
        qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
        qryS.Open;

        if qryS.IsEmpty then
        begin
          REGIS := 0;

        end;

      end;

      qryS.SQL.Clear;
      qryS.SQL.Add('INSERT INTO TAB_PERGUNTAS_SELECT(COD_PERGUNTA) values(:COD_PERGUNTA) ');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.ExecSQL;

      PageProva.lblPergunta17.Text := qry.FieldByName('PERGUNTAS').AsString;

      qryR.SQL.Clear;
      qryR.SQL.Add('SELECT * FROM RESPOSTAS WHERE ID_PERGUNTA = :ID');
      qryR.ParamByName('ID').AsInteger := ID;
      qryR.Open;


      resp[17] := qryR.FieldByName('RES_CERTA').AsString;
      PageProva.lblRespA17.Text := qryR.FieldByName('RES_A').AsString;
      PageProva.lblRespB17.Text := qryR.FieldByName('RES_B').AsString;
      PageProva.lblRespC17.Text := qryR.FieldByName('RES_C').AsString;
      PageProva.lblRespD17.Text := qryR.FieldByName('RES_D').AsString;


      qryS.SQL.Clear;
      qryS.SQL.Add('UPDATE TAB_PERGUNTAS_SELECT SET COD_RESPOSTA = :COD_RESPOSTA WHERE COD_PERGUNTA = :ID ');
      qryS.ParamByName('COD_RESPOSTA').AsString := resp[17];
      qryS.ParamByName('ID').AsInteger := ID;
      qryS.ExecSQL;

     //---- PERGUNTA 17  ----//


            //---- PERGUNTA 18  ----//

         //VERIFICA SE PERGUNTA J� ESTA ADICIONADA



      REGIS := 1;
      while REGIS = 1 do
      begin
        qry.SQL.Clear;
        qry.SQL.Add('SELECT * FROM TAB_ERRADAS ORDER BY RANDOM() LIMIT 1');
        qry.Open;

        ID := qry.FieldByName('ID_ERRADAS').AsInteger;

        PageProva.questao[18] := ID;

        img[18] := qry.FieldByName('img_conf').AsBoolean;

       if img[18] = true then
        begin
          PageProva.imgPergunta18.Visible := true;
          PreencheImagem18(ID, PageProva.imgPergunta18);
        end
        else
        begin
          PageProva.imgPergunta18.Visible := false;

        end;

        qryS.SQL.Clear;
        qryS.SQL.Add('SELECT * FROM TAB_PERGUNTAS_SELECT WHERE COD_PERGUNTA = :COD_PERGUNTA');
        qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
        qryS.Open;

        if qryS.IsEmpty then
        begin
          REGIS := 0;

        end;

      end;

      qryS.SQL.Clear;
      qryS.SQL.Add('INSERT INTO TAB_PERGUNTAS_SELECT(COD_PERGUNTA) values(:COD_PERGUNTA) ');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.ExecSQL;

      PageProva.lblPergunta18.Text := qry.FieldByName('PERGUNTAS').AsString;

      qryR.SQL.Clear;
      qryR.SQL.Add('SELECT * FROM RESPOSTAS WHERE ID_PERGUNTA = :ID');
      qryR.ParamByName('ID').AsInteger := ID;
      qryR.Open;


      resp[18] := qryR.FieldByName('RES_CERTA').AsString;
      PageProva.lblRespA18.Text := qryR.FieldByName('RES_A').AsString;
      PageProva.lblRespB18.Text := qryR.FieldByName('RES_B').AsString;
      PageProva.lblRespC18.Text := qryR.FieldByName('RES_C').AsString;
      PageProva.lblRespD18.Text := qryR.FieldByName('RES_D').AsString;


      qryS.SQL.Clear;
      qryS.SQL.Add('UPDATE TAB_PERGUNTAS_SELECT SET COD_RESPOSTA = :COD_RESPOSTA WHERE COD_PERGUNTA = :ID ');
      qryS.ParamByName('COD_RESPOSTA').AsString := resp[18];
      qryS.ParamByName('ID').AsInteger := ID;
      qryS.ExecSQL;

     //---- PERGUNTA 18  ----//

                 //---- PERGUNTA 19  ----//

         //VERIFICA SE PERGUNTA J� ESTA ADICIONADA



      REGIS := 1;
      while REGIS = 1 do
      begin
        qry.SQL.Clear;
        qry.SQL.Add('SELECT * FROM TAB_ERRADAS ORDER BY RANDOM() LIMIT 1');
        qry.Open;

        ID := qry.FieldByName('ID_ERRADAS').AsInteger;

        PageProva.questao[19] := ID;

        img[19] := qry.FieldByName('img_conf').AsBoolean;

       if img[19] = true then
        begin
          PageProva.imgPergunta19.Visible := true;
          PreencheImagem19(ID, PageProva.imgPergunta19);
        end
        else
        begin
          PageProva.imgPergunta19.Visible := false;

        end;

        qryS.SQL.Clear;
        qryS.SQL.Add('SELECT * FROM TAB_PERGUNTAS_SELECT WHERE COD_PERGUNTA = :COD_PERGUNTA');
        qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
        qryS.Open;

        if qryS.IsEmpty then
        begin
          REGIS := 0;

        end;

      end;

      qryS.SQL.Clear;
      qryS.SQL.Add('INSERT INTO TAB_PERGUNTAS_SELECT(COD_PERGUNTA) values(:COD_PERGUNTA) ');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.ExecSQL;

      PageProva.lblPergunta19.Text := qry.FieldByName('PERGUNTAS').AsString;

      qryR.SQL.Clear;
      qryR.SQL.Add('SELECT * FROM RESPOSTAS WHERE ID_PERGUNTA = :ID');
      qryR.ParamByName('ID').AsInteger := ID;
      qryR.Open;


      resp[19] := qryR.FieldByName('RES_CERTA').AsString;
      PageProva.lblRespA19.Text := qryR.FieldByName('RES_A').AsString;
      PageProva.lblRespB19.Text := qryR.FieldByName('RES_B').AsString;
      PageProva.lblRespC19.Text := qryR.FieldByName('RES_C').AsString;
      PageProva.lblRespD19.Text := qryR.FieldByName('RES_D').AsString;


      qryS.SQL.Clear;
      qryS.SQL.Add('UPDATE TAB_PERGUNTAS_SELECT SET COD_RESPOSTA = :COD_RESPOSTA WHERE COD_PERGUNTA = :ID ');
      qryS.ParamByName('COD_RESPOSTA').AsString := resp[19];
      qryS.ParamByName('ID').AsInteger := ID;
      qryS.ExecSQL;

     //---- PERGUNTA 19  ----//



                      //---- PERGUNTA 20  ----//

         //VERIFICA SE PERGUNTA J� ESTA ADICIONADA



      REGIS := 1;
      while REGIS = 1 do
      begin
        qry.SQL.Clear;
        qry.SQL.Add('SELECT * FROM TAB_ERRADAS ORDER BY RANDOM() LIMIT 1');
        qry.Open;

        ID := qry.FieldByName('ID_ERRADAS').AsInteger;

        PageProva.questao[20] := ID;

        img[20] := qry.FieldByName('img_conf').AsBoolean;

       if img[20] = true then
        begin
          PageProva.imgPergunta20.Visible := true;
          PreencheImagem20(ID, PageProva.imgPergunta20);
        end
        else
        begin
          PageProva.imgPergunta20.Visible := false;

        end;

        qryS.SQL.Clear;
        qryS.SQL.Add('SELECT * FROM TAB_PERGUNTAS_SELECT WHERE COD_PERGUNTA = :COD_PERGUNTA');
        qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
        qryS.Open;

        if qryS.IsEmpty then
        begin
          REGIS := 0;

        end;

      end;

      qryS.SQL.Clear;
      qryS.SQL.Add('INSERT INTO TAB_PERGUNTAS_SELECT(COD_PERGUNTA) values(:COD_PERGUNTA) ');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.ExecSQL;

      PageProva.lblPergunta20.Text := qry.FieldByName('PERGUNTAS').AsString;

      qryR.SQL.Clear;
      qryR.SQL.Add('SELECT * FROM RESPOSTAS WHERE ID_PERGUNTA = :ID');
      qryR.ParamByName('ID').AsInteger := ID;
      qryR.Open;


      resp[20] := qryR.FieldByName('RES_CERTA').AsString;
      PageProva.lblRespA20.Text := qryR.FieldByName('RES_A').AsString;
      PageProva.lblRespB20.Text := qryR.FieldByName('RES_B').AsString;
      PageProva.lblRespC20.Text := qryR.FieldByName('RES_C').AsString;
      PageProva.lblRespD20.Text := qryR.FieldByName('RES_D').AsString;


      qryS.SQL.Clear;
      qryS.SQL.Add('UPDATE TAB_PERGUNTAS_SELECT SET COD_RESPOSTA = :COD_RESPOSTA WHERE COD_PERGUNTA = :ID ');
      qryS.ParamByName('COD_RESPOSTA').AsString := resp[20];
      qryS.ParamByName('ID').AsInteger := ID;
      qryS.ExecSQL;

     //---- PERGUNTA 20  ----//



                           //---- PERGUNTA 21  ----//

         //VERIFICA SE PERGUNTA J� ESTA ADICIONADA



      REGIS := 1;
      while REGIS = 1 do
      begin
        qry.SQL.Clear;
        qry.SQL.Add('SELECT * FROM TAB_ERRADAS ORDER BY RANDOM() LIMIT 1');
        qry.Open;

        ID := qry.FieldByName('ID_ERRADAS').AsInteger;

        PageProva.questao[21] := ID;

        img[21] := qry.FieldByName('img_conf').AsBoolean;

       if img[21] = true then
        begin
          PageProva.imgPergunta21.Visible := true;
          PreencheImagem21(ID, PageProva.imgPergunta21);
        end
        else
        begin
          PageProva.imgPergunta21.Visible := false;

        end;

        qryS.SQL.Clear;
        qryS.SQL.Add('SELECT * FROM TAB_PERGUNTAS_SELECT WHERE COD_PERGUNTA = :COD_PERGUNTA');
        qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
        qryS.Open;

        if qryS.IsEmpty then
        begin
          REGIS := 0;

        end;

      end;

      qryS.SQL.Clear;
      qryS.SQL.Add('INSERT INTO TAB_PERGUNTAS_SELECT(COD_PERGUNTA) values(:COD_PERGUNTA) ');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.ExecSQL;

      PageProva.lblPergunta21.Text := qry.FieldByName('PERGUNTAS').AsString;

      qryR.SQL.Clear;
      qryR.SQL.Add('SELECT * FROM RESPOSTAS WHERE ID_PERGUNTA = :ID');
      qryR.ParamByName('ID').AsInteger := ID;
      qryR.Open;


      resp[21] := qryR.FieldByName('RES_CERTA').AsString;
      PageProva.lblRespA21.Text := qryR.FieldByName('RES_A').AsString;
      PageProva.lblRespB21.Text := qryR.FieldByName('RES_B').AsString;
      PageProva.lblRespC21.Text := qryR.FieldByName('RES_C').AsString;
      PageProva.lblRespD21.Text := qryR.FieldByName('RES_D').AsString;


      qryS.SQL.Clear;
      qryS.SQL.Add('UPDATE TAB_PERGUNTAS_SELECT SET COD_RESPOSTA = :COD_RESPOSTA WHERE COD_PERGUNTA = :ID ');
      qryS.ParamByName('COD_RESPOSTA').AsString := resp[21];
      qryS.ParamByName('ID').AsInteger := ID;
      qryS.ExecSQL;

     //---- PERGUNTA 21  ----//

                    //---- PERGUNTA 22  ----//

         //VERIFICA SE PERGUNTA J� ESTA ADICIONADA



      REGIS := 1;
      while REGIS = 1 do
      begin
        qry.SQL.Clear;
        qry.SQL.Add('SELECT * FROM TAB_ERRADAS ORDER BY RANDOM() LIMIT 1');
        qry.Open;

        ID := qry.FieldByName('ID_ERRADAS').AsInteger;

        PageProva.questao[22] := ID;

        img[22] := qry.FieldByName('img_conf').AsBoolean;

       if img[22] = true then
        begin
          PageProva.imgPergunta22.Visible := true;
          PreencheImagem22(ID, PageProva.imgPergunta22);
        end
        else
        begin
          PageProva.imgPergunta22.Visible := false;

        end;

        qryS.SQL.Clear;
        qryS.SQL.Add('SELECT * FROM TAB_PERGUNTAS_SELECT WHERE COD_PERGUNTA = :COD_PERGUNTA');
        qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
        qryS.Open;

        if qryS.IsEmpty then
        begin
          REGIS := 0;

        end;

      end;

      qryS.SQL.Clear;
      qryS.SQL.Add('INSERT INTO TAB_PERGUNTAS_SELECT(COD_PERGUNTA) values(:COD_PERGUNTA) ');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.ExecSQL;

      PageProva.lblPergunta22.Text := qry.FieldByName('PERGUNTAS').AsString;

      qryR.SQL.Clear;
      qryR.SQL.Add('SELECT * FROM RESPOSTAS WHERE ID_PERGUNTA = :ID');
      qryR.ParamByName('ID').AsInteger := ID;
      qryR.Open;


      resp[22] := qryR.FieldByName('RES_CERTA').AsString;
      PageProva.lblRespA22.Text := qryR.FieldByName('RES_A').AsString;
      PageProva.lblRespB22.Text := qryR.FieldByName('RES_B').AsString;
      PageProva.lblRespC22.Text := qryR.FieldByName('RES_C').AsString;
      PageProva.lblRespD22.Text := qryR.FieldByName('RES_D').AsString;


      qryS.SQL.Clear;
      qryS.SQL.Add('UPDATE TAB_PERGUNTAS_SELECT SET COD_RESPOSTA = :COD_RESPOSTA WHERE COD_PERGUNTA = :ID ');
      qryS.ParamByName('COD_RESPOSTA').AsString := resp[22];
      qryS.ParamByName('ID').AsInteger := ID;
      qryS.ExecSQL;

     //---- PERGUNTA 22  ----//



                         //---- PERGUNTA 23  ----//

         //VERIFICA SE PERGUNTA J� ESTA ADICIONADA



      REGIS := 1;
      while REGIS = 1 do
      begin
        qry.SQL.Clear;
        qry.SQL.Add('SELECT * FROM TAB_ERRADAS ORDER BY RANDOM() LIMIT 1');
        qry.Open;

        ID := qry.FieldByName('ID_ERRADAS').AsInteger;

        PageProva.questao[23] := ID;

        img[23] := qry.FieldByName('img_conf').AsBoolean;

       if img[23] = true then
        begin
          PageProva.imgPergunta23.Visible := true;
          PreencheImagem23(ID, PageProva.imgPergunta23);
        end
        else
        begin
          PageProva.imgPergunta23.Visible := false;

        end;

        qryS.SQL.Clear;
        qryS.SQL.Add('SELECT * FROM TAB_PERGUNTAS_SELECT WHERE COD_PERGUNTA = :COD_PERGUNTA');
        qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
        qryS.Open;

        if qryS.IsEmpty then
        begin
          REGIS := 0;

        end;

      end;

      qryS.SQL.Clear;
      qryS.SQL.Add('INSERT INTO TAB_PERGUNTAS_SELECT(COD_PERGUNTA) values(:COD_PERGUNTA) ');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.ExecSQL;

      PageProva.lblPergunta23.Text := qry.FieldByName('PERGUNTAS').AsString;

      qryR.SQL.Clear;
      qryR.SQL.Add('SELECT * FROM RESPOSTAS WHERE ID_PERGUNTA = :ID');
      qryR.ParamByName('ID').AsInteger := ID;
      qryR.Open;


      resp[23] := qryR.FieldByName('RES_CERTA').AsString;
      PageProva.lblRespA23.Text := qryR.FieldByName('RES_A').AsString;
      PageProva.lblRespB23.Text := qryR.FieldByName('RES_B').AsString;
      PageProva.lblRespC23.Text := qryR.FieldByName('RES_C').AsString;
      PageProva.lblRespD23.Text := qryR.FieldByName('RES_D').AsString;


      qryS.SQL.Clear;
      qryS.SQL.Add('UPDATE TAB_PERGUNTAS_SELECT SET COD_RESPOSTA = :COD_RESPOSTA WHERE COD_PERGUNTA = :ID ');
      qryS.ParamByName('COD_RESPOSTA').AsString := resp[23];
      qryS.ParamByName('ID').AsInteger := ID;
      qryS.ExecSQL;

     //---- PERGUNTA 23  ----//




                             //---- PERGUNTA 24  ----//

         //VERIFICA SE PERGUNTA J� ESTA ADICIONADA



      REGIS := 1;
      while REGIS = 1 do
      begin
        qry.SQL.Clear;
        qry.SQL.Add('SELECT * FROM TAB_ERRADAS ORDER BY RANDOM() LIMIT 1');
        qry.Open;

        ID := qry.FieldByName('ID_ERRADAS').AsInteger;

        PageProva.questao[24] := ID;

        img[24] := qry.FieldByName('img_conf').AsBoolean;

       if img[24] = true then
        begin
          PageProva.imgPergunta24.Visible := true;
          PreencheImagem24(ID, PageProva.imgPergunta24);
        end
        else
        begin
          PageProva.imgPergunta24.Visible := false;

        end;

        qryS.SQL.Clear;
        qryS.SQL.Add('SELECT * FROM TAB_PERGUNTAS_SELECT WHERE COD_PERGUNTA = :COD_PERGUNTA');
        qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
        qryS.Open;

        if qryS.IsEmpty then
        begin
          REGIS := 0;

        end;

      end;

      qryS.SQL.Clear;
      qryS.SQL.Add('INSERT INTO TAB_PERGUNTAS_SELECT(COD_PERGUNTA) values(:COD_PERGUNTA) ');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.ExecSQL;

      PageProva.lblPergunta24.Text := qry.FieldByName('PERGUNTAS').AsString;

      qryR.SQL.Clear;
      qryR.SQL.Add('SELECT * FROM RESPOSTAS WHERE ID_PERGUNTA = :ID');
      qryR.ParamByName('ID').AsInteger := ID;
      qryR.Open;


      resp[24] := qryR.FieldByName('RES_CERTA').AsString;
      PageProva.lblRespA24.Text := qryR.FieldByName('RES_A').AsString;
      PageProva.lblRespB24.Text := qryR.FieldByName('RES_B').AsString;
      PageProva.lblRespC24.Text := qryR.FieldByName('RES_C').AsString;
      PageProva.lblRespD24.Text := qryR.FieldByName('RES_D').AsString;


      qryS.SQL.Clear;
      qryS.SQL.Add('UPDATE TAB_PERGUNTAS_SELECT SET COD_RESPOSTA = :COD_RESPOSTA WHERE COD_PERGUNTA = :ID ');
      qryS.ParamByName('COD_RESPOSTA').AsString := resp[24];
      qryS.ParamByName('ID').AsInteger := ID;
      qryS.ExecSQL;

     //---- PERGUNTA 24  ----//


                       //---- PERGUNTA 25  ----//

         //VERIFICA SE PERGUNTA J� ESTA ADICIONADA



      REGIS := 1;
      while REGIS = 1 do
      begin
        qry.SQL.Clear;
        qry.SQL.Add('SELECT * FROM TAB_ERRADAS ORDER BY RANDOM() LIMIT 1');
        qry.Open;

        ID := qry.FieldByName('ID_ERRADAS').AsInteger;

        PageProva.questao[25] := ID;

        img[25] := qry.FieldByName('img_conf').AsBoolean;

       if img[25] = true then
        begin
          PageProva.imgPergunta25.Visible := true;
          PreencheImagem25(ID, PageProva.imgPergunta25);
        end
        else
        begin
          PageProva.imgPergunta25.Visible := false;

        end;

        qryS.SQL.Clear;
        qryS.SQL.Add('SELECT * FROM TAB_PERGUNTAS_SELECT WHERE COD_PERGUNTA = :COD_PERGUNTA');
        qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
        qryS.Open;

        if qryS.IsEmpty then
        begin
          REGIS := 0;

        end;

      end;

      qryS.SQL.Clear;
      qryS.SQL.Add('INSERT INTO TAB_PERGUNTAS_SELECT(COD_PERGUNTA) values(:COD_PERGUNTA) ');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.ExecSQL;

      PageProva.lblPergunta25.Text := qry.FieldByName('PERGUNTAS').AsString;

      qryR.SQL.Clear;
      qryR.SQL.Add('SELECT * FROM RESPOSTAS WHERE ID_PERGUNTA = :ID');
      qryR.ParamByName('ID').AsInteger := ID;
      qryR.Open;


      resp[25] := qryR.FieldByName('RES_CERTA').AsString;
      PageProva.lblRespA25.Text := qryR.FieldByName('RES_A').AsString;
      PageProva.lblRespB25.Text := qryR.FieldByName('RES_B').AsString;
      PageProva.lblRespC25.Text := qryR.FieldByName('RES_C').AsString;
      PageProva.lblRespD25.Text := qryR.FieldByName('RES_D').AsString;


      qryS.SQL.Clear;
      qryS.SQL.Add('UPDATE TAB_PERGUNTAS_SELECT SET COD_RESPOSTA = :COD_RESPOSTA WHERE COD_PERGUNTA = :ID ');
      qryS.ParamByName('COD_RESPOSTA').AsString := resp[25];
      qryS.ParamByName('ID').AsInteger := ID;
      qryS.ExecSQL;

     //---- PERGUNTA 25  ----//

     //---- PERGUNTA 26  ----//

         //VERIFICA SE PERGUNTA J� ESTA ADICIONADA



      REGIS := 1;
      while REGIS = 1 do
      begin
        qry.SQL.Clear;
        qry.SQL.Add('SELECT * FROM TAB_ERRADAS ORDER BY RANDOM() LIMIT 1');
        qry.Open;

        ID := qry.FieldByName('ID_ERRADAS').AsInteger;

        PageProva.questao[26] := ID;

        img[26] := qry.FieldByName('img_conf').AsBoolean;

       if img[26] = true then
        begin
          PageProva.imgPergunta26.Visible := true;
          PreencheImagem26(ID, PageProva.imgPergunta26);
        end
        else
        begin
          PageProva.imgPergunta26.Visible := false;

        end;

        qryS.SQL.Clear;
        qryS.SQL.Add('SELECT * FROM TAB_PERGUNTAS_SELECT WHERE COD_PERGUNTA = :COD_PERGUNTA');
        qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
        qryS.Open;

        if qryS.IsEmpty then
        begin
          REGIS := 0;

        end;

      end;

      qryS.SQL.Clear;
      qryS.SQL.Add('INSERT INTO TAB_PERGUNTAS_SELECT(COD_PERGUNTA) values(:COD_PERGUNTA) ');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.ExecSQL;

      PageProva.lblPergunta26.Text := qry.FieldByName('PERGUNTAS').AsString;

      qryR.SQL.Clear;
      qryR.SQL.Add('SELECT * FROM RESPOSTAS WHERE ID_PERGUNTA = :ID');
      qryR.ParamByName('ID').AsInteger := ID;
      qryR.Open;


      resp[26] := qryR.FieldByName('RES_CERTA').AsString;
      PageProva.lblRespA26.Text := qryR.FieldByName('RES_A').AsString;
      PageProva.lblRespB26.Text := qryR.FieldByName('RES_B').AsString;
      PageProva.lblRespC26.Text := qryR.FieldByName('RES_C').AsString;
      PageProva.lblRespD26.Text := qryR.FieldByName('RES_D').AsString;


      qryS.SQL.Clear;
      qryS.SQL.Add('UPDATE TAB_PERGUNTAS_SELECT SET COD_RESPOSTA = :COD_RESPOSTA WHERE COD_PERGUNTA = :ID ');
      qryS.ParamByName('COD_RESPOSTA').AsString := resp[26];
      qryS.ParamByName('ID').AsInteger := ID;
      qryS.ExecSQL;

     //---- PERGUNTA 26  ----//


          //---- PERGUNTA 27  ----//

         //VERIFICA SE PERGUNTA J� ESTA ADICIONADA



      REGIS := 1;
      while REGIS = 1 do
      begin
        qry.SQL.Clear;
        qry.SQL.Add('SELECT * FROM TAB_ERRADAS ORDER BY RANDOM() LIMIT 1');
        qry.Open;

        ID := qry.FieldByName('ID_ERRADAS').AsInteger;

        PageProva.questao[27] := ID;

        img[27] := qry.FieldByName('img_conf').AsBoolean;

       if img[27] = true then
        begin
          PageProva.imgPergunta27.Visible := true;
          PreencheImagem27(ID, PageProva.imgPergunta27);
        end
        else
        begin
          PageProva.imgPergunta27.Visible := false;

        end;

        qryS.SQL.Clear;
        qryS.SQL.Add('SELECT * FROM TAB_PERGUNTAS_SELECT WHERE COD_PERGUNTA = :COD_PERGUNTA');
        qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
        qryS.Open;

        if qryS.IsEmpty then
        begin
          REGIS := 0;

        end;

      end;

      qryS.SQL.Clear;
      qryS.SQL.Add('INSERT INTO TAB_PERGUNTAS_SELECT(COD_PERGUNTA) values(:COD_PERGUNTA) ');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.ExecSQL;

      PageProva.lblPergunta27.Text := qry.FieldByName('PERGUNTAS').AsString;

      qryR.SQL.Clear;
      qryR.SQL.Add('SELECT * FROM RESPOSTAS WHERE ID_PERGUNTA = :ID');
      qryR.ParamByName('ID').AsInteger := ID;
      qryR.Open;


      resp[27] := qryR.FieldByName('RES_CERTA').AsString;
      PageProva.lblRespA27.Text := qryR.FieldByName('RES_A').AsString;
      PageProva.lblRespB27.Text := qryR.FieldByName('RES_B').AsString;
      PageProva.lblRespC27.Text := qryR.FieldByName('RES_C').AsString;
      PageProva.lblRespD27.Text := qryR.FieldByName('RES_D').AsString;


      qryS.SQL.Clear;
      qryS.SQL.Add('UPDATE TAB_PERGUNTAS_SELECT SET COD_RESPOSTA = :COD_RESPOSTA WHERE COD_PERGUNTA = :ID ');
      qryS.ParamByName('COD_RESPOSTA').AsString := resp[27];
      qryS.ParamByName('ID').AsInteger := ID;
      qryS.ExecSQL;

     //---- PERGUNTA 27  ----//


               //---- PERGUNTA 28  ----//

         //VERIFICA SE PERGUNTA J� ESTA ADICIONADA



      REGIS := 1;
      while REGIS = 1 do
      begin
        qry.SQL.Clear;
        qry.SQL.Add('SELECT * FROM TAB_ERRADAS ORDER BY RANDOM() LIMIT 1');
        qry.Open;

        ID := qry.FieldByName('ID_ERRADAS').AsInteger;

        PageProva.questao[28] := ID;

        img[28] := qry.FieldByName('img_conf').AsBoolean;

       if img[28] = true then
        begin
          PageProva.imgPergunta28.Visible := true;
          PreencheImagem28(ID, PageProva.imgPergunta28);
        end
        else
        begin
          PageProva.imgPergunta28.Visible := false;

        end;

        qryS.SQL.Clear;
        qryS.SQL.Add('SELECT * FROM TAB_PERGUNTAS_SELECT WHERE COD_PERGUNTA = :COD_PERGUNTA');
        qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
        qryS.Open;

        if qryS.IsEmpty then
        begin
          REGIS := 0;

        end;

      end;

      qryS.SQL.Clear;
      qryS.SQL.Add('INSERT INTO TAB_PERGUNTAS_SELECT(COD_PERGUNTA) values(:COD_PERGUNTA) ');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.ExecSQL;

      PageProva.lblPergunta28.Text := qry.FieldByName('PERGUNTAS').AsString;

      qryR.SQL.Clear;
      qryR.SQL.Add('SELECT * FROM RESPOSTAS WHERE ID_PERGUNTA = :ID');
      qryR.ParamByName('ID').AsInteger := ID;
      qryR.Open;


      resp[28] := qryR.FieldByName('RES_CERTA').AsString;
      PageProva.lblRespA28.Text := qryR.FieldByName('RES_A').AsString;
      PageProva.lblRespB28.Text := qryR.FieldByName('RES_B').AsString;
      PageProva.lblRespC28.Text := qryR.FieldByName('RES_C').AsString;
      PageProva.lblRespD28.Text := qryR.FieldByName('RES_D').AsString;


      qryS.SQL.Clear;
      qryS.SQL.Add('UPDATE TAB_PERGUNTAS_SELECT SET COD_RESPOSTA = :COD_RESPOSTA WHERE COD_PERGUNTA = :ID ');
      qryS.ParamByName('COD_RESPOSTA').AsString := resp[28];
      qryS.ParamByName('ID').AsInteger := ID;
      qryS.ExecSQL;

     //---- PERGUNTA 28  ----//


                //---- PERGUNTA 29  ----//

         //VERIFICA SE PERGUNTA J� ESTA ADICIONADA



      REGIS := 1;
      while REGIS = 1 do
      begin
        qry.SQL.Clear;
        qry.SQL.Add('SELECT * FROM TAB_ERRADAS ORDER BY RANDOM() LIMIT 1');
        qry.Open;

        ID := qry.FieldByName('ID_ERRADAS').AsInteger;

        PageProva.questao[29] := ID;

        img[29] := qry.FieldByName('img_conf').AsBoolean;

       if img[29] = true then
        begin
          PageProva.imgPergunta29.Visible := true;
          PreencheImagem29(ID, PageProva.imgPergunta29);
        end
        else
        begin
          PageProva.imgPergunta29.Visible := false;

        end;

        qryS.SQL.Clear;
        qryS.SQL.Add('SELECT * FROM TAB_PERGUNTAS_SELECT WHERE COD_PERGUNTA = :COD_PERGUNTA');
        qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
        qryS.Open;

        if qryS.IsEmpty then
        begin
          REGIS := 0;

        end;

      end;

      qryS.SQL.Clear;
      qryS.SQL.Add('INSERT INTO TAB_PERGUNTAS_SELECT(COD_PERGUNTA) values(:COD_PERGUNTA) ');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.ExecSQL;

      PageProva.lblPergunta29.Text := qry.FieldByName('PERGUNTAS').AsString;

      qryR.SQL.Clear;
      qryR.SQL.Add('SELECT * FROM RESPOSTAS WHERE ID_PERGUNTA = :ID');
      qryR.ParamByName('ID').AsInteger := ID;
      qryR.Open;


      resp[29] := qryR.FieldByName('RES_CERTA').AsString;
      PageProva.lblRespA29.Text := qryR.FieldByName('RES_A').AsString;
      PageProva.lblRespB29.Text := qryR.FieldByName('RES_B').AsString;
      PageProva.lblRespC29.Text := qryR.FieldByName('RES_C').AsString;
      PageProva.lblRespD29.Text := qryR.FieldByName('RES_D').AsString;


      qryS.SQL.Clear;
      qryS.SQL.Add('UPDATE TAB_PERGUNTAS_SELECT SET COD_RESPOSTA = :COD_RESPOSTA WHERE COD_PERGUNTA = :ID ');
      qryS.ParamByName('COD_RESPOSTA').AsString := resp[29];
      qryS.ParamByName('ID').AsInteger := ID;
      qryS.ExecSQL;

     //---- PERGUNTA 29  ----//



                  //---- PERGUNTA 30  ----//

         //VERIFICA SE PERGUNTA J� ESTA ADICIONADA



      REGIS := 1;
      while REGIS = 1 do
      begin
        qry.SQL.Clear;
        qry.SQL.Add('SELECT * FROM TAB_ERRADAS ORDER BY RANDOM() LIMIT 1');
        qry.Open;

        ID := qry.FieldByName('ID_ERRADAS').AsInteger;

        PageProva.questao[30] := ID;

        img[30] := qry.FieldByName('img_conf').AsBoolean;

       if img[29] = true then
        begin
          PageProva.imgPergunta30.Visible := true;
          PreencheImagem30(ID, PageProva.imgPergunta30);
        end
        else
        begin
          PageProva.imgPergunta30.Visible := false;

        end;

        qryS.SQL.Clear;
        qryS.SQL.Add('SELECT * FROM TAB_PERGUNTAS_SELECT WHERE COD_PERGUNTA = :COD_PERGUNTA');
        qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
        qryS.Open;

        if qryS.IsEmpty then
        begin
          REGIS := 0;

        end;

      end;

      qryS.SQL.Clear;
      qryS.SQL.Add('INSERT INTO TAB_PERGUNTAS_SELECT(COD_PERGUNTA) values(:COD_PERGUNTA) ');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.ExecSQL;

      PageProva.lblPergunta30.Text := qry.FieldByName('PERGUNTAS').AsString;

      qryR.SQL.Clear;
      qryR.SQL.Add('SELECT * FROM RESPOSTAS WHERE ID_PERGUNTA = :ID');
      qryR.ParamByName('ID').AsInteger := ID;
      qryR.Open;


      resp[30] := qryR.FieldByName('RES_CERTA').AsString;
      PageProva.lblRespA30.Text := qryR.FieldByName('RES_A').AsString;
      PageProva.lblRespB30.Text := qryR.FieldByName('RES_B').AsString;
      PageProva.lblRespC30.Text := qryR.FieldByName('RES_C').AsString;
      PageProva.lblRespD30.Text := qryR.FieldByName('RES_D').AsString;


      qryS.SQL.Clear;
      qryS.SQL.Add('UPDATE TAB_PERGUNTAS_SELECT SET COD_RESPOSTA = :COD_RESPOSTA WHERE COD_PERGUNTA = :ID ');
      qryS.ParamByName('COD_RESPOSTA').AsString := resp[30];
      qryS.ParamByName('ID').AsInteger := ID;
      qryS.ExecSQL;

     //---- PERGUNTA 30  ----//

    end
    else
    begin

     chamaPergunta;
    end;





  except on E:Exception do
                raise Exception.Create('Erro: ' + E.Message);

  end;




end;

procedure TDataModule1.Corrigir;
var
 p: array[1..30] of Integer;
 r, pergunta: array[1..30] of String;
 x,y : integer;
 QRY, qryErradas : TFDQuery;
 aprovado : double;
 quantidade : Integer;

begin

  try

    qry := TFDQuery.Create(nil);
    qry.Connection := conn;
    qryErradas := TFDQuery.Create(nil);
    qryErradas.Connection := conn;

    y := 0;
    for X := 1 to 30 do
    begin

         y := y + 1;


          p[x] := PageProva.questao[y];
          r[x] := PageProva.resposta[y];

          qry.SQL.Clear;
          qry.SQL.Add('SELECT * FROM RESPOSTAS WHERE ID_PERGUNTA = :ID_PERGUNTA AND RES_CERTA = :RES_CERTA ');
          qry.ParamByName('ID_PERGUNTA').AsInteger := p[x];
          qry.ParamByName('RES_CERTA').AsString := r[x];
          qry.Open;

          if qry.IsEmpty then
          begin
            pergunta[x] := 'Pergunta:' + x.ToString +   ' Errada';
            erros := erros + 1 ;


             try
              // SALVA AS QUEST�ES ERRADAS


              //VERIFICA SE J� TEM CADASTRADA
              qryErradas.SQL.Clear;
              qryErradas.SQL.Add('SELECT * FROM TAB_ERRADAS WHERE ID_ERRADAS = :ID_ERRADAS');
              qryErradas.ParamByName('ID_ERRADAS').AsInteger := p[x];
              qryErradas.Open;

              if qryErradas.IsEmpty then
              begin

                qryErradas.SQL.Clear;
                qryErradas.SQL.Add('INSERT INTO TAB_ERRADAS(ID_ERRADAS, PERGUNTAS, IMG_CONF,IMG)') ;
                qryErradas.SQL.Add('SELECT * FROM TAB_PERGUNTAS P WHERE ID = :ID');
                qryErradas.ParamByName('ID').AsInteger := p[x];
                qryErradas.ExecSQL;


                // ADICIONA QUANTIDADE DE ERROS
                qryErradas.SQL.Clear;
                qryErradas.SQL.Add('UPDATE TAB_ERRADAS SET QTD = :QTD WHERE ID_ERRADAS = :ID') ;
                qryErradas.ParamByName('ID').AsInteger := p[x];
                qryErradas.ParamByName('QTD').AsInteger := 1;
                qryErradas.ExecSQL;

              end
              else
              begin

                quantidade := qryErradas.FieldByName('QTD').AsInteger + 1;

                qryErradas.SQL.Clear;
                qryErradas.SQL.Add('UPDATE TAB_ERRADAS SET QTD = :QTD WHERE ID_ERRADAS = :ID') ;
                qryErradas.ParamByName('ID').AsInteger := p[x];
                qryErradas.ParamByName('QTD').AsInteger := quantidade;
                qryErradas.ExecSQL;

              end;








            except on E:Exception do
                raise Exception.Create('Erro: ' + E.Message);


            end;


          end
          else
          begin
            pergunta[x] := 'Pergunta:' + x.ToString +   ' Correta';
            acertos := acertos + 1 ;

            qryErradas.SQL.Clear;
            qryErradas.SQL.Add('SELECT * FROM TAB_ERRADAS WHERE ID_ERRADAS = :ID');
            qryErradas.ParamByName('ID').AsInteger := P[X];
            qryErradas.Open;

            if qryErradas.FieldByName('QTD').AsInteger > 1 then
            begin

              quantidade := qryErradas.FieldByName('QTD').AsInteger - 1;

              qryErradas.SQL.Clear;
              qryErradas.SQL.Add('UPDATE TAB_ERRADAS SET QTD = :QTD WHERE ID_ERRADAS = :ID') ;
              qryErradas.ParamByName('ID').AsInteger := p[x];
              qryErradas.ParamByName('QTD').AsInteger := quantidade;
              qryErradas.ExecSQL;

            end
            else
            begin

              qryErradas.SQL.Clear;
              qryErradas.SQL.Add('DELETE FROM TAB_ERRADAS WHERE ID_ERRADAS = :ID') ;
              qryErradas.ParamByName('ID').AsInteger := p[x];
              qryErradas.ExecSQL;


            end;


          end;

    end;

    aprovado := 30 - erros;

    if aprovado > 20 then
    begin
      PageProva.lblAprovado.Text := 'Parab�ns voc� foi aprovado';

    end
    else
    begin
      PageProva.lblAprovado.Text := 'Voc� foi Reprovado';

    end;

    PageProva.lblAcertos.Text := 'Voc� obteve: ' + acertos.ToString + ' Acertos';
    PageProva.lblErros.Text := 'Voc� obteve: ' + erros.ToString + ' Erros';
    acertos := 0;
    erros := 0;

  finally
    QRY.DisposeOf;
    qryErradas.DisposeOf;

  end;

  LimpaSelecionadas;


end;

procedure TDataModule1.CorrigirComErradas;
var
 p: array[1..30] of Integer;
 r, pergunta: array[1..30] of String;
 x,y : integer;
 QRY, qryErradas : TFDQuery;
 aprovado : double;
 quantidade : Integer;

begin

  try

    qry := TFDQuery.Create(nil);
    qry.Connection := conn;
    qryErradas := TFDQuery.Create(nil);
    qryErradas.Connection := conn;

    y := 0;
    for X := 1 to 30 do
    begin

         y := y + 1;


          p[x] := PageProva.questao[y];
          r[x] := PageProva.resposta[y];

          qry.SQL.Clear;
          qry.SQL.Add('SELECT * FROM RESPOSTAS WHERE ID_PERGUNTA = :ID_PERGUNTA AND RES_CERTA = :RES_CERTA ');
          qry.ParamByName('ID_PERGUNTA').AsInteger := p[x];
          qry.ParamByName('RES_CERTA').AsString := r[x];
          qry.Open;

          if qry.IsEmpty then
          begin
            pergunta[x] := 'Pergunta:' + x.ToString +   ' Errada';
            erros := erros + 1 ;


             try
              // SALVA AS QUEST�ES ERRADAS
              qryErradas := TFDQuery.Create(nil);
              qryErradas.Connection := conn;

              //VERIFICA SE J� TEM CADASTRADA
              qryErradas.SQL.Clear;
              qryErradas.SQL.Add('SELECT * FROM TAB_ERRADAS WHERE ID_ERRADAS = :ID_ERRADAS');
              qryErradas.ParamByName('ID_ERRADAS').AsInteger := p[x];
              qryErradas.Open;

              if qryErradas.IsEmpty then
              begin

                qryErradas.SQL.Clear;
                qryErradas.SQL.Add('INSERT INTO TAB_ERRADAS(ID_ERRADAS, PERGUNTAS, IMG_CONF,IMG)') ;
                qryErradas.SQL.Add('SELECT * FROM TAB_PERGUNTAS P WHERE ID = :ID');
                qryErradas.ParamByName('ID').AsInteger := p[x];
                qryErradas.ExecSQL;


                // ADICIONA QUANTIDADE DE ERROS
                qryErradas.SQL.Clear;
                qryErradas.SQL.Add('UPDATE TAB_ERRADAS SET QTD = :QTD WHERE ID_ERRADAS = :ID') ;
                qryErradas.ParamByName('ID').AsInteger := p[x];
                qryErradas.ParamByName('QTD').AsInteger := 1;
                qryErradas.ExecSQL;

              end
              else
              begin

                quantidade := qryErradas.FieldByName('QTD').AsInteger + 1;

                qryErradas.SQL.Clear;
                qryErradas.SQL.Add('UPDATE TAB_ERRADAS SET QTD = :QTD WHERE ID_ERRADAS = :ID') ;
                qryErradas.ParamByName('ID').AsInteger := p[x];
                qryErradas.ParamByName('QTD').AsInteger := quantidade;
                qryErradas.ExecSQL;

              end;


            finally
               qryErradas.DisposeOf;

            end;


          end
          else
          begin
            pergunta[x] := 'Pergunta:' + x.ToString +   ' Correta';
            acertos := acertos + 1 ;

            qryErradas.SQL.Clear;
            qryErradas.SQL.Add('SELECT * FROM TAB_ERRADAS WHERE ID_ERRADAS = :ID');
            qryErradas.ParamByName('ID').AsInteger := P[X];
            qryErradas.Open;

            if qryErradas.FieldByName('QTD').AsInteger > 1 then
            begin

              quantidade := qryErradas.FieldByName('QTD').AsInteger - 1;

              qryErradas.SQL.Clear;
              qryErradas.SQL.Add('UPDATE FROM TAB_ERRADAS SET QTD = :QTD WHERE ID_ERRADAS = :ID') ;
              qryErradas.ParamByName('ID').AsInteger := p[x];
              qryErradas.ParamByName('QTD').AsInteger := quantidade;
              qryErradas.ExecSQL;

            end
            else
            begin

              qryErradas.SQL.Clear;
              qryErradas.SQL.Add('DELETE FROM TAB_ERRADAS WHERE ID_ERRADAS = :ID') ;
              qryErradas.ParamByName('ID').AsInteger := p[x];
              qryErradas.ExecSQL;


            end;


          end;

    end;

    aprovado := 30 - erros;

    if aprovado > 20 then
    begin
      PageProva.lblAprovado.Text := 'Parab�ns voc� foi aprovado';

    end
    else
    begin
      PageProva.lblAprovado.Text := 'Voc� foi Reprovado';

    end;

    PageProva.lblAcertos.Text := 'Voc� obteve: ' + acertos.ToString + ' Acertos';
    PageProva.lblErros.Text := 'Voc� obteve: ' + erros.ToString + ' Erros';
    acertos := 0;
    erros := 0;

  finally
    QRY.DisposeOf;

  end;


  LimpaSelecionadas;

end;

procedure TDataModule1.CheckFalse;
begin



  // check 1


  PageProva.checkA.Visible := false;
  PageProva.checkB.Visible := false;
  PageProva.checkC.Visible := false;
  PageProva.checkD.Visible := false;
  PageProva.resposta[1] := '';
  PageProva.questao[1] := 0;
  acertos := 0;
  erros := 0;



    // check 2
  PageProva.checkA2.Visible := false;
  PageProva.checkB2.Visible := false;
  PageProva.checkC2.Visible := false;
  PageProva.checkD2.Visible := false;
  PageProva.resposta[2] := '';
  PageProva.questao[2] := 0;

      // check 3
  PageProva.checkA3.Visible := false;
  PageProva.checkB3.Visible := false;
  PageProva.checkC3.Visible := false;
  PageProva.checkD3.Visible := false;
  PageProva.resposta[3] := '';
  PageProva.questao[3] := 0;

      // check 4
  PageProva.checkA4.Visible := false;
  PageProva.checkB4.Visible := false;
  PageProva.checkC4.Visible := false;
  PageProva.checkD4.Visible := false;
  PageProva.resposta[4] := '';
  PageProva.questao[4] := 0;

        // check 5
  PageProva.checkA5.Visible := false;
  PageProva.checkB5.Visible := false;
  PageProva.checkC5.Visible := false;
  PageProva.checkD5.Visible := false;
  PageProva.resposta[5] := '';
  PageProva.questao[5] := 0;

     // check 6
  PageProva.checkA7.Visible := false;
  PageProva.checkB7.Visible := false;
  PageProva.checkC7.Visible := false;
  PageProva.checkD7.Visible := false;
  PageProva.resposta[6] := '';
  PageProva.questao[6] := 0;

         // check 7
  PageProva.checkA7.Visible := false;
  PageProva.checkB7.Visible := false;
  PageProva.checkC7.Visible := false;
  PageProva.checkD7.Visible := false;
  PageProva.resposta[7] := '';

       // check 8
  PageProva.checkA8.Visible := false;
  PageProva.checkB8.Visible := false;
  PageProva.checkC8.Visible := false;
  PageProva.checkD8.Visible := false;
  PageProva.resposta[8]:= '';
  PageProva.questao[8] := 0;

       // check 9
  PageProva.checkA9.Visible := false;
  PageProva.checkB9.Visible := false;
  PageProva.checkC9.Visible := false;
  PageProva.checkD9.Visible := false;
  PageProva.resposta[9] := '';
  PageProva.questao[9] := 0;

         // check 10
  PageProva.checkA10.Visible := false;
  PageProva.checkB10.Visible := false;
  PageProva.checkC10.Visible := false;
  PageProva.checkD10.Visible := false;
  PageProva.resposta[10] := '';
  PageProva.questao[10] := 0;

           // check 11
  PageProva.checkA11.Visible := false;
  PageProva.checkB11.Visible := false;
  PageProva.checkC11.Visible := false;
  PageProva.checkD11.Visible := false;
  PageProva.resposta[11] := '';
  PageProva.questao[11] := 0;

           // check 12
  PageProva.checkA12.Visible := false;
  PageProva.checkB12.Visible := false;
  PageProva.checkC12.Visible := false;
  PageProva.checkD12.Visible := false;
  PageProva.resposta[12] := '';
  PageProva.questao[12] := 0;

             // check 13
  PageProva.checkA13.Visible := false;
  PageProva.checkB13.Visible := false;
  PageProva.checkC13.Visible := false;
  PageProva.checkD13.Visible := false;
  PageProva.resposta[13] := '';
  PageProva.questao[13] := 0;

             // check 14
  PageProva.checkA14.Visible := false;
  PageProva.checkB14.Visible := false;
  PageProva.checkC14.Visible := false;
  PageProva.checkD14.Visible := false;
  PageProva.resposta[14] := '';
  PageProva.questao[14] := 0;

             // check 15
  PageProva.checkA15.Visible := false;
  PageProva.checkB15.Visible := false;
  PageProva.checkC15.Visible := false;
  PageProva.checkD15.Visible := false;
  PageProva.resposta[15] := '';
  PageProva.questao[15] := 0;

             // check 16
  PageProva.checkA16.Visible := false;
  PageProva.checkB16.Visible := false;
  PageProva.checkC16.Visible := false;
  PageProva.checkD16.Visible := false;
  PageProva.resposta[16] := '';
  PageProva.questao[16] := 0;

             // check 17
  PageProva.checkA17.Visible := false;
  PageProva.checkB17.Visible := false;
  PageProva.checkC17.Visible := false;
  PageProva.checkD17.Visible := false;
  PageProva.resposta[17] := '';
  PageProva.questao[17] := 0;

             // check 18
  PageProva.checkA18.Visible := false;
  PageProva.checkB18.Visible := false;
  PageProva.checkC18.Visible := false;
  PageProva.checkD18.Visible := false;
  PageProva.resposta[18] := '';
  PageProva.questao[18] := 0;

             // check 19
  PageProva.checkA19.Visible := false;
  PageProva.checkB19.Visible := false;
  PageProva.checkC19.Visible := false;
  PageProva.checkD19.Visible := false;
  PageProva.resposta[19] := '';
  PageProva.questao[19] := 0;

             // check 20
  PageProva.checkA20.Visible := false;
  PageProva.checkB20.Visible := false;
  PageProva.checkC20.Visible := false;
  PageProva.checkD20.Visible := false;
  PageProva.resposta[20] := '';
  PageProva.questao[20] := 0;

               // check 21
  PageProva.checkA21.Visible := false;
  PageProva.checkB21.Visible := false;
  PageProva.checkC21.Visible := false;
  PageProva.checkD21.Visible := false;
  PageProva.resposta[21] := '';
  PageProva.questao[21] := 0;

                 // check 22
  PageProva.checkA22.Visible := false;
  PageProva.checkB22.Visible := false;
  PageProva.checkC22.Visible := false;
  PageProva.checkD22.Visible := false;
  PageProva.resposta[22] := '';
  PageProva.questao[22] := 0;

                 // check 23
  PageProva.checkA23.Visible := false;
  PageProva.checkB23.Visible := false;
  PageProva.checkC23.Visible := false;
  PageProva.checkD23.Visible := false;
  PageProva.resposta[23] := '';
  PageProva.questao[23] := 0;

                 // check 24
  PageProva.checkA24.Visible := false;
  PageProva.checkB24.Visible := false;
  PageProva.checkC24.Visible := false;
  PageProva.checkD24.Visible := false;
  PageProva.resposta[24] := '';
  PageProva.questao[24] := 0;

                 // check 25
  PageProva.checkA25.Visible := false;
  PageProva.checkB25.Visible := false;
  PageProva.checkC25.Visible := false;
  PageProva.checkD25.Visible := false;
  PageProva.resposta[25] := '';
  PageProva.questao[25] := 0;

                 // check 26
  PageProva.checkA26.Visible := false;
  PageProva.checkB26.Visible := false;
  PageProva.checkC26.Visible := false;
  PageProva.checkD26.Visible := false;
  PageProva.resposta[26] := '';
  PageProva.questao[26] := 0;

                 // check 27
  PageProva.checkA27.Visible := false;
  PageProva.checkB27.Visible := false;
  PageProva.checkC27.Visible := false;
  PageProva.checkD27.Visible := false;
  PageProva.resposta[27] := '';
  PageProva.questao[27] := 0;

                 // check 28
  PageProva.checkA28.Visible := false;
  PageProva.checkB28.Visible := false;
  PageProva.checkC28.Visible := false;
  PageProva.checkD28.Visible := false;
  PageProva.resposta[28] := '';
  PageProva.questao[28] := 0;

                 // check 29
  PageProva.checkA29.Visible := false;
  PageProva.checkB29.Visible := false;
  PageProva.checkC29.Visible := false;
  PageProva.checkD29.Visible := false;
  PageProva.resposta[29] := '';
  PageProva.questao[29] := 0;

                 // check 30
  PageProva.checkA30.Visible := false;
  PageProva.checkB30.Visible := false;
  PageProva.checkC30.Visible := false;
  PageProva.checkD30.Visible := false;
  PageProva.resposta[30] := '';
  PageProva.questao[30] := 0;



end;

procedure TDataModule1.DataModuleCreate(Sender: TObject);
begin
  with conn do
  begin
       Params.Values['DriveID'] := 'SQLite';

      {$IFDEF MSWINDOWS}
      Params.Values['Database'] := System.SysUtils.GetCurrentDir + '\db\db_hab.db';
      {$ELSE}
      Params.Values['Database'] :=  TPath.Combine(TPath.GetDocumentsPath, 'db_hab.db');
      {$ENDIF}

      try
      Connected := true;

      except on E:Exception do
                raise Exception.Create('Erro de conex�o com o banco: ' + E.Message);
      end;
  end;
end;

procedure TDataModule1.LimpaSelecionadas;
var
  qry : TFDQuery;
begin

  try
    qry := TFDQuery.Create(nil);
    qry.Connection := conn;

    qry.SQL.Clear;
    qry.SQL.Add('DELETE FROM TAB_PERGUNTAS_SELECT');
    qry.ExecSQL;


  finally
    qry.DisposeOf;
  end;

end;

//** PREENCHE IMAGEM 1 ** \\

procedure TDataModule1.PreencheImagem1(id : Integer; ret : TRectangle);
var
  qry : TFDQuery;
  img : String;
  Rect: TRectangle;
begin

  try
    qry := TFDQuery.Create(nil);
    qry.Connection := conn;

    qry.SQL.Clear;
    qry.SQL.Add('SELECT * FROM TAB_PERGUNTAS WHERE ID = :ID');
    qry.ParamByName('ID').AsInteger := id;
    qry.Open;

    img := qry.FieldByName('img').AsString;

    Rect := PageImg.PegaImagem(img);

    PageProva.imgPergunta1.Fill.Bitmap.Bitmap := Rect.Fill.Bitmap.Bitmap;

  finally
    qry.DisposeOf;
  end;


end;

//** PREENCHE IMAGEM 1 ** \\

//** PREENCHE IMAGEM 2 ** \\

procedure TDataModule1.PreencheImagem2(id: Integer; ret: TRectangle);
var
  qry : TFDQuery;
  img : String;
  Rect: TRectangle;
begin

  try
    qry := TFDQuery.Create(nil);
    qry.Connection := conn;

    qry.SQL.Clear;
    qry.SQL.Add('SELECT * FROM TAB_PERGUNTAS WHERE ID = :ID');
    qry.ParamByName('ID').AsInteger := id;
    qry.Open;

    img := qry.FieldByName('img').AsString;

    Rect := PageImg.PegaImagem(img);

    PageProva.imgPergunta2.Fill.Bitmap.Bitmap := Rect.Fill.Bitmap.Bitmap;

  finally
    qry.DisposeOf;
  end;

end;

//** PREENCHE IMAGEM 2 ** \\

//** PREENCHE IMAGEM 3 ** \\
procedure TDataModule1.PreencheImagem3(id: Integer; ret: TRectangle);
var
  qry : TFDQuery;
  img : String;
  Rect: TRectangle;
begin

  try
    qry := TFDQuery.Create(nil);
    qry.Connection := conn;

    qry.SQL.Clear;
    qry.SQL.Add('SELECT * FROM TAB_PERGUNTAS WHERE ID = :ID');
    qry.ParamByName('ID').AsInteger := id;
    qry.Open;

    img := qry.FieldByName('img').AsString;

    Rect := PageImg.PegaImagem(img);

    PageProva.imgPergunta3.Fill.Bitmap.Bitmap := Rect.Fill.Bitmap.Bitmap;

  finally
    qry.DisposeOf;
  end;

end;

//** PREENCHE IMAGEM 3 ** \\


//** PREENCHE IMAGEM 4 ** \\
procedure TDataModule1.PreencheImagem4(id: Integer; ret: TRectangle);
var
  qry : TFDQuery;
  img : String;
  Rect: TRectangle;
begin

  try
    qry := TFDQuery.Create(nil);
    qry.Connection := conn;

    qry.SQL.Clear;
    qry.SQL.Add('SELECT * FROM TAB_PERGUNTAS WHERE ID = :ID');
    qry.ParamByName('ID').AsInteger := id;
    qry.Open;

    img := qry.FieldByName('img').AsString;

    Rect := PageImg.PegaImagem(img);

    PageProva.imgPergunta4.Fill.Bitmap.Bitmap := Rect.Fill.Bitmap.Bitmap;

  finally
    qry.DisposeOf;
  end;

end;

//** PREENCHE IMAGEM 4 ** \\

//** PREENCHE IMAGEM 5 ** \\
procedure TDataModule1.PreencheImagem5(id: Integer; ret: TRectangle);
var
  qry : TFDQuery;
  img : String;
  Rect: TRectangle;
begin

  try
    qry := TFDQuery.Create(nil);
    qry.Connection := conn;

    qry.SQL.Clear;
    qry.SQL.Add('SELECT * FROM TAB_PERGUNTAS WHERE ID = :ID');
    qry.ParamByName('ID').AsInteger := id;
    qry.Open;

    img := qry.FieldByName('img').AsString;

    Rect := PageImg.PegaImagem(img);

    PageProva.imgPergunta5.Fill.Bitmap.Bitmap := Rect.Fill.Bitmap.Bitmap;

  finally
    qry.DisposeOf;
  end;

end;

//** PREENCHE IMAGEM 5 ** \\

//** PREENCHE IMAGEM 6 ** \\
procedure TDataModule1.PreencheImagem6(id: Integer; ret: TRectangle);
var
  qry : TFDQuery;
  img : String;
  Rect: TRectangle;
begin

  try
    qry := TFDQuery.Create(nil);
    qry.Connection := conn;

    qry.SQL.Clear;
    qry.SQL.Add('SELECT * FROM TAB_PERGUNTAS WHERE ID = :ID');
    qry.ParamByName('ID').AsInteger := id;
    qry.Open;

    img := qry.FieldByName('img').AsString;

    Rect := PageImg.PegaImagem(img);

    PageProva.imgPergunta6.Fill.Bitmap.Bitmap := Rect.Fill.Bitmap.Bitmap;

  finally
    qry.DisposeOf;
  end;

end;

//** PREENCHE IMAGEM 6 ** \\

//** PREENCHE IMAGEM 7 ** \\
procedure TDataModule1.PreencheImagem7(id: Integer; ret: TRectangle);
var
  qry : TFDQuery;
  img : String;
  Rect: TRectangle;
begin

  try
    qry := TFDQuery.Create(nil);
    qry.Connection := conn;

    qry.SQL.Clear;
    qry.SQL.Add('SELECT * FROM TAB_PERGUNTAS WHERE ID = :ID');
    qry.ParamByName('ID').AsInteger := id;
    qry.Open;

    img := qry.FieldByName('img').AsString;

    Rect := PageImg.PegaImagem(img);

    PageProva.imgPergunta7.Fill.Bitmap.Bitmap := Rect.Fill.Bitmap.Bitmap;

  finally
    qry.DisposeOf;
  end;

end;

//** PREENCHE IMAGEM 7 ** \\

//** PREENCHE IMAGEM 8 ** \\
procedure TDataModule1.PreencheImagem8(id: Integer; ret: TRectangle);
var
  qry : TFDQuery;
  img : String;
  Rect: TRectangle;
begin

  try
    qry := TFDQuery.Create(nil);
    qry.Connection := conn;

    qry.SQL.Clear;
    qry.SQL.Add('SELECT * FROM TAB_PERGUNTAS WHERE ID = :ID');
    qry.ParamByName('ID').AsInteger := id;
    qry.Open;

    img := qry.FieldByName('img').AsString;

    Rect := PageImg.PegaImagem(img);

    PageProva.imgPergunta8.Fill.Bitmap.Bitmap := Rect.Fill.Bitmap.Bitmap;

  finally
    qry.DisposeOf;
  end;

end;

//** PREENCHE IMAGEM 8 ** \\

//** PREENCHE IMAGEM 9 ** \\
procedure TDataModule1.PreencheImagem9(id: Integer; ret: TRectangle);
var
  qry : TFDQuery;
  img : String;
  Rect: TRectangle;
begin

  try
    qry := TFDQuery.Create(nil);
    qry.Connection := conn;

    qry.SQL.Clear;
    qry.SQL.Add('SELECT * FROM TAB_PERGUNTAS WHERE ID = :ID');
    qry.ParamByName('ID').AsInteger := id;
    qry.Open;

    img := qry.FieldByName('img').AsString;

    Rect := PageImg.PegaImagem(img);

    PageProva.imgPergunta9.Fill.Bitmap.Bitmap := Rect.Fill.Bitmap.Bitmap;

  finally
    qry.DisposeOf;
  end;

end;

//** PREENCHE IMAGEM 9 ** \\

//** PREENCHE IMAGEM 10 ** \\
procedure TDataModule1.PreencheImagem10(id: Integer; ret: TRectangle);
var
  qry : TFDQuery;
  img : String;
  Rect: TRectangle;
begin

  try
    qry := TFDQuery.Create(nil);
    qry.Connection := conn;

    qry.SQL.Clear;
    qry.SQL.Add('SELECT * FROM TAB_PERGUNTAS WHERE ID = :ID');
    qry.ParamByName('ID').AsInteger := id;
    qry.Open;

    img := qry.FieldByName('img').AsString;

    Rect := PageImg.PegaImagem(img);

    PageProva.imgPergunta10.Fill.Bitmap.Bitmap := Rect.Fill.Bitmap.Bitmap;

  finally
    qry.DisposeOf;
  end;

end;

//** PREENCHE IMAGEM 10 ** \\

//** PREENCHE IMAGEM 11 ** \\
procedure TDataModule1.PreencheImagem11(id: Integer; ret: TRectangle);
var
  qry : TFDQuery;
  img : String;
  Rect: TRectangle;
begin

  try
    qry := TFDQuery.Create(nil);
    qry.Connection := conn;

    qry.SQL.Clear;
    qry.SQL.Add('SELECT * FROM TAB_PERGUNTAS WHERE ID = :ID');
    qry.ParamByName('ID').AsInteger := id;
    qry.Open;

    img := qry.FieldByName('img').AsString;

    Rect := PageImg.PegaImagem(img);

    PageProva.imgPergunta11.Fill.Bitmap.Bitmap := Rect.Fill.Bitmap.Bitmap;

  finally
    qry.DisposeOf;
  end;

end;

//** PREENCHE IMAGEM 11 ** \\


//** PREENCHE IMAGEM 12 ** \\
procedure TDataModule1.PreencheImagem12(id: Integer; ret: TRectangle);
var
  qry : TFDQuery;
  img : String;
  Rect: TRectangle;
begin

  try
    qry := TFDQuery.Create(nil);
    qry.Connection := conn;

    qry.SQL.Clear;
    qry.SQL.Add('SELECT * FROM TAB_PERGUNTAS WHERE ID = :ID');
    qry.ParamByName('ID').AsInteger := id;
    qry.Open;

    img := qry.FieldByName('img').AsString;

    Rect := PageImg.PegaImagem(img);

    PageProva.imgPergunta12.Fill.Bitmap.Bitmap := Rect.Fill.Bitmap.Bitmap;

  finally
    qry.DisposeOf;
  end;

end;

//** PREENCHE IMAGEM 12 ** \\

//** PREENCHE IMAGEM 13 ** \\
procedure TDataModule1.PreencheImagem13(id: Integer; ret: TRectangle);
var
  qry : TFDQuery;
  img : String;
  Rect: TRectangle;
begin

  try
    qry := TFDQuery.Create(nil);
    qry.Connection := conn;

    qry.SQL.Clear;
    qry.SQL.Add('SELECT * FROM TAB_PERGUNTAS WHERE ID = :ID');
    qry.ParamByName('ID').AsInteger := id;
    qry.Open;

    img := qry.FieldByName('img').AsString;

    Rect := PageImg.PegaImagem(img);

    PageProva.imgPergunta13.Fill.Bitmap.Bitmap := Rect.Fill.Bitmap.Bitmap;

  finally
    qry.DisposeOf;
  end;

end;

//** PREENCHE IMAGEM 13 ** \\

//** PREENCHE IMAGEM 14 ** \\
procedure TDataModule1.PreencheImagem14(id: Integer; ret: TRectangle);
var
  qry : TFDQuery;
  img : String;
  Rect: TRectangle;
begin

  try
    qry := TFDQuery.Create(nil);
    qry.Connection := conn;

    qry.SQL.Clear;
    qry.SQL.Add('SELECT * FROM TAB_PERGUNTAS WHERE ID = :ID');
    qry.ParamByName('ID').AsInteger := id;
    qry.Open;

    img := qry.FieldByName('img').AsString;

    Rect := PageImg.PegaImagem(img);

    PageProva.imgPergunta14.Fill.Bitmap.Bitmap := Rect.Fill.Bitmap.Bitmap;

  finally
    qry.DisposeOf;
  end;

end;

//** PREENCHE IMAGEM 14 ** \\

//** PREENCHE IMAGEM 15 ** \\
procedure TDataModule1.PreencheImagem15(id: Integer; ret: TRectangle);
var
  qry : TFDQuery;
  img : String;
  Rect: TRectangle;
begin

  try
    qry := TFDQuery.Create(nil);
    qry.Connection := conn;

    qry.SQL.Clear;
    qry.SQL.Add('SELECT * FROM TAB_PERGUNTAS WHERE ID = :ID');
    qry.ParamByName('ID').AsInteger := id;
    qry.Open;

    img := qry.FieldByName('img').AsString;

    Rect := PageImg.PegaImagem(img);

    PageProva.imgPergunta15.Fill.Bitmap.Bitmap := Rect.Fill.Bitmap.Bitmap;

  finally
    qry.DisposeOf;
  end;

end;

//** PREENCHE IMAGEM 15 ** \\

//** PREENCHE IMAGEM 16 ** \\
procedure TDataModule1.PreencheImagem16(id: Integer; ret: TRectangle);
var
  qry : TFDQuery;
  img : String;
  Rect: TRectangle;
begin

  try
    qry := TFDQuery.Create(nil);
    qry.Connection := conn;

    qry.SQL.Clear;
    qry.SQL.Add('SELECT * FROM TAB_PERGUNTAS WHERE ID = :ID');
    qry.ParamByName('ID').AsInteger := id;
    qry.Open;

    img := qry.FieldByName('img').AsString;

    Rect := PageImg.PegaImagem(img);

    PageProva.imgPergunta16.Fill.Bitmap.Bitmap := Rect.Fill.Bitmap.Bitmap;

  finally
    qry.DisposeOf;
  end;

end;

//** PREENCHE IMAGEM 16 ** \\

//** PREENCHE IMAGEM 17 ** \\
procedure TDataModule1.PreencheImagem17(id: Integer; ret: TRectangle);
var
  qry : TFDQuery;
  img : String;
  Rect: TRectangle;
begin

  try
    qry := TFDQuery.Create(nil);
    qry.Connection := conn;

    qry.SQL.Clear;
    qry.SQL.Add('SELECT * FROM TAB_PERGUNTAS WHERE ID = :ID');
    qry.ParamByName('ID').AsInteger := id;
    qry.Open;

    img := qry.FieldByName('img').AsString;

    Rect := PageImg.PegaImagem(img);

    PageProva.imgPergunta17.Fill.Bitmap.Bitmap := Rect.Fill.Bitmap.Bitmap;

  finally
    qry.DisposeOf;
  end;

end;

//** PREENCHE IMAGEM 17 ** \\

//** PREENCHE IMAGEM 18 ** \\
procedure TDataModule1.PreencheImagem18(id: Integer; ret: TRectangle);
var
  qry : TFDQuery;
  img : String;
  Rect: TRectangle;
begin

  try
    qry := TFDQuery.Create(nil);
    qry.Connection := conn;

    qry.SQL.Clear;
    qry.SQL.Add('SELECT * FROM TAB_PERGUNTAS WHERE ID = :ID');
    qry.ParamByName('ID').AsInteger := id;
    qry.Open;

    img := qry.FieldByName('img').AsString;

    Rect := PageImg.PegaImagem(img);

    PageProva.imgPergunta18.Fill.Bitmap.Bitmap := Rect.Fill.Bitmap.Bitmap;

  finally
    qry.DisposeOf;
  end;

end;

//** PREENCHE IMAGEM 18 ** \\

//** PREENCHE IMAGEM 19 ** \\
procedure TDataModule1.PreencheImagem19(id: Integer; ret: TRectangle);
var
  qry : TFDQuery;
  img : String;
  Rect: TRectangle;
begin

  try
    qry := TFDQuery.Create(nil);
    qry.Connection := conn;

    qry.SQL.Clear;
    qry.SQL.Add('SELECT * FROM TAB_PERGUNTAS WHERE ID = :ID');
    qry.ParamByName('ID').AsInteger := id;
    qry.Open;

    img := qry.FieldByName('img').AsString;

    Rect := PageImg.PegaImagem(img);

    PageProva.imgPergunta19.Fill.Bitmap.Bitmap := Rect.Fill.Bitmap.Bitmap;

  finally
    qry.DisposeOf;
  end;

end;

//** PREENCHE IMAGEM 19 ** \\

//** PREENCHE IMAGEM 20 ** \\
procedure TDataModule1.PreencheImagem20(id: Integer; ret: TRectangle);
var
  qry : TFDQuery;
  img : String;
  Rect: TRectangle;
begin

  try
    qry := TFDQuery.Create(nil);
    qry.Connection := conn;

    qry.SQL.Clear;
    qry.SQL.Add('SELECT * FROM TAB_PERGUNTAS WHERE ID = :ID');
    qry.ParamByName('ID').AsInteger := id;
    qry.Open;

    img := qry.FieldByName('img').AsString;

    Rect := PageImg.PegaImagem(img);

    PageProva.imgPergunta20.Fill.Bitmap.Bitmap := Rect.Fill.Bitmap.Bitmap;

  finally
    qry.DisposeOf;
  end;

end;

//** PREENCHE IMAGEM 20 ** \\

//** PREENCHE IMAGEM 21 ** \\
procedure TDataModule1.PreencheImagem21(id: Integer; ret: TRectangle);
var
  qry : TFDQuery;
  img : String;
  Rect: TRectangle;
begin

  try
    qry := TFDQuery.Create(nil);
    qry.Connection := conn;

    qry.SQL.Clear;
    qry.SQL.Add('SELECT * FROM TAB_PERGUNTAS WHERE ID = :ID');
    qry.ParamByName('ID').AsInteger := id;
    qry.Open;

    img := qry.FieldByName('img').AsString;

    Rect := PageImg.PegaImagem(img);

    PageProva.imgPergunta21.Fill.Bitmap.Bitmap := Rect.Fill.Bitmap.Bitmap;

  finally
    qry.DisposeOf;
  end;

end;

//** PREENCHE IMAGEM 21 ** \\

//** PREENCHE IMAGEM 22 ** \\
procedure TDataModule1.PreencheImagem22(id: Integer; ret: TRectangle);
var
  qry : TFDQuery;
  img : String;
  Rect: TRectangle;
begin

  try
    qry := TFDQuery.Create(nil);
    qry.Connection := conn;

    qry.SQL.Clear;
    qry.SQL.Add('SELECT * FROM TAB_PERGUNTAS WHERE ID = :ID');
    qry.ParamByName('ID').AsInteger := id;
    qry.Open;

    img := qry.FieldByName('img').AsString;

    Rect := PageImg.PegaImagem(img);

    PageProva.imgPergunta22.Fill.Bitmap.Bitmap := Rect.Fill.Bitmap.Bitmap;

  finally
    qry.DisposeOf;
  end;

end;

//** PREENCHE IMAGEM 22 ** \\

//** PREENCHE IMAGEM 23 ** \\
procedure TDataModule1.PreencheImagem23(id: Integer; ret: TRectangle);
var
  qry : TFDQuery;
  img : String;
  Rect: TRectangle;
begin

  try
    qry := TFDQuery.Create(nil);
    qry.Connection := conn;

    qry.SQL.Clear;
    qry.SQL.Add('SELECT * FROM TAB_PERGUNTAS WHERE ID = :ID');
    qry.ParamByName('ID').AsInteger := id;
    qry.Open;

    img := qry.FieldByName('img').AsString;

    Rect := PageImg.PegaImagem(img);

    PageProva.imgPergunta23.Fill.Bitmap.Bitmap := Rect.Fill.Bitmap.Bitmap;

  finally
    qry.DisposeOf;
  end;

end;

//** PREENCHE IMAGEM 23 ** \\

//** PREENCHE IMAGEM 24 ** \\
procedure TDataModule1.PreencheImagem24(id: Integer; ret: TRectangle);
var
  qry : TFDQuery;
  img : String;
  Rect: TRectangle;
begin

  try
    qry := TFDQuery.Create(nil);
    qry.Connection := conn;

    qry.SQL.Clear;
    qry.SQL.Add('SELECT * FROM TAB_PERGUNTAS WHERE ID = :ID');
    qry.ParamByName('ID').AsInteger := id;
    qry.Open;

    img := qry.FieldByName('img').AsString;

    Rect := PageImg.PegaImagem(img);

    PageProva.imgPergunta24.Fill.Bitmap.Bitmap := Rect.Fill.Bitmap.Bitmap;

  finally
    qry.DisposeOf;
  end;

end;

//** PREENCHE IMAGEM 24 ** \\

//** PREENCHE IMAGEM 25 ** \\
procedure TDataModule1.PreencheImagem25(id: Integer; ret: TRectangle);
var
  qry : TFDQuery;
  img : String;
  Rect: TRectangle;
begin

  try
    qry := TFDQuery.Create(nil);
    qry.Connection := conn;

    qry.SQL.Clear;
    qry.SQL.Add('SELECT * FROM TAB_PERGUNTAS WHERE ID = :ID');
    qry.ParamByName('ID').AsInteger := id;
    qry.Open;

    img := qry.FieldByName('img').AsString;

    Rect := PageImg.PegaImagem(img);

    PageProva.imgPergunta25.Fill.Bitmap.Bitmap := Rect.Fill.Bitmap.Bitmap;

  finally
    qry.DisposeOf;
  end;

end;

//** PREENCHE IMAGEM 25 ** \\

//** PREENCHE IMAGEM 26 ** \\
procedure TDataModule1.PreencheImagem26(id: Integer; ret: TRectangle);
var
  qry : TFDQuery;
  img : String;
  Rect: TRectangle;
begin

  try
    qry := TFDQuery.Create(nil);
    qry.Connection := conn;

    qry.SQL.Clear;
    qry.SQL.Add('SELECT * FROM TAB_PERGUNTAS WHERE ID = :ID');
    qry.ParamByName('ID').AsInteger := id;
    qry.Open;

    img := qry.FieldByName('img').AsString;

    Rect := PageImg.PegaImagem(img);

    PageProva.imgPergunta26.Fill.Bitmap.Bitmap := Rect.Fill.Bitmap.Bitmap;

  finally
    qry.DisposeOf;
  end;

end;

//** PREENCHE IMAGEM 26 ** \\

//** PREENCHE IMAGEM 27 ** \\
procedure TDataModule1.PreencheImagem27(id: Integer; ret: TRectangle);
var
  qry : TFDQuery;
  img : String;
  Rect: TRectangle;
begin

  try
    qry := TFDQuery.Create(nil);
    qry.Connection := conn;

    qry.SQL.Clear;
    qry.SQL.Add('SELECT * FROM TAB_PERGUNTAS WHERE ID = :ID');
    qry.ParamByName('ID').AsInteger := id;
    qry.Open;

    img := qry.FieldByName('img').AsString;

    Rect := PageImg.PegaImagem(img);

    PageProva.imgPergunta27.Fill.Bitmap.Bitmap := Rect.Fill.Bitmap.Bitmap;

  finally
    qry.DisposeOf;
  end;

end;

//** PREENCHE IMAGEM 27 ** \\

//** PREENCHE IMAGEM 28 ** \\
procedure TDataModule1.PreencheImagem28(id: Integer; ret: TRectangle);
var
  qry : TFDQuery;
  img : String;
  Rect: TRectangle;
begin

  try
    qry := TFDQuery.Create(nil);
    qry.Connection := conn;

    qry.SQL.Clear;
    qry.SQL.Add('SELECT * FROM TAB_PERGUNTAS WHERE ID = :ID');
    qry.ParamByName('ID').AsInteger := id;
    qry.Open;

    img := qry.FieldByName('img').AsString;

    Rect := PageImg.PegaImagem(img);

    PageProva.imgPergunta28.Fill.Bitmap.Bitmap := Rect.Fill.Bitmap.Bitmap;

  finally
    qry.DisposeOf;
  end;

end;

//** PREENCHE IMAGEM 28 ** \\

//** PREENCHE IMAGEM 29 ** \\
procedure TDataModule1.PreencheImagem29(id: Integer; ret: TRectangle);
var
  qry : TFDQuery;
  img : String;
  Rect: TRectangle;
begin

  try
    qry := TFDQuery.Create(nil);
    qry.Connection := conn;

    qry.SQL.Clear;
    qry.SQL.Add('SELECT * FROM TAB_PERGUNTAS WHERE ID = :ID');
    qry.ParamByName('ID').AsInteger := id;
    qry.Open;

    img := qry.FieldByName('img').AsString;

    Rect := PageImg.PegaImagem(img);

    PageProva.imgPergunta29.Fill.Bitmap.Bitmap := Rect.Fill.Bitmap.Bitmap;

  finally
    qry.DisposeOf;
  end;

end;

//** PREENCHE IMAGEM 29 ** \\

//** PREENCHE IMAGEM 30 ** \\
procedure TDataModule1.PreencheImagem30(id: Integer; ret: TRectangle);
var
  qry : TFDQuery;
  img : String;
  Rect: TRectangle;
begin

  try
    qry := TFDQuery.Create(nil);
    qry.Connection := conn;

    qry.SQL.Clear;
    qry.SQL.Add('SELECT * FROM TAB_PERGUNTAS WHERE ID = :ID');
    qry.ParamByName('ID').AsInteger := id;
    qry.Open;

    img := qry.FieldByName('img').AsString;

    Rect := PageImg.PegaImagem(img);

    PageProva.imgPergunta30.Fill.Bitmap.Bitmap := Rect.Fill.Bitmap.Bitmap;

  finally
    qry.DisposeOf;
  end;

end;

//** PREENCHE IMAGEM 30 ** \\



//----------******  ADICIONA PERGUNTAS  ******----------\\

procedure TDataModule1.chamaPergunta;
var
  qryP, qryR, qryS : TFDQuery;
  id, C, reg, perg : Integer;
  resp: array[1..30] of String;
  img: array[1..30] of Boolean;
begin

  try

    qryP := TFDQuery.Create(nil);
    qryR := TFDQuery.Create(nil);
    qryP.Connection := conn;
    qryR.Connection := conn;
    qryS := TFDQuery.Create(nil);
    qryS.Connection := conn;




    // PERGUNTA 1

      qryP.SQL.Clear;
      qryP.SQL.Add('SELECT * FROM TAB_PERGUNTAS ORDER BY RANDOM() LIMIT 1');
      qryP.Open;

      ID := qryP.FieldByName('ID').AsInteger;


      PageProva.questao[1] := ID;
      img[1] := qryP.FieldByName('img_conf').AsBoolean;

      if img[1] = true then
      begin
        PageProva.LayImg1.Visible := true;
        PageProva.imgPergunta1.Visible := true;
        PreencheImagem1(ID, PageProva.imgPergunta1);
      end
      else
      begin
        PageProva.LayImg1.Visible := false;
        PageProva.imgPergunta1.Visible := false;

      end;




      qryS.SQL.Clear;
      qryS.SQL.Add('INSERT INTO TAB_PERGUNTAS_SELECT(COD_PERGUNTA) values(:COD_PERGUNTA) ');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.ExecSQL;



    //ADICIONA PERGUNTA
    PageProva.lblPergunta1.Text := qryP.FieldByName('PERGUNTA').AsString;

    qryR.SQL.Clear;
    qryR.SQL.Add('SELECT * FROM RESPOSTAS WHERE ID_PERGUNTA = :ID');
    qryR.ParamByName('ID').AsInteger := ID;
    qryR.Open;
    resp[1] := qryR.FieldByName('RES_CERTA').AsString;
    PageProva.lblRespA1.Text := qryR.FieldByName('RES_A').AsString;
    PageProva.lblRespB1.Text := qryR.FieldByName('RES_B').AsString;
    PageProva.lblRespC1.Text := qryR.FieldByName('RES_C').AsString;
    PageProva.lblRespD1.Text := qryR.FieldByName('RES_D').AsString;

    qryS.SQL.Clear;
    qryS.SQL.Add('UPDATE TAB_PERGUNTAS_SELECT SET COD_RESPOSTA = :COD_RESPOSTA WHERE COD_PERGUNTA = :ID ');
    qryS.ParamByName('COD_RESPOSTA').AsString := resp[1];
    qryS.ParamByName('ID').AsInteger := ID;
    qryS.ExecSQL;

     //---- PERGUNTA 2  ----//

         //VERIFICA SE PERGUNTA J� ESTA ADICIONADA



    reg := 1;
    while reg = 1 do
    begin
      qryP.SQL.Clear;
      qryP.SQL.Add('SELECT * FROM TAB_PERGUNTAS ORDER BY RANDOM() LIMIT 1');
      qryP.Open;

      ID := qryP.FieldByName('ID').AsInteger;

      PageProva.questao[2] := ID;

      img[2] := qryP.FieldByName('img_conf').AsBoolean;

     if img[2] = true then
      begin
        PageProva.imgPergunta2.Visible := true;
        PreencheImagem2(ID, PageProva.imgPergunta2);
      end
      else
      begin
        PageProva.imgPergunta2.Visible := false;

      end;

      qryS.SQL.Clear;
      qryS.SQL.Add('SELECT * FROM TAB_PERGUNTAS_SELECT WHERE COD_PERGUNTA = :COD_PERGUNTA');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.Open;

      if qryS.IsEmpty then
      begin
        reg := 0;
      end;

    end;

      qryS.SQL.Clear;
      qryS.SQL.Add('INSERT INTO TAB_PERGUNTAS_SELECT(COD_PERGUNTA) values(:COD_PERGUNTA) ');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.ExecSQL;

      PageProva.lblPergunta2.Text := qryP.FieldByName('PERGUNTA').AsString;

      qryR.SQL.Clear;
      qryR.SQL.Add('SELECT * FROM RESPOSTAS WHERE ID_PERGUNTA = :ID');
      qryR.ParamByName('ID').AsInteger := ID;
      qryR.Open;


      resp[2] := qryR.FieldByName('RES_CERTA').AsString;
      PageProva.lblRespA2.Text := qryR.FieldByName('RES_A').AsString;
      PageProva.lblRespB2.Text := qryR.FieldByName('RES_B').AsString;
      PageProva.lblRespC2.Text := qryR.FieldByName('RES_C').AsString;
      PageProva.lblRespD2.Text := qryR.FieldByName('RES_D').AsString;


    qryS.SQL.Clear;
    qryS.SQL.Add('UPDATE TAB_PERGUNTAS_SELECT SET COD_RESPOSTA = :COD_RESPOSTA WHERE COD_PERGUNTA = :ID ');
    qryS.ParamByName('COD_RESPOSTA').AsString := resp[2];
    qryS.ParamByName('ID').AsInteger := ID;
    qryS.ExecSQL;

     //---- PERGUNTA 2  ----//

     //---- PERGUNTA 3  ----//

         //VERIFICA SE PERGUNTA J� ESTA ADICIONADA


    reg := 1;
    while reg = 1 do
    begin
      qryP.SQL.Clear;
      qryP.SQL.Add('SELECT * FROM TAB_PERGUNTAS ORDER BY RANDOM() LIMIT 1');
      qryP.Open;

      ID := qryP.FieldByName('ID').AsInteger;

      PageProva.questao[3] := ID;

      img[3] := qryP.FieldByName('img_conf').AsBoolean;

     if img[3] = true then
      begin
        PageProva.imgPergunta3.Visible := true;
        PreencheImagem3(ID, PageProva.imgPergunta3);
      end
      else
      begin
        PageProva.imgPergunta3.Visible := false;

      end;

      qryS.SQL.Clear;
      qryS.SQL.Add('SELECT * FROM TAB_PERGUNTAS_SELECT WHERE COD_PERGUNTA = :COD_PERGUNTA');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.Open;

      if qryS.IsEmpty then
      begin
        reg := 0;
      end;

    end;

      qryS.SQL.Clear;
      qryS.SQL.Add('INSERT INTO TAB_PERGUNTAS_SELECT(COD_PERGUNTA) values(:COD_PERGUNTA) ');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.ExecSQL;

      PageProva.lblPergunta3.Text := qryP.FieldByName('PERGUNTA').AsString;

      qryR.SQL.Clear;
      qryR.SQL.Add('SELECT * FROM RESPOSTAS WHERE ID_PERGUNTA = :ID');
      qryR.ParamByName('ID').AsInteger := ID;
      qryR.Open;


      resp[3] := qryR.FieldByName('RES_CERTA').AsString;
      PageProva.lblRespA3.Text := qryR.FieldByName('RES_A').AsString;
      PageProva.lblRespB3.Text := qryR.FieldByName('RES_B').AsString;
      PageProva.lblRespC3.Text := qryR.FieldByName('RES_C').AsString;
      PageProva.lblRespD3.Text := qryR.FieldByName('RES_D').AsString;


    qryS.SQL.Clear;
    qryS.SQL.Add('UPDATE TAB_PERGUNTAS_SELECT SET COD_RESPOSTA = :COD_RESPOSTA WHERE COD_PERGUNTA = :ID ');
    qryS.ParamByName('COD_RESPOSTA').AsString := resp[3];
    qryS.ParamByName('ID').AsInteger := ID;
    qryS.ExecSQL;

     //---- PERGUNTA 3  ----//

     //---- PERGUNTA 4  ----//

         //VERIFICA SE PERGUNTA J� ESTA ADICIONADA


    reg := 1;
    while reg = 1 do
    begin
      qryP.SQL.Clear;
      qryP.SQL.Add('SELECT * FROM TAB_PERGUNTAS ORDER BY RANDOM() LIMIT 1');
      qryP.Open;

      ID := qryP.FieldByName('ID').AsInteger;

      PageProva.questao[4] := ID;

      img[4] := qryP.FieldByName('img_conf').AsBoolean;

     if img[4] = true then
      begin
        PageProva.imgPergunta4.Visible := true;
        PreencheImagem4(ID, PageProva.imgPergunta4);
      end
      else
      begin
        PageProva.imgPergunta4.Visible := false;

      end;

      qryS.SQL.Clear;
      qryS.SQL.Add('SELECT * FROM TAB_PERGUNTAS_SELECT WHERE COD_PERGUNTA = :COD_PERGUNTA');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.Open;

      if qryS.IsEmpty then
      begin
        reg := 0;
      end;

    end;

      qryS.SQL.Clear;
      qryS.SQL.Add('INSERT INTO TAB_PERGUNTAS_SELECT(COD_PERGUNTA) values(:COD_PERGUNTA) ');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.ExecSQL;

      PageProva.lblPergunta4.Text := qryP.FieldByName('PERGUNTA').AsString;

      qryR.SQL.Clear;
      qryR.SQL.Add('SELECT * FROM RESPOSTAS WHERE ID_PERGUNTA = :ID');
      qryR.ParamByName('ID').AsInteger := ID;
      qryR.Open;


      resp[4] := qryR.FieldByName('RES_CERTA').AsString;
      PageProva.lblRespA4.Text := qryR.FieldByName('RES_A').AsString;
      PageProva.lblRespB4.Text := qryR.FieldByName('RES_B').AsString;
      PageProva.lblRespC4.Text := qryR.FieldByName('RES_C').AsString;
      PageProva.lblRespD4.Text := qryR.FieldByName('RES_D').AsString;


    qryS.SQL.Clear;
    qryS.SQL.Add('UPDATE TAB_PERGUNTAS_SELECT SET COD_RESPOSTA = :COD_RESPOSTA WHERE COD_PERGUNTA = :ID ');
    qryS.ParamByName('COD_RESPOSTA').AsString := resp[4];
    qryS.ParamByName('ID').AsInteger := ID;
    qryS.ExecSQL;

     //---- PERGUNTA 4  ----//

     //---- PERGUNTA 5  ----//

         //VERIFICA SE PERGUNTA J� ESTA ADICIONADA


    reg := 1;
    while reg = 1 do
    begin
      qryP.SQL.Clear;
      qryP.SQL.Add('SELECT * FROM TAB_PERGUNTAS ORDER BY RANDOM() LIMIT 1');
      qryP.Open;

      ID := qryP.FieldByName('ID').AsInteger;

      PageProva.questao[5] := ID;

      img[5] := qryP.FieldByName('img_conf').AsBoolean;

     if img[5] = true then
      begin
        PageProva.imgPergunta5.Visible := true;
        PreencheImagem5(ID, PageProva.imgPergunta5);
      end
      else
      begin
        PageProva.imgPergunta5.Visible := false;

      end;

      qryS.SQL.Clear;
      qryS.SQL.Add('SELECT * FROM TAB_PERGUNTAS_SELECT WHERE COD_PERGUNTA = :COD_PERGUNTA');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.Open;

      if qryS.IsEmpty then
      begin
        reg := 0;
      end;

    end;

      qryS.SQL.Clear;
      qryS.SQL.Add('INSERT INTO TAB_PERGUNTAS_SELECT(COD_PERGUNTA) values(:COD_PERGUNTA) ');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.ExecSQL;

      PageProva.lblPergunta5.Text := qryP.FieldByName('PERGUNTA').AsString;

      qryR.SQL.Clear;
      qryR.SQL.Add('SELECT * FROM RESPOSTAS WHERE ID_PERGUNTA = :ID');
      qryR.ParamByName('ID').AsInteger := ID;
      qryR.Open;


      resp[5] := qryR.FieldByName('RES_CERTA').AsString;
      PageProva.lblRespA5.Text := qryR.FieldByName('RES_A').AsString;
      PageProva.lblRespB5.Text := qryR.FieldByName('RES_B').AsString;
      PageProva.lblRespC5.Text := qryR.FieldByName('RES_C').AsString;
      PageProva.lblRespD5.Text := qryR.FieldByName('RES_D').AsString;


    qryS.SQL.Clear;
    qryS.SQL.Add('UPDATE TAB_PERGUNTAS_SELECT SET COD_RESPOSTA = :COD_RESPOSTA WHERE COD_PERGUNTA = :ID ');
    qryS.ParamByName('COD_RESPOSTA').AsString := resp[5];
    qryS.ParamByName('ID').AsInteger := ID;
    qryS.ExecSQL;

     //---- PERGUNTA 5  ----//


     //---- PERGUNTA 6  ----//

         //VERIFICA SE PERGUNTA J� ESTA ADICIONADA


    reg := 1;
    while reg = 1 do
    begin
      qryP.SQL.Clear;
      qryP.SQL.Add('SELECT * FROM TAB_PERGUNTAS ORDER BY RANDOM() LIMIT 1');
      qryP.Open;

      ID := qryP.FieldByName('ID').AsInteger;

      PageProva.questao[6] := ID;

      img[6] := qryP.FieldByName('img_conf').AsBoolean;

     if img[6] = true then
      begin
        PageProva.imgPergunta6.Visible := true;
        PreencheImagem6(ID, PageProva.imgPergunta6);
      end
      else
      begin
        PageProva.imgPergunta6.Visible := false;

      end;

      qryS.SQL.Clear;
      qryS.SQL.Add('SELECT * FROM TAB_PERGUNTAS_SELECT WHERE COD_PERGUNTA = :COD_PERGUNTA');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.Open;

      if qryS.IsEmpty then
      begin
        reg := 0;
      end;

    end;

      qryS.SQL.Clear;
      qryS.SQL.Add('INSERT INTO TAB_PERGUNTAS_SELECT(COD_PERGUNTA) values(:COD_PERGUNTA) ');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.ExecSQL;

      PageProva.lblPergunta6.Text := qryP.FieldByName('PERGUNTA').AsString;

      qryR.SQL.Clear;
      qryR.SQL.Add('SELECT * FROM RESPOSTAS WHERE ID_PERGUNTA = :ID');
      qryR.ParamByName('ID').AsInteger := ID;
      qryR.Open;


      resp[6] := qryR.FieldByName('RES_CERTA').AsString;
      PageProva.lblRespA6.Text := qryR.FieldByName('RES_A').AsString;
      PageProva.lblRespB6.Text := qryR.FieldByName('RES_B').AsString;
      PageProva.lblRespC6.Text := qryR.FieldByName('RES_C').AsString;
      PageProva.lblRespD6.Text := qryR.FieldByName('RES_D').AsString;


    qryS.SQL.Clear;
    qryS.SQL.Add('UPDATE TAB_PERGUNTAS_SELECT SET COD_RESPOSTA = :COD_RESPOSTA WHERE COD_PERGUNTA = :ID ');
    qryS.ParamByName('COD_RESPOSTA').AsString := resp[6];
    qryS.ParamByName('ID').AsInteger := ID;
    qryS.ExecSQL;

     //---- PERGUNTA 6  ----//

    //---- PERGUNTA 7  ----//

         //VERIFICA SE PERGUNTA J� ESTA ADICIONADA


    reg := 1;
    while reg = 1 do
    begin
      qryP.SQL.Clear;
      qryP.SQL.Add('SELECT * FROM TAB_PERGUNTAS ORDER BY RANDOM() LIMIT 1');
      qryP.Open;

      ID := qryP.FieldByName('ID').AsInteger;

      PageProva.questao[7] := ID;

      img[7] := qryP.FieldByName('img_conf').AsBoolean;

     if img[7] = true then
      begin
        PageProva.imgPergunta7.Visible := true;
        PreencheImagem7(ID, PageProva.imgPergunta7);
      end
      else
      begin
        PageProva.imgPergunta7.Visible := false;

      end;

      qryS.SQL.Clear;
      qryS.SQL.Add('SELECT * FROM TAB_PERGUNTAS_SELECT WHERE COD_PERGUNTA = :COD_PERGUNTA');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.Open;

      if qryS.IsEmpty then
      begin
        reg := 0;
      end;

    end;

      qryS.SQL.Clear;
      qryS.SQL.Add('INSERT INTO TAB_PERGUNTAS_SELECT(COD_PERGUNTA) values(:COD_PERGUNTA) ');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.ExecSQL;

      PageProva.lblPergunta7.Text := qryP.FieldByName('PERGUNTA').AsString;

      qryR.SQL.Clear;
      qryR.SQL.Add('SELECT * FROM RESPOSTAS WHERE ID_PERGUNTA = :ID');
      qryR.ParamByName('ID').AsInteger := ID;
      qryR.Open;


      resp[7] := qryR.FieldByName('RES_CERTA').AsString;
      PageProva.lblRespA7.Text := qryR.FieldByName('RES_A').AsString;
      PageProva.lblRespB7.Text := qryR.FieldByName('RES_B').AsString;
      PageProva.lblRespC7.Text := qryR.FieldByName('RES_C').AsString;
      PageProva.lblRespD7.Text := qryR.FieldByName('RES_D').AsString;


    qryS.SQL.Clear;
    qryS.SQL.Add('UPDATE TAB_PERGUNTAS_SELECT SET COD_RESPOSTA = :COD_RESPOSTA WHERE COD_PERGUNTA = :ID ');
    qryS.ParamByName('COD_RESPOSTA').AsString := resp[7];
    qryS.ParamByName('ID').AsInteger := ID;
    qryS.ExecSQL;

     //---- PERGUNTA 7  ----//

     //---- PERGUNTA 8  ----//

         //VERIFICA SE PERGUNTA J� ESTA ADICIONADA


    reg := 1;
    while reg = 1 do
    begin
      qryP.SQL.Clear;
      qryP.SQL.Add('SELECT * FROM TAB_PERGUNTAS ORDER BY RANDOM() LIMIT 1');
      qryP.Open;

      ID := qryP.FieldByName('ID').AsInteger;

      PageProva.questao[8] := ID;

      img[8] := qryP.FieldByName('img_conf').AsBoolean;

     if img[8] = true then
      begin
        PageProva.imgPergunta8.Visible := true;
        PreencheImagem8(ID, PageProva.imgPergunta8);
      end
      else
      begin
        PageProva.imgPergunta8.Visible := false;

      end;

      qryS.SQL.Clear;
      qryS.SQL.Add('SELECT * FROM TAB_PERGUNTAS_SELECT WHERE COD_PERGUNTA = :COD_PERGUNTA');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.Open;

      if qryS.IsEmpty then
      begin
        reg := 0;
      end;

    end;

      qryS.SQL.Clear;
      qryS.SQL.Add('INSERT INTO TAB_PERGUNTAS_SELECT(COD_PERGUNTA) values(:COD_PERGUNTA) ');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.ExecSQL;

      PageProva.lblPergunta8.Text := qryP.FieldByName('PERGUNTA').AsString;

      qryR.SQL.Clear;
      qryR.SQL.Add('SELECT * FROM RESPOSTAS WHERE ID_PERGUNTA = :ID');
      qryR.ParamByName('ID').AsInteger := ID;
      qryR.Open;


      resp[8] := qryR.FieldByName('RES_CERTA').AsString;
      PageProva.lblRespA8.Text := qryR.FieldByName('RES_A').AsString;
      PageProva.lblRespB8.Text := qryR.FieldByName('RES_B').AsString;
      PageProva.lblRespC8.Text := qryR.FieldByName('RES_C').AsString;
      PageProva.lblRespD8.Text := qryR.FieldByName('RES_D').AsString;


    qryS.SQL.Clear;
    qryS.SQL.Add('UPDATE TAB_PERGUNTAS_SELECT SET COD_RESPOSTA = :COD_RESPOSTA WHERE COD_PERGUNTA = :ID ');
    qryS.ParamByName('COD_RESPOSTA').AsString := resp[8];
    qryS.ParamByName('ID').AsInteger := ID;
    qryS.ExecSQL;

     //---- PERGUNTA 8  ----//

     //---- PERGUNTA 9  ----//

         //VERIFICA SE PERGUNTA J� ESTA ADICIONADA


    reg := 1;
    while reg = 1 do
    begin
      qryP.SQL.Clear;
      qryP.SQL.Add('SELECT * FROM TAB_PERGUNTAS ORDER BY RANDOM() LIMIT 1');
      qryP.Open;

      ID := qryP.FieldByName('ID').AsInteger;

      PageProva.questao[9] := ID;

      img[9] := qryP.FieldByName('img_conf').AsBoolean;

     if img[9] = true then
      begin
        PageProva.imgPergunta9.Visible := true;
        PreencheImagem9(ID, PageProva.imgPergunta9);
      end
      else
      begin
        PageProva.imgPergunta9.Visible := false;

      end;

      qryS.SQL.Clear;
      qryS.SQL.Add('SELECT * FROM TAB_PERGUNTAS_SELECT WHERE COD_PERGUNTA = :COD_PERGUNTA');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.Open;

      if qryS.IsEmpty then
      begin
        reg := 0;
      end;

    end;

      qryS.SQL.Clear;
      qryS.SQL.Add('INSERT INTO TAB_PERGUNTAS_SELECT(COD_PERGUNTA) values(:COD_PERGUNTA) ');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.ExecSQL;

      PageProva.lblPergunta9.Text := qryP.FieldByName('PERGUNTA').AsString;

      qryR.SQL.Clear;
      qryR.SQL.Add('SELECT * FROM RESPOSTAS WHERE ID_PERGUNTA = :ID');
      qryR.ParamByName('ID').AsInteger := ID;
      qryR.Open;


      resp[9] := qryR.FieldByName('RES_CERTA').AsString;
      PageProva.lblRespA9.Text := qryR.FieldByName('RES_A').AsString;
      PageProva.lblRespB9.Text := qryR.FieldByName('RES_B').AsString;
      PageProva.lblRespC9.Text := qryR.FieldByName('RES_C').AsString;
      PageProva.lblRespD9.Text := qryR.FieldByName('RES_D').AsString;


    qryS.SQL.Clear;
    qryS.SQL.Add('UPDATE TAB_PERGUNTAS_SELECT SET COD_RESPOSTA = :COD_RESPOSTA WHERE COD_PERGUNTA = :ID ');
    qryS.ParamByName('COD_RESPOSTA').AsString := resp[9];
    qryS.ParamByName('ID').AsInteger := ID;
    qryS.ExecSQL;

     //---- PERGUNTA 9  ----//


     //---- PERGUNTA 10  ----//

         //VERIFICA SE PERGUNTA J� ESTA ADICIONADA


    reg := 1;
    while reg = 1 do
    begin
      qryP.SQL.Clear;
      qryP.SQL.Add('SELECT * FROM TAB_PERGUNTAS ORDER BY RANDOM() LIMIT 1');
      qryP.Open;

      ID := qryP.FieldByName('ID').AsInteger;

      PageProva.questao[10] := ID;

      img[10] := qryP.FieldByName('img_conf').AsBoolean;

     if img[10] = true then
      begin
        PageProva.imgPergunta10.Visible := true;
        PreencheImagem10(ID, PageProva.imgPergunta10);
      end
      else
      begin
        PageProva.imgPergunta10.Visible := false;

      end;

      qryS.SQL.Clear;
      qryS.SQL.Add('SELECT * FROM TAB_PERGUNTAS_SELECT WHERE COD_PERGUNTA = :COD_PERGUNTA');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.Open;

      if qryS.IsEmpty then
      begin
        reg := 0;
      end;

    end;

      qryS.SQL.Clear;
      qryS.SQL.Add('INSERT INTO TAB_PERGUNTAS_SELECT(COD_PERGUNTA) values(:COD_PERGUNTA) ');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.ExecSQL;

      PageProva.lblPergunta10.Text := qryP.FieldByName('PERGUNTA').AsString;

      qryR.SQL.Clear;
      qryR.SQL.Add('SELECT * FROM RESPOSTAS WHERE ID_PERGUNTA = :ID');
      qryR.ParamByName('ID').AsInteger := ID;
      qryR.Open;


      resp[10] := qryR.FieldByName('RES_CERTA').AsString;
      PageProva.lblRespA10.Text := qryR.FieldByName('RES_A').AsString;
      PageProva.lblRespB10.Text := qryR.FieldByName('RES_B').AsString;
      PageProva.lblRespC10.Text := qryR.FieldByName('RES_C').AsString;
      PageProva.lblRespD10.Text := qryR.FieldByName('RES_D').AsString;


    qryS.SQL.Clear;
    qryS.SQL.Add('UPDATE TAB_PERGUNTAS_SELECT SET COD_RESPOSTA = :COD_RESPOSTA WHERE COD_PERGUNTA = :ID ');
    qryS.ParamByName('COD_RESPOSTA').AsString := resp[10];
    qryS.ParamByName('ID').AsInteger := ID;
    qryS.ExecSQL;

     //---- PERGUNTA 10  ----//

     //---- PERGUNTA 11  ----//

         //VERIFICA SE PERGUNTA J� ESTA ADICIONADA


    reg := 1;
    while reg = 1 do
    begin
      qryP.SQL.Clear;
      qryP.SQL.Add('SELECT * FROM TAB_PERGUNTAS ORDER BY RANDOM() LIMIT 1');
      qryP.Open;

      ID := qryP.FieldByName('ID').AsInteger;

      PageProva.questao[11] := ID;

      img[11] := qryP.FieldByName('img_conf').AsBoolean;

     if img[11] = true then
      begin
        PageProva.imgPergunta11.Visible := true;
        PreencheImagem11(ID, PageProva.imgPergunta11);
      end
      else
      begin
        PageProva.imgPergunta11.Visible := false;

      end;

      qryS.SQL.Clear;
      qryS.SQL.Add('SELECT * FROM TAB_PERGUNTAS_SELECT WHERE COD_PERGUNTA = :COD_PERGUNTA');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.Open;

      if qryS.IsEmpty then
      begin
        reg := 0;
      end;

    end;

      qryS.SQL.Clear;
      qryS.SQL.Add('INSERT INTO TAB_PERGUNTAS_SELECT(COD_PERGUNTA) values(:COD_PERGUNTA) ');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.ExecSQL;

      PageProva.lblPergunta11.Text := qryP.FieldByName('PERGUNTA').AsString;

      qryR.SQL.Clear;
      qryR.SQL.Add('SELECT * FROM RESPOSTAS WHERE ID_PERGUNTA = :ID');
      qryR.ParamByName('ID').AsInteger := ID;
      qryR.Open;


      resp[11] := qryR.FieldByName('RES_CERTA').AsString;
      PageProva.lblRespA11.Text := qryR.FieldByName('RES_A').AsString;
      PageProva.lblRespB11.Text := qryR.FieldByName('RES_B').AsString;
      PageProva.lblRespC11.Text := qryR.FieldByName('RES_C').AsString;
      PageProva.lblRespD11.Text := qryR.FieldByName('RES_D').AsString;


    qryS.SQL.Clear;
    qryS.SQL.Add('UPDATE TAB_PERGUNTAS_SELECT SET COD_RESPOSTA = :COD_RESPOSTA WHERE COD_PERGUNTA = :ID ');
    qryS.ParamByName('COD_RESPOSTA').AsString := resp[11];
    qryS.ParamByName('ID').AsInteger := ID;
    qryS.ExecSQL;

     //---- PERGUNTA 11  ----//


 //---- PERGUNTA 12  ----//

         //VERIFICA SE PERGUNTA J� ESTA ADICIONADA


    reg := 1;
    while reg = 1 do
    begin
      qryP.SQL.Clear;
      qryP.SQL.Add('SELECT * FROM TAB_PERGUNTAS ORDER BY RANDOM() LIMIT 1');
      qryP.Open;

      ID := qryP.FieldByName('ID').AsInteger;

      PageProva.questao[12] := ID;

      img[12] := qryP.FieldByName('img_conf').AsBoolean;

     if img[12] = true then
      begin
        PageProva.imgPergunta12.Visible := true;
        PreencheImagem12(ID, PageProva.imgPergunta12);
      end
      else
      begin
        PageProva.imgPergunta12.Visible := false;

      end;

      qryS.SQL.Clear;
      qryS.SQL.Add('SELECT * FROM TAB_PERGUNTAS_SELECT WHERE COD_PERGUNTA = :COD_PERGUNTA');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.Open;

      if qryS.IsEmpty then
      begin
        reg := 0;
      end;

    end;

      qryS.SQL.Clear;
      qryS.SQL.Add('INSERT INTO TAB_PERGUNTAS_SELECT(COD_PERGUNTA) values(:COD_PERGUNTA) ');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.ExecSQL;

      PageProva.lblPergunta12.Text := qryP.FieldByName('PERGUNTA').AsString;

      qryR.SQL.Clear;
      qryR.SQL.Add('SELECT * FROM RESPOSTAS WHERE ID_PERGUNTA = :ID');
      qryR.ParamByName('ID').AsInteger := ID;
      qryR.Open;


      resp[12] := qryR.FieldByName('RES_CERTA').AsString;
      PageProva.lblRespA12.Text := qryR.FieldByName('RES_A').AsString;
      PageProva.lblRespB12.Text := qryR.FieldByName('RES_B').AsString;
      PageProva.lblRespC12.Text := qryR.FieldByName('RES_C').AsString;
      PageProva.lblRespD12.Text := qryR.FieldByName('RES_D').AsString;


    qryS.SQL.Clear;
    qryS.SQL.Add('UPDATE TAB_PERGUNTAS_SELECT SET COD_RESPOSTA = :COD_RESPOSTA WHERE COD_PERGUNTA = :ID ');
    qryS.ParamByName('COD_RESPOSTA').AsString := resp[12];
    qryS.ParamByName('ID').AsInteger := ID;
    qryS.ExecSQL;

     //---- PERGUNTA 12  ----//

      //---- PERGUNTA 13  ----//

         //VERIFICA SE PERGUNTA J� ESTA ADICIONADA


    reg := 1;
    while reg = 1 do
    begin
      qryP.SQL.Clear;
      qryP.SQL.Add('SELECT * FROM TAB_PERGUNTAS ORDER BY RANDOM() LIMIT 1');
      qryP.Open;

      ID := qryP.FieldByName('ID').AsInteger;

      PageProva.questao[13] := ID;

      img[13] := qryP.FieldByName('img_conf').AsBoolean;

     if img[13] = true then
      begin
        PageProva.imgPergunta13.Visible := true;
        PreencheImagem13(ID, PageProva.imgPergunta13);
      end
      else
      begin
        PageProva.imgPergunta13.Visible := false;

      end;

      qryS.SQL.Clear;
      qryS.SQL.Add('SELECT * FROM TAB_PERGUNTAS_SELECT WHERE COD_PERGUNTA = :COD_PERGUNTA');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.Open;

      if qryS.IsEmpty then
      begin
        reg := 0;
      end;

    end;

      qryS.SQL.Clear;
      qryS.SQL.Add('INSERT INTO TAB_PERGUNTAS_SELECT(COD_PERGUNTA) values(:COD_PERGUNTA) ');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.ExecSQL;

      PageProva.lblPergunta13.Text := qryP.FieldByName('PERGUNTA').AsString;

      qryR.SQL.Clear;
      qryR.SQL.Add('SELECT * FROM RESPOSTAS WHERE ID_PERGUNTA = :ID');
      qryR.ParamByName('ID').AsInteger := ID;
      qryR.Open;


      resp[13] := qryR.FieldByName('RES_CERTA').AsString;
      PageProva.lblRespA13.Text := qryR.FieldByName('RES_A').AsString;
      PageProva.lblRespB13.Text := qryR.FieldByName('RES_B').AsString;
      PageProva.lblRespC13.Text := qryR.FieldByName('RES_C').AsString;
      PageProva.lblRespD13.Text := qryR.FieldByName('RES_D').AsString;


    qryS.SQL.Clear;
    qryS.SQL.Add('UPDATE TAB_PERGUNTAS_SELECT SET COD_RESPOSTA = :COD_RESPOSTA WHERE COD_PERGUNTA = :ID ');
    qryS.ParamByName('COD_RESPOSTA').AsString := resp[13];
    qryS.ParamByName('ID').AsInteger := ID;
    qryS.ExecSQL;

     //---- PERGUNTA 13  ----//

      //---- PERGUNTA 14  ----//

         //VERIFICA SE PERGUNTA J� ESTA ADICIONADA


    reg := 1;
    while reg = 1 do
    begin
      qryP.SQL.Clear;
      qryP.SQL.Add('SELECT * FROM TAB_PERGUNTAS ORDER BY RANDOM() LIMIT 1');
      qryP.Open;

      ID := qryP.FieldByName('ID').AsInteger;

      PageProva.questao[14] := ID;

      img[14] := qryP.FieldByName('img_conf').AsBoolean;

     if img[14] = true then
      begin
        PageProva.imgPergunta14.Visible := true;
        PreencheImagem14(ID, PageProva.imgPergunta14);
      end
      else
      begin
        PageProva.imgPergunta14.Visible := false;

      end;

      qryS.SQL.Clear;
      qryS.SQL.Add('SELECT * FROM TAB_PERGUNTAS_SELECT WHERE COD_PERGUNTA = :COD_PERGUNTA');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.Open;

      if qryS.IsEmpty then
      begin
        reg := 0;
      end;

    end;

      qryS.SQL.Clear;
      qryS.SQL.Add('INSERT INTO TAB_PERGUNTAS_SELECT(COD_PERGUNTA) values(:COD_PERGUNTA) ');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.ExecSQL;

      PageProva.lblPergunta14.Text := qryP.FieldByName('PERGUNTA').AsString;

      qryR.SQL.Clear;
      qryR.SQL.Add('SELECT * FROM RESPOSTAS WHERE ID_PERGUNTA = :ID');
      qryR.ParamByName('ID').AsInteger := ID;
      qryR.Open;


      resp[14] := qryR.FieldByName('RES_CERTA').AsString;
      PageProva.lblRespA14.Text := qryR.FieldByName('RES_A').AsString;
      PageProva.lblRespB14.Text := qryR.FieldByName('RES_B').AsString;
      PageProva.lblRespC14.Text := qryR.FieldByName('RES_C').AsString;
      PageProva.lblRespD14.Text := qryR.FieldByName('RES_D').AsString;


    qryS.SQL.Clear;
    qryS.SQL.Add('UPDATE TAB_PERGUNTAS_SELECT SET COD_RESPOSTA = :COD_RESPOSTA WHERE COD_PERGUNTA = :ID ');
    qryS.ParamByName('COD_RESPOSTA').AsString := resp[14];
    qryS.ParamByName('ID').AsInteger := ID;
    qryS.ExecSQL;

     //---- PERGUNTA 14  ----//

      //---- PERGUNTA 15  ----//

         //VERIFICA SE PERGUNTA J� ESTA ADICIONADA


    reg := 1;
    while reg = 1 do
    begin
      qryP.SQL.Clear;
      qryP.SQL.Add('SELECT * FROM TAB_PERGUNTAS ORDER BY RANDOM() LIMIT 1');
      qryP.Open;

      ID := qryP.FieldByName('ID').AsInteger;

      PageProva.questao[15] := ID;

      img[15] := qryP.FieldByName('img_conf').AsBoolean;

     if img[15] = true then
      begin
        PageProva.imgPergunta15.Visible := true;
        PreencheImagem15(ID, PageProva.imgPergunta15);
      end
      else
      begin
        PageProva.imgPergunta15.Visible := false;

      end;

      qryS.SQL.Clear;
      qryS.SQL.Add('SELECT * FROM TAB_PERGUNTAS_SELECT WHERE COD_PERGUNTA = :COD_PERGUNTA');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.Open;

      if qryS.IsEmpty then
      begin
        reg := 0;
      end;

    end;

      qryS.SQL.Clear;
      qryS.SQL.Add('INSERT INTO TAB_PERGUNTAS_SELECT(COD_PERGUNTA) values(:COD_PERGUNTA) ');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.ExecSQL;

      PageProva.lblPergunta15.Text := qryP.FieldByName('PERGUNTA').AsString;

      qryR.SQL.Clear;
      qryR.SQL.Add('SELECT * FROM RESPOSTAS WHERE ID_PERGUNTA = :ID');
      qryR.ParamByName('ID').AsInteger := ID;
      qryR.Open;


      resp[15] := qryR.FieldByName('RES_CERTA').AsString;
      PageProva.lblRespA15.Text := qryR.FieldByName('RES_A').AsString;
      PageProva.lblRespB15.Text := qryR.FieldByName('RES_B').AsString;
      PageProva.lblRespC15.Text := qryR.FieldByName('RES_C').AsString;
      PageProva.lblRespD15.Text := qryR.FieldByName('RES_D').AsString;


    qryS.SQL.Clear;
    qryS.SQL.Add('UPDATE TAB_PERGUNTAS_SELECT SET COD_RESPOSTA = :COD_RESPOSTA WHERE COD_PERGUNTA = :ID ');
    qryS.ParamByName('COD_RESPOSTA').AsString := resp[15];
    qryS.ParamByName('ID').AsInteger := ID;
    qryS.ExecSQL;

     //---- PERGUNTA 15  ----//

      //---- PERGUNTA 16  ----//

         //VERIFICA SE PERGUNTA J� ESTA ADICIONADA


    reg := 1;
    while reg = 1 do
    begin
      qryP.SQL.Clear;
      qryP.SQL.Add('SELECT * FROM TAB_PERGUNTAS ORDER BY RANDOM() LIMIT 1');
      qryP.Open;

      ID := qryP.FieldByName('ID').AsInteger;

      PageProva.questao[16] := ID;

      img[16] := qryP.FieldByName('img_conf').AsBoolean;

     if img[16] = true then
      begin
        PageProva.imgPergunta16.Visible := true;
        PreencheImagem16(ID, PageProva.imgPergunta16);
      end
      else
      begin
        PageProva.imgPergunta16.Visible := false;

      end;

      qryS.SQL.Clear;
      qryS.SQL.Add('SELECT * FROM TAB_PERGUNTAS_SELECT WHERE COD_PERGUNTA = :COD_PERGUNTA');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.Open;

      if qryS.IsEmpty then
      begin
        reg := 0;
      end;

    end;

      qryS.SQL.Clear;
      qryS.SQL.Add('INSERT INTO TAB_PERGUNTAS_SELECT(COD_PERGUNTA) values(:COD_PERGUNTA) ');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.ExecSQL;

      PageProva.lblPergunta16.Text := qryP.FieldByName('PERGUNTA').AsString;

      qryR.SQL.Clear;
      qryR.SQL.Add('SELECT * FROM RESPOSTAS WHERE ID_PERGUNTA = :ID');
      qryR.ParamByName('ID').AsInteger := ID;
      qryR.Open;


      resp[16] := qryR.FieldByName('RES_CERTA').AsString;
      PageProva.lblRespA16.Text := qryR.FieldByName('RES_A').AsString;
      PageProva.lblRespB16.Text := qryR.FieldByName('RES_B').AsString;
      PageProva.lblRespC16.Text := qryR.FieldByName('RES_C').AsString;
      PageProva.lblRespD16.Text := qryR.FieldByName('RES_D').AsString;


    qryS.SQL.Clear;
    qryS.SQL.Add('UPDATE TAB_PERGUNTAS_SELECT SET COD_RESPOSTA = :COD_RESPOSTA WHERE COD_PERGUNTA = :ID ');
    qryS.ParamByName('COD_RESPOSTA').AsString := resp[16];
    qryS.ParamByName('ID').AsInteger := ID;
    qryS.ExecSQL;

     //---- PERGUNTA 16  ----//

      //---- PERGUNTA 17  ----//

         //VERIFICA SE PERGUNTA J� ESTA ADICIONADA


    reg := 1;
    while reg = 1 do
    begin
      qryP.SQL.Clear;
      qryP.SQL.Add('SELECT * FROM TAB_PERGUNTAS ORDER BY RANDOM() LIMIT 1');
      qryP.Open;

      ID := qryP.FieldByName('ID').AsInteger;

     PageProva.questao[17] := ID;

      img[17] := qryP.FieldByName('img_conf').AsBoolean;

     if img[17] = true then
      begin
        PageProva.imgPergunta17.Visible := true;
        PreencheImagem17(ID, PageProva.imgPergunta17);
      end
      else
      begin
        PageProva.imgPergunta17.Visible := false;

      end;

      qryS.SQL.Clear;
      qryS.SQL.Add('SELECT * FROM TAB_PERGUNTAS_SELECT WHERE COD_PERGUNTA = :COD_PERGUNTA');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.Open;

      if qryS.IsEmpty then
      begin
        reg := 0;
      end;

    end;

      qryS.SQL.Clear;
      qryS.SQL.Add('INSERT INTO TAB_PERGUNTAS_SELECT(COD_PERGUNTA) values(:COD_PERGUNTA) ');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.ExecSQL;

      PageProva.lblPergunta17.Text := qryP.FieldByName('PERGUNTA').AsString;

      qryR.SQL.Clear;
      qryR.SQL.Add('SELECT * FROM RESPOSTAS WHERE ID_PERGUNTA = :ID');
      qryR.ParamByName('ID').AsInteger := ID;
      qryR.Open;


      resp[17] := qryR.FieldByName('RES_CERTA').AsString;
      PageProva.lblRespA17.Text := qryR.FieldByName('RES_A').AsString;
      PageProva.lblRespB17.Text := qryR.FieldByName('RES_B').AsString;
      PageProva.lblRespC17.Text := qryR.FieldByName('RES_C').AsString;
      PageProva.lblRespD17.Text := qryR.FieldByName('RES_D').AsString;


    qryS.SQL.Clear;
    qryS.SQL.Add('UPDATE TAB_PERGUNTAS_SELECT SET COD_RESPOSTA = :COD_RESPOSTA WHERE COD_PERGUNTA = :ID ');
    qryS.ParamByName('COD_RESPOSTA').AsString := resp[17];
    qryS.ParamByName('ID').AsInteger := ID;
    qryS.ExecSQL;

     //---- PERGUNTA 17  ----//

      //---- PERGUNTA 18  ----//

         //VERIFICA SE PERGUNTA J� ESTA ADICIONADA


    reg := 1;
    while reg = 1 do
    begin
      qryP.SQL.Clear;
      qryP.SQL.Add('SELECT * FROM TAB_PERGUNTAS ORDER BY RANDOM() LIMIT 1');
      qryP.Open;

      ID := qryP.FieldByName('ID').AsInteger;

      PageProva.questao[18] := ID;

      img[18] := qryP.FieldByName('img_conf').AsBoolean;

     if img[18] = true then
      begin
        PageProva.imgPergunta18.Visible := true;
        PreencheImagem18(ID, PageProva.imgPergunta18);
      end
      else
      begin
        PageProva.imgPergunta18.Visible := false;

      end;

      qryS.SQL.Clear;
      qryS.SQL.Add('SELECT * FROM TAB_PERGUNTAS_SELECT WHERE COD_PERGUNTA = :COD_PERGUNTA');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.Open;

      if qryS.IsEmpty then
      begin
        reg := 0;
      end;

    end;

      qryS.SQL.Clear;
      qryS.SQL.Add('INSERT INTO TAB_PERGUNTAS_SELECT(COD_PERGUNTA) values(:COD_PERGUNTA) ');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.ExecSQL;

      PageProva.lblPergunta18.Text := qryP.FieldByName('PERGUNTA').AsString;

      qryR.SQL.Clear;
      qryR.SQL.Add('SELECT * FROM RESPOSTAS WHERE ID_PERGUNTA = :ID');
      qryR.ParamByName('ID').AsInteger := ID;
      qryR.Open;


      resp[18] := qryR.FieldByName('RES_CERTA').AsString;
      PageProva.lblRespA18.Text := qryR.FieldByName('RES_A').AsString;
      PageProva.lblRespB18.Text := qryR.FieldByName('RES_B').AsString;
      PageProva.lblRespC18.Text := qryR.FieldByName('RES_C').AsString;
      PageProva.lblRespD18.Text := qryR.FieldByName('RES_D').AsString;


    qryS.SQL.Clear;
    qryS.SQL.Add('UPDATE TAB_PERGUNTAS_SELECT SET COD_RESPOSTA = :COD_RESPOSTA WHERE COD_PERGUNTA = :ID ');
    qryS.ParamByName('COD_RESPOSTA').AsString := resp[18];
    qryS.ParamByName('ID').AsInteger := ID;
    qryS.ExecSQL;

     //---- PERGUNTA 18  ----//

      //---- PERGUNTA 19  ----//

         //VERIFICA SE PERGUNTA J� ESTA ADICIONADA


    reg := 1;
    while reg = 1 do
    begin
      qryP.SQL.Clear;
      qryP.SQL.Add('SELECT * FROM TAB_PERGUNTAS ORDER BY RANDOM() LIMIT 1');
      qryP.Open;

      ID := qryP.FieldByName('ID').AsInteger;

      PageProva.questao[19] := ID;

      img[19] := qryP.FieldByName('img_conf').AsBoolean;

     if img[19] = true then
      begin
        PageProva.imgPergunta19.Visible := true;
        PreencheImagem19(ID, PageProva.imgPergunta19);
      end
      else
      begin
        PageProva.imgPergunta19.Visible := false;

      end;

      qryS.SQL.Clear;
      qryS.SQL.Add('SELECT * FROM TAB_PERGUNTAS_SELECT WHERE COD_PERGUNTA = :COD_PERGUNTA');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.Open;

      if qryS.IsEmpty then
      begin
        reg := 0;
      end;

    end;

      qryS.SQL.Clear;
      qryS.SQL.Add('INSERT INTO TAB_PERGUNTAS_SELECT(COD_PERGUNTA) values(:COD_PERGUNTA) ');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.ExecSQL;

      PageProva.lblPergunta19.Text := qryP.FieldByName('PERGUNTA').AsString;

      qryR.SQL.Clear;
      qryR.SQL.Add('SELECT * FROM RESPOSTAS WHERE ID_PERGUNTA = :ID');
      qryR.ParamByName('ID').AsInteger := ID;
      qryR.Open;


      resp[19] := qryR.FieldByName('RES_CERTA').AsString;
      PageProva.lblRespA19.Text := qryR.FieldByName('RES_A').AsString;
      PageProva.lblRespB19.Text := qryR.FieldByName('RES_B').AsString;
      PageProva.lblRespC19.Text := qryR.FieldByName('RES_C').AsString;
      PageProva.lblRespD19.Text := qryR.FieldByName('RES_D').AsString;


    qryS.SQL.Clear;
    qryS.SQL.Add('UPDATE TAB_PERGUNTAS_SELECT SET COD_RESPOSTA = :COD_RESPOSTA WHERE COD_PERGUNTA = :ID ');
    qryS.ParamByName('COD_RESPOSTA').AsString := resp[19];
    qryS.ParamByName('ID').AsInteger := ID;
    qryS.ExecSQL;

     //---- PERGUNTA 19  ----//

      //---- PERGUNTA 20  ----//

         //VERIFICA SE PERGUNTA J� ESTA ADICIONADA


    reg := 1;
    while reg = 1 do
    begin
      qryP.SQL.Clear;
      qryP.SQL.Add('SELECT * FROM TAB_PERGUNTAS ORDER BY RANDOM() LIMIT 1');
      qryP.Open;

      ID := qryP.FieldByName('ID').AsInteger;

      PageProva.questao[20] := ID;

      img[20] := qryP.FieldByName('img_conf').AsBoolean;

     if img[20] = true then
      begin
        PageProva.imgPergunta20.Visible := true;
        PreencheImagem20(ID, PageProva.imgPergunta20);
      end
      else
      begin
        PageProva.imgPergunta20.Visible := false;

      end;

      qryS.SQL.Clear;
      qryS.SQL.Add('SELECT * FROM TAB_PERGUNTAS_SELECT WHERE COD_PERGUNTA = :COD_PERGUNTA');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.Open;

      if qryS.IsEmpty then
      begin
        reg := 0;
      end;

    end;

      qryS.SQL.Clear;
      qryS.SQL.Add('INSERT INTO TAB_PERGUNTAS_SELECT(COD_PERGUNTA) values(:COD_PERGUNTA) ');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.ExecSQL;

      PageProva.lblPergunta20.Text := qryP.FieldByName('PERGUNTA').AsString;

      qryR.SQL.Clear;
      qryR.SQL.Add('SELECT * FROM RESPOSTAS WHERE ID_PERGUNTA = :ID');
      qryR.ParamByName('ID').AsInteger := ID;
      qryR.Open;


      resp[20] := qryR.FieldByName('RES_CERTA').AsString;
      PageProva.lblRespA20.Text := qryR.FieldByName('RES_A').AsString;
      PageProva.lblRespB20.Text := qryR.FieldByName('RES_B').AsString;
      PageProva.lblRespC20.Text := qryR.FieldByName('RES_C').AsString;
      PageProva.lblRespD20.Text := qryR.FieldByName('RES_D').AsString;


    qryS.SQL.Clear;
    qryS.SQL.Add('UPDATE TAB_PERGUNTAS_SELECT SET COD_RESPOSTA = :COD_RESPOSTA WHERE COD_PERGUNTA = :ID ');
    qryS.ParamByName('COD_RESPOSTA').AsString := resp[20];
    qryS.ParamByName('ID').AsInteger := ID;
    qryS.ExecSQL;

     //---- PERGUNTA 20  ----//


      //---- PERGUNTA 21  ----//

         //VERIFICA SE PERGUNTA J� ESTA ADICIONADA


    reg := 1;
    while reg = 1 do
    begin
      qryP.SQL.Clear;
      qryP.SQL.Add('SELECT * FROM TAB_PERGUNTAS ORDER BY RANDOM() LIMIT 1');
      qryP.Open;

      ID := qryP.FieldByName('ID').AsInteger;

      PageProva.questao[21] := ID;

      img[21] := qryP.FieldByName('img_conf').AsBoolean;

     if img[21] = true then
      begin
        PageProva.imgPergunta21.Visible := true;
        PreencheImagem21(ID, PageProva.imgPergunta21);
      end
      else
      begin
        PageProva.imgPergunta21.Visible := false;

      end;

      qryS.SQL.Clear;
      qryS.SQL.Add('SELECT * FROM TAB_PERGUNTAS_SELECT WHERE COD_PERGUNTA = :COD_PERGUNTA');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.Open;

      if qryS.IsEmpty then
      begin
        reg := 0;
      end;

    end;

      qryS.SQL.Clear;
      qryS.SQL.Add('INSERT INTO TAB_PERGUNTAS_SELECT(COD_PERGUNTA) values(:COD_PERGUNTA) ');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.ExecSQL;

      PageProva.lblPergunta21.Text := qryP.FieldByName('PERGUNTA').AsString;

      qryR.SQL.Clear;
      qryR.SQL.Add('SELECT * FROM RESPOSTAS WHERE ID_PERGUNTA = :ID');
      qryR.ParamByName('ID').AsInteger := ID;
      qryR.Open;


      resp[21] := qryR.FieldByName('RES_CERTA').AsString;
      PageProva.lblRespA21.Text := qryR.FieldByName('RES_A').AsString;
      PageProva.lblRespB21.Text := qryR.FieldByName('RES_B').AsString;
      PageProva.lblRespC21.Text := qryR.FieldByName('RES_C').AsString;
      PageProva.lblRespD21.Text := qryR.FieldByName('RES_D').AsString;


    qryS.SQL.Clear;
    qryS.SQL.Add('UPDATE TAB_PERGUNTAS_SELECT SET COD_RESPOSTA = :COD_RESPOSTA WHERE COD_PERGUNTA = :ID ');
    qryS.ParamByName('COD_RESPOSTA').AsString := resp[21];
    qryS.ParamByName('ID').AsInteger := ID;
    qryS.ExecSQL;

     //---- PERGUNTA 21  ----//


      //---- PERGUNTA 22  ----//

         //VERIFICA SE PERGUNTA J� ESTA ADICIONADA


    reg := 1;
    while reg = 1 do
    begin
      qryP.SQL.Clear;
      qryP.SQL.Add('SELECT * FROM TAB_PERGUNTAS ORDER BY RANDOM() LIMIT 1');
      qryP.Open;

      ID := qryP.FieldByName('ID').AsInteger;

      PageProva.questao[22] := ID;

      img[22] := qryP.FieldByName('img_conf').AsBoolean;

     if img[22] = true then
      begin
        PageProva.imgPergunta22.Visible := true;
        PreencheImagem22(ID, PageProva.imgPergunta22);
      end
      else
      begin
        PageProva.imgPergunta22.Visible := false;

      end;

      qryS.SQL.Clear;
      qryS.SQL.Add('SELECT * FROM TAB_PERGUNTAS_SELECT WHERE COD_PERGUNTA = :COD_PERGUNTA');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.Open;

      if qryS.IsEmpty then
      begin
        reg := 0;
      end;

    end;

      qryS.SQL.Clear;
      qryS.SQL.Add('INSERT INTO TAB_PERGUNTAS_SELECT(COD_PERGUNTA) values(:COD_PERGUNTA) ');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.ExecSQL;

      PageProva.lblPergunta22.Text := qryP.FieldByName('PERGUNTA').AsString;

      qryR.SQL.Clear;
      qryR.SQL.Add('SELECT * FROM RESPOSTAS WHERE ID_PERGUNTA = :ID');
      qryR.ParamByName('ID').AsInteger := ID;
      qryR.Open;


      resp[22] := qryR.FieldByName('RES_CERTA').AsString;
      PageProva.lblRespA22.Text := qryR.FieldByName('RES_A').AsString;
      PageProva.lblRespB22.Text := qryR.FieldByName('RES_B').AsString;
      PageProva.lblRespC22.Text := qryR.FieldByName('RES_C').AsString;
      PageProva.lblRespD22.Text := qryR.FieldByName('RES_D').AsString;


    qryS.SQL.Clear;
    qryS.SQL.Add('UPDATE TAB_PERGUNTAS_SELECT SET COD_RESPOSTA = :COD_RESPOSTA WHERE COD_PERGUNTA = :ID ');
    qryS.ParamByName('COD_RESPOSTA').AsString := resp[22];
    qryS.ParamByName('ID').AsInteger := ID;
    qryS.ExecSQL;

     //---- PERGUNTA 22  ----//


      //---- PERGUNTA 23  ----//

         //VERIFICA SE PERGUNTA J� ESTA ADICIONADA


    reg := 1;
    while reg = 1 do
    begin
      qryP.SQL.Clear;
      qryP.SQL.Add('SELECT * FROM TAB_PERGUNTAS ORDER BY RANDOM() LIMIT 1');
      qryP.Open;

      ID := qryP.FieldByName('ID').AsInteger;

      PageProva.questao[23] := ID;

      img[23] := qryP.FieldByName('img_conf').AsBoolean;

     if img[23] = true then
      begin
        PageProva.imgPergunta23.Visible := true;
        PreencheImagem23(ID, PageProva.imgPergunta23);
      end
      else
      begin
        PageProva.imgPergunta23.Visible := false;

      end;

      qryS.SQL.Clear;
      qryS.SQL.Add('SELECT * FROM TAB_PERGUNTAS_SELECT WHERE COD_PERGUNTA = :COD_PERGUNTA');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.Open;

      if qryS.IsEmpty then
      begin
        reg := 0;
      end;

    end;

      qryS.SQL.Clear;
      qryS.SQL.Add('INSERT INTO TAB_PERGUNTAS_SELECT(COD_PERGUNTA) values(:COD_PERGUNTA) ');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.ExecSQL;

      PageProva.lblPergunta23.Text := qryP.FieldByName('PERGUNTA').AsString;

      qryR.SQL.Clear;
      qryR.SQL.Add('SELECT * FROM RESPOSTAS WHERE ID_PERGUNTA = :ID');
      qryR.ParamByName('ID').AsInteger := ID;
      qryR.Open;


      resp[23] := qryR.FieldByName('RES_CERTA').AsString;
      PageProva.lblRespA23.Text := qryR.FieldByName('RES_A').AsString;
      PageProva.lblRespB23.Text := qryR.FieldByName('RES_B').AsString;
      PageProva.lblRespC23.Text := qryR.FieldByName('RES_C').AsString;
      PageProva.lblRespD23.Text := qryR.FieldByName('RES_D').AsString;


    qryS.SQL.Clear;
    qryS.SQL.Add('UPDATE TAB_PERGUNTAS_SELECT SET COD_RESPOSTA = :COD_RESPOSTA WHERE COD_PERGUNTA = :ID ');
    qryS.ParamByName('COD_RESPOSTA').AsString := resp[23];
    qryS.ParamByName('ID').AsInteger := ID;
    qryS.ExecSQL;

     //---- PERGUNTA 23  ----//


      //---- PERGUNTA 24  ----//

         //VERIFICA SE PERGUNTA J� ESTA ADICIONADA


    reg := 1;
    while reg = 1 do
    begin
      qryP.SQL.Clear;
      qryP.SQL.Add('SELECT * FROM TAB_PERGUNTAS ORDER BY RANDOM() LIMIT 1');
      qryP.Open;

      ID := qryP.FieldByName('ID').AsInteger;

      PageProva.questao[24] := ID;

      img[24] := qryP.FieldByName('img_conf').AsBoolean;

     if img[24] = true then
      begin
        PageProva.imgPergunta24.Visible := true;
        PreencheImagem24(ID, PageProva.imgPergunta24);
      end
      else
      begin
        PageProva.imgPergunta24.Visible := false;

      end;

      qryS.SQL.Clear;
      qryS.SQL.Add('SELECT * FROM TAB_PERGUNTAS_SELECT WHERE COD_PERGUNTA = :COD_PERGUNTA');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.Open;

      if qryS.IsEmpty then
      begin
        reg := 0;
      end;

    end;

      qryS.SQL.Clear;
      qryS.SQL.Add('INSERT INTO TAB_PERGUNTAS_SELECT(COD_PERGUNTA) values(:COD_PERGUNTA) ');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.ExecSQL;

      PageProva.lblPergunta24.Text := qryP.FieldByName('PERGUNTA').AsString;

      qryR.SQL.Clear;
      qryR.SQL.Add('SELECT * FROM RESPOSTAS WHERE ID_PERGUNTA = :ID');
      qryR.ParamByName('ID').AsInteger := ID;
      qryR.Open;


      resp[24] := qryR.FieldByName('RES_CERTA').AsString;
      PageProva.lblRespA24.Text := qryR.FieldByName('RES_A').AsString;
      PageProva.lblRespB24.Text := qryR.FieldByName('RES_B').AsString;
      PageProva.lblRespC24.Text := qryR.FieldByName('RES_C').AsString;
      PageProva.lblRespD24.Text := qryR.FieldByName('RES_D').AsString;


    qryS.SQL.Clear;
    qryS.SQL.Add('UPDATE TAB_PERGUNTAS_SELECT SET COD_RESPOSTA = :COD_RESPOSTA WHERE COD_PERGUNTA = :ID ');
    qryS.ParamByName('COD_RESPOSTA').AsString := resp[24];
    qryS.ParamByName('ID').AsInteger := ID;
    qryS.ExecSQL;

     //---- PERGUNTA 24  ----//


      //---- PERGUNTA 25  ----//

         //VERIFICA SE PERGUNTA J� ESTA ADICIONADA


    reg := 1;
    while reg = 1 do
    begin
      qryP.SQL.Clear;
      qryP.SQL.Add('SELECT * FROM TAB_PERGUNTAS ORDER BY RANDOM() LIMIT 1');
      qryP.Open;

      ID := qryP.FieldByName('ID').AsInteger;

      PageProva.questao[25] := ID;

      img[25] := qryP.FieldByName('img_conf').AsBoolean;

     if img[25] = true then
      begin
        PageProva.imgPergunta25.Visible := true;
        PreencheImagem25(ID, PageProva.imgPergunta25);
      end
      else
      begin
        PageProva.imgPergunta25.Visible := false;

      end;

      qryS.SQL.Clear;
      qryS.SQL.Add('SELECT * FROM TAB_PERGUNTAS_SELECT WHERE COD_PERGUNTA = :COD_PERGUNTA');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.Open;

      if qryS.IsEmpty then
      begin
        reg := 0;
      end;

    end;

      qryS.SQL.Clear;
      qryS.SQL.Add('INSERT INTO TAB_PERGUNTAS_SELECT(COD_PERGUNTA) values(:COD_PERGUNTA) ');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.ExecSQL;

      PageProva.lblPergunta25.Text := qryP.FieldByName('PERGUNTA').AsString;

      qryR.SQL.Clear;
      qryR.SQL.Add('SELECT * FROM RESPOSTAS WHERE ID_PERGUNTA = :ID');
      qryR.ParamByName('ID').AsInteger := ID;
      qryR.Open;


      resp[25] := qryR.FieldByName('RES_CERTA').AsString;
      PageProva.lblRespA25.Text := qryR.FieldByName('RES_A').AsString;
      PageProva.lblRespB25.Text := qryR.FieldByName('RES_B').AsString;
      PageProva.lblRespC25.Text := qryR.FieldByName('RES_C').AsString;
      PageProva.lblRespD25.Text := qryR.FieldByName('RES_D').AsString;


    qryS.SQL.Clear;
    qryS.SQL.Add('UPDATE TAB_PERGUNTAS_SELECT SET COD_RESPOSTA = :COD_RESPOSTA WHERE COD_PERGUNTA = :ID ');
    qryS.ParamByName('COD_RESPOSTA').AsString := resp[25];
    qryS.ParamByName('ID').AsInteger := ID;
    qryS.ExecSQL;

     //---- PERGUNTA 25  ----//


      //---- PERGUNTA 26  ----//

         //VERIFICA SE PERGUNTA J� ESTA ADICIONADA


    reg := 1;
    while reg = 1 do
    begin
      qryP.SQL.Clear;
      qryP.SQL.Add('SELECT * FROM TAB_PERGUNTAS ORDER BY RANDOM() LIMIT 1');
      qryP.Open;

      ID := qryP.FieldByName('ID').AsInteger;

      PageProva.questao[26] := ID;

      img[26] := qryP.FieldByName('img_conf').AsBoolean;

     if img[26] = true then
      begin
        PageProva.imgPergunta26.Visible := true;
        PreencheImagem26(ID, PageProva.imgPergunta26);
      end
      else
      begin
        PageProva.imgPergunta26.Visible := false;

      end;

      qryS.SQL.Clear;
      qryS.SQL.Add('SELECT * FROM TAB_PERGUNTAS_SELECT WHERE COD_PERGUNTA = :COD_PERGUNTA');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.Open;

      if qryS.IsEmpty then
      begin
        reg := 0;
      end;

    end;

      qryS.SQL.Clear;
      qryS.SQL.Add('INSERT INTO TAB_PERGUNTAS_SELECT(COD_PERGUNTA) values(:COD_PERGUNTA) ');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.ExecSQL;

      PageProva.lblPergunta26.Text := qryP.FieldByName('PERGUNTA').AsString;

      qryR.SQL.Clear;
      qryR.SQL.Add('SELECT * FROM RESPOSTAS WHERE ID_PERGUNTA = :ID');
      qryR.ParamByName('ID').AsInteger := ID;
      qryR.Open;


      resp[26] := qryR.FieldByName('RES_CERTA').AsString;
      PageProva.lblRespA26.Text := qryR.FieldByName('RES_A').AsString;
      PageProva.lblRespB26.Text := qryR.FieldByName('RES_B').AsString;
      PageProva.lblRespC26.Text := qryR.FieldByName('RES_C').AsString;
      PageProva.lblRespD26.Text := qryR.FieldByName('RES_D').AsString;


    qryS.SQL.Clear;
    qryS.SQL.Add('UPDATE TAB_PERGUNTAS_SELECT SET COD_RESPOSTA = :COD_RESPOSTA WHERE COD_PERGUNTA = :ID ');
    qryS.ParamByName('COD_RESPOSTA').AsString := resp[26];
    qryS.ParamByName('ID').AsInteger := ID;
    qryS.ExecSQL;

     //---- PERGUNTA 26  ----//


      //---- PERGUNTA 27  ----//

         //VERIFICA SE PERGUNTA J� ESTA ADICIONADA


    reg := 1;
    while reg = 1 do
    begin
      qryP.SQL.Clear;
      qryP.SQL.Add('SELECT * FROM TAB_PERGUNTAS ORDER BY RANDOM() LIMIT 1');
      qryP.Open;

      ID := qryP.FieldByName('ID').AsInteger;

      PageProva.questao[27] := ID;

      img[27] := qryP.FieldByName('img_conf').AsBoolean;

     if img[27] = true then
      begin
        PageProva.imgPergunta27.Visible := true;
        PreencheImagem27(ID, PageProva.imgPergunta27);
      end
      else
      begin
        PageProva.imgPergunta27.Visible := false;

      end;

      qryS.SQL.Clear;
      qryS.SQL.Add('SELECT * FROM TAB_PERGUNTAS_SELECT WHERE COD_PERGUNTA = :COD_PERGUNTA');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.Open;

      if qryS.IsEmpty then
      begin
        reg := 0;
      end;

    end;

      qryS.SQL.Clear;
      qryS.SQL.Add('INSERT INTO TAB_PERGUNTAS_SELECT(COD_PERGUNTA) values(:COD_PERGUNTA) ');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.ExecSQL;

      PageProva.lblPergunta27.Text := qryP.FieldByName('PERGUNTA').AsString;

      qryR.SQL.Clear;
      qryR.SQL.Add('SELECT * FROM RESPOSTAS WHERE ID_PERGUNTA = :ID');
      qryR.ParamByName('ID').AsInteger := ID;
      qryR.Open;


      resp[27] := qryR.FieldByName('RES_CERTA').AsString;
      PageProva.lblRespA27.Text := qryR.FieldByName('RES_A').AsString;
      PageProva.lblRespB27.Text := qryR.FieldByName('RES_B').AsString;
      PageProva.lblRespC27.Text := qryR.FieldByName('RES_C').AsString;
      PageProva.lblRespD27.Text := qryR.FieldByName('RES_D').AsString;


    qryS.SQL.Clear;
    qryS.SQL.Add('UPDATE TAB_PERGUNTAS_SELECT SET COD_RESPOSTA = :COD_RESPOSTA WHERE COD_PERGUNTA = :ID ');
    qryS.ParamByName('COD_RESPOSTA').AsString := resp[27];
    qryS.ParamByName('ID').AsInteger := ID;
    qryS.ExecSQL;

     //---- PERGUNTA 27  ----//


      //---- PERGUNTA 28  ----//

         //VERIFICA SE PERGUNTA J� ESTA ADICIONADA


    reg := 1;
    while reg = 1 do
    begin
      qryP.SQL.Clear;
      qryP.SQL.Add('SELECT * FROM TAB_PERGUNTAS ORDER BY RANDOM() LIMIT 1');
      qryP.Open;

      ID := qryP.FieldByName('ID').AsInteger;

      PageProva.questao[28] := ID;

      img[28] := qryP.FieldByName('img_conf').AsBoolean;

     if img[28] = true then
      begin
        PageProva.imgPergunta28.Visible := true;
        PreencheImagem28(ID, PageProva.imgPergunta28);
      end
      else
      begin
        PageProva.imgPergunta28.Visible := false;

      end;

      qryS.SQL.Clear;
      qryS.SQL.Add('SELECT * FROM TAB_PERGUNTAS_SELECT WHERE COD_PERGUNTA = :COD_PERGUNTA');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.Open;

      if qryS.IsEmpty then
      begin
        reg := 0;
      end;

    end;

      qryS.SQL.Clear;
      qryS.SQL.Add('INSERT INTO TAB_PERGUNTAS_SELECT(COD_PERGUNTA) values(:COD_PERGUNTA) ');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.ExecSQL;

      PageProva.lblPergunta28.Text := qryP.FieldByName('PERGUNTA').AsString;

      qryR.SQL.Clear;
      qryR.SQL.Add('SELECT * FROM RESPOSTAS WHERE ID_PERGUNTA = :ID');
      qryR.ParamByName('ID').AsInteger := ID;
      qryR.Open;


      resp[28] := qryR.FieldByName('RES_CERTA').AsString;
      PageProva.lblRespA28.Text := qryR.FieldByName('RES_A').AsString;
      PageProva.lblRespB28.Text := qryR.FieldByName('RES_B').AsString;
      PageProva.lblRespC28.Text := qryR.FieldByName('RES_C').AsString;
      PageProva.lblRespD28.Text := qryR.FieldByName('RES_D').AsString;


    qryS.SQL.Clear;
    qryS.SQL.Add('UPDATE TAB_PERGUNTAS_SELECT SET COD_RESPOSTA = :COD_RESPOSTA WHERE COD_PERGUNTA = :ID ');
    qryS.ParamByName('COD_RESPOSTA').AsString := resp[28];
    qryS.ParamByName('ID').AsInteger := ID;
    qryS.ExecSQL;

     //---- PERGUNTA 28  ----//


      //---- PERGUNTA 29  ----//

         //VERIFICA SE PERGUNTA J� ESTA ADICIONADA


    reg := 1;
    while reg = 1 do
    begin
      qryP.SQL.Clear;
      qryP.SQL.Add('SELECT * FROM TAB_PERGUNTAS ORDER BY RANDOM() LIMIT 1');
      qryP.Open;

      ID := qryP.FieldByName('ID').AsInteger;

      PageProva.questao[29] := ID;

      img[29] := qryP.FieldByName('img_conf').AsBoolean;

     if img[29] = true then
      begin
        PageProva.imgPergunta29.Visible := true;
        PreencheImagem29(ID, PageProva.imgPergunta29);
      end
      else
      begin
        PageProva.imgPergunta29.Visible := false;

      end;

      qryS.SQL.Clear;
      qryS.SQL.Add('SELECT * FROM TAB_PERGUNTAS_SELECT WHERE COD_PERGUNTA = :COD_PERGUNTA');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.Open;

      if qryS.IsEmpty then
      begin
        reg := 0;
      end;

    end;

      qryS.SQL.Clear;
      qryS.SQL.Add('INSERT INTO TAB_PERGUNTAS_SELECT(COD_PERGUNTA) values(:COD_PERGUNTA) ');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.ExecSQL;

      PageProva.lblPergunta29.Text := qryP.FieldByName('PERGUNTA').AsString;

      qryR.SQL.Clear;
      qryR.SQL.Add('SELECT * FROM RESPOSTAS WHERE ID_PERGUNTA = :ID');
      qryR.ParamByName('ID').AsInteger := ID;
      qryR.Open;


      resp[29] := qryR.FieldByName('RES_CERTA').AsString;
      PageProva.lblRespA29.Text := qryR.FieldByName('RES_A').AsString;
      PageProva.lblRespB29.Text := qryR.FieldByName('RES_B').AsString;
      PageProva.lblRespC29.Text := qryR.FieldByName('RES_C').AsString;
      PageProva.lblRespD29.Text := qryR.FieldByName('RES_D').AsString;


    qryS.SQL.Clear;
    qryS.SQL.Add('UPDATE TAB_PERGUNTAS_SELECT SET COD_RESPOSTA = :COD_RESPOSTA WHERE COD_PERGUNTA = :ID ');
    qryS.ParamByName('COD_RESPOSTA').AsString := resp[29];
    qryS.ParamByName('ID').AsInteger := ID;
    qryS.ExecSQL;

     //---- PERGUNTA 29  ----//


      //---- PERGUNTA 30  ----//

         //VERIFICA SE PERGUNTA J� ESTA ADICIONADA


    reg := 1;
    while reg = 1 do
    begin
      qryP.SQL.Clear;
      qryP.SQL.Add('SELECT * FROM TAB_PERGUNTAS ORDER BY RANDOM() LIMIT 1');
      qryP.Open;

      ID := qryP.FieldByName('ID').AsInteger;

      PageProva.questao[30] := ID;

      img[30] := qryP.FieldByName('img_conf').AsBoolean;

     if img[30] = true then
      begin
        PageProva.imgPergunta30.Visible := true;
        PreencheImagem30(ID, PageProva.imgPergunta30);
      end
      else
      begin
        PageProva.imgPergunta30.Visible := false;

      end;

      qryS.SQL.Clear;
      qryS.SQL.Add('SELECT * FROM TAB_PERGUNTAS_SELECT WHERE COD_PERGUNTA = :COD_PERGUNTA');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.Open;

      if qryS.IsEmpty then
      begin
        reg := 0;
      end;

    end;

      qryS.SQL.Clear;
      qryS.SQL.Add('INSERT INTO TAB_PERGUNTAS_SELECT(COD_PERGUNTA) values(:COD_PERGUNTA) ');
      qryS.ParamByName('COD_PERGUNTA').AsInteger := ID;
      qryS.ExecSQL;

      PageProva.lblPergunta30.Text := qryP.FieldByName('PERGUNTA').AsString;

      qryR.SQL.Clear;
      qryR.SQL.Add('SELECT * FROM RESPOSTAS WHERE ID_PERGUNTA = :ID');
      qryR.ParamByName('ID').AsInteger := ID;
      qryR.Open;


      resp[30] := qryR.FieldByName('RES_CERTA').AsString;
      PageProva.lblRespA30.Text := qryR.FieldByName('RES_A').AsString;
      PageProva.lblRespB30.Text := qryR.FieldByName('RES_B').AsString;
      PageProva.lblRespC30.Text := qryR.FieldByName('RES_C').AsString;
      PageProva.lblRespD30.Text := qryR.FieldByName('RES_D').AsString;


    qryS.SQL.Clear;
    qryS.SQL.Add('UPDATE TAB_PERGUNTAS_SELECT SET COD_RESPOSTA = :COD_RESPOSTA WHERE COD_PERGUNTA = :ID ');
    qryS.ParamByName('COD_RESPOSTA').AsString := resp[30];
    qryS.ParamByName('ID').AsInteger := ID;
    qryS.ExecSQL;

     //---- PERGUNTA 30  ----//


    qryS.SQL.Clear;
    qryS.SQL.Add('DELETE FROM TAB_PERGUNTAS_SELECT');
    qryS.ExecSQL;

  finally

    qryP.DisposeOf;
    qryR.DisposeOf;
    qryS.DisposeOf;
  end;

end;


end.