unit R2DW.Habilitacao.Page.Prova;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts,
  FMX.Memo.Types, FMX.ScrollBox, FMX.Memo, FMX.TabControl, System.Actions,
  FMX.ActnList;

type
  TPageProva = class(TForm)
    Timer: TTimer;
    ActionList1: TActionList;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    TabItem3: TTabItem;
    TabItem4: TTabItem;
    TabItem5: TTabItem;
    TabItem6: TTabItem;
    TabItem7: TTabItem;
    TabItem8: TTabItem;
    TabItem9: TTabItem;
    TabItem10: TTabItem;
    TabItem11: TTabItem;
    TabItem12: TTabItem;
    TabItem13: TTabItem;
    TabItem14: TTabItem;
    TabItem15: TTabItem;
    TabItem16: TTabItem;
    TabItem17: TTabItem;
    TabItem18: TTabItem;
    TabItem19: TTabItem;
    TabItem20: TTabItem;
    TabItem21: TTabItem;
    TabItem22: TTabItem;
    TabItem23: TTabItem;
    TabItem24: TTabItem;
    TabItem25: TTabItem;
    TabItem26: TTabItem;
    TabItem27: TTabItem;
    TabItem28: TTabItem;
    TabItem29: TTabItem;
    TabItem30: TTabItem;
    TabFIM: TTabItem;
    LayPrincipal: TLayout;
    LayA: TLayout;
    Image2: TImage;
    lblRespA1: TLabel;
    LayD: TLayout;
    image5: TImage;
    lblRespD1: TLabel;
    LayC: TLayout;
    Image4: TImage;
    lblRespC1: TLabel;
    LayB: TLayout;
    Image3: TImage;
    lblRespB1: TLabel;
    Laypergunta: TLayout;
    lblPergunta1: TLabel;
    layToop: TLayout;
    LayTop: TLayout;
    Image1: TImage;
    Label1: TLabel;
    Layout1: TLayout;
    lblNQuestao: TLabel;
    lblCronometro: TLabel;
    Layout2: TLayout;
    Layout3: TLayout;
    Image6: TImage;
    lblRespA2: TLabel;
    Layout4: TLayout;
    Image7: TImage;
    lblRespD2: TLabel;
    Layout5: TLayout;
    Image8: TImage;
    lblRespC2: TLabel;
    Layout6: TLayout;
    Image9: TImage;
    lblRespB2: TLabel;
    Layout7: TLayout;
    lblPergunta2: TLabel;
    Act1: TChangeTabAction;
    Act2: TChangeTabAction;
    Act3: TChangeTabAction;
    layBottom: TLayout;
    btnAnterior: TImage;
    btnPosterior1: TImage;
    laybtnCorrigir: TLayout;
    btnCorrigir: TLabel;
    Layout8: TLayout;
    Image10: TImage;
    btnPosterior2: TImage;
    Layout9: TLayout;
    Label2: TLabel;
    Layout16: TLayout;
    Image16: TImage;
    btnPosterior3: TImage;
    Layout17: TLayout;
    Label8: TLabel;
    Layout24: TLayout;
    Image22: TImage;
    btnPosterior4: TImage;
    Layout25: TLayout;
    Label9: TLabel;
    Act4: TChangeTabAction;
    imgPergunta1: TRectangle;
    checkA: TImage;
    checkB: TImage;
    checkC: TImage;
    checkD: TImage;
    checkA2: TImage;
    checkB2: TImage;
    checkC2: TImage;
    checkD2: TImage;
    imgPergunta2: TRectangle;
    Layout10: TLayout;
    Layout11: TLayout;
    Image11: TImage;
    checkA3: TImage;
    lblRespA3: TLabel;
    Layout12: TLayout;
    Image13: TImage;
    checkD3: TImage;
    lblRespD3: TLabel;
    Layout13: TLayout;
    Image15: TImage;
    checkC3: TImage;
    lblRespC3: TLabel;
    Layout14: TLayout;
    Image23: TImage;
    checkB3: TImage;
    lblRespB3: TLabel;
    Layout15: TLayout;
    lblPergunta3: TLabel;
    imgPergunta3: TRectangle;
    Layout18: TLayout;
    Layout19: TLayout;
    Image12: TImage;
    checkA4: TImage;
    lblRespA4: TLabel;
    Layout20: TLayout;
    Image17: TImage;
    checkD4: TImage;
    lblRespD4: TLabel;
    Layout21: TLayout;
    Image19: TImage;
    checkC4: TImage;
    lblRespC4: TLabel;
    Layout22: TLayout;
    Image21: TImage;
    checkB4: TImage;
    lblRespB4: TLabel;
    Layout23: TLayout;
    lblPergunta4: TLabel;
    imgPergunta4: TRectangle;
    Act5: TChangeTabAction;
    Layout26: TLayout;
    Layout27: TLayout;
    Image14: TImage;
    checkA5: TImage;
    lblRespA5: TLabel;
    Layout28: TLayout;
    Image20: TImage;
    checkD5: TImage;
    lblRespD5: TLabel;
    Layout29: TLayout;
    Image25: TImage;
    checkC5: TImage;
    lblRespC5: TLabel;
    Layout30: TLayout;
    Image27: TImage;
    checkB5: TImage;
    lblRespB5: TLabel;
    Layout31: TLayout;
    lblPergunta5: TLabel;
    imgPergunta5: TRectangle;
    Layout32: TLayout;
    Image29: TImage;
    Image30: TImage;
    Layout33: TLayout;
    Label10: TLabel;
    Layout34: TLayout;
    Layout35: TLayout;
    Image18: TImage;
    checkA6: TImage;
    lblRespA6: TLabel;
    Layout36: TLayout;
    Image26: TImage;
    checkD6: TImage;
    lblRespD6: TLabel;
    Layout37: TLayout;
    Imagem32: TImage;
    checkC6: TImage;
    lblRespC6: TLabel;
    Layout38: TLayout;
    Image33: TImage;
    checkB6: TImage;
    lblRespB6: TLabel;
    Layout39: TLayout;
    lblPergunta6: TLabel;
    imgPergunta6: TRectangle;
    Layout40: TLayout;
    Image35: TImage;
    Image36: TImage;
    Layout41: TLayout;
    Label11: TLabel;
    Act6: TChangeTabAction;
    Act7: TChangeTabAction;
    Act8: TChangeTabAction;
    Act9: TChangeTabAction;
    Act10: TChangeTabAction;
    Layout42: TLayout;
    Layout43: TLayout;
    Image24: TImage;
    checkA7: TImage;
    lblRespA7: TLabel;
    Layout44: TLayout;
    Image31: TImage;
    checkD7: TImage;
    lblRespD7: TLabel;
    Layout45: TLayout;
    Image34: TImage;
    checkC7: TImage;
    lblRespC7: TLabel;
    Layout46: TLayout;
    Image38: TImage;
    checkB7: TImage;
    lblRespB7: TLabel;
    Layout47: TLayout;
    lblPergunta7: TLabel;
    imgPergunta7: TRectangle;
    Layout48: TLayout;
    Image40: TImage;
    Image41: TImage;
    Layout49: TLayout;
    Label12: TLabel;
    Layout50: TLayout;
    Layout51: TLayout;
    Image28: TImage;
    checkA8: TImage;
    lblRespA8: TLabel;
    Layout52: TLayout;
    Image37: TImage;
    checkD8: TImage;
    lblRespD8: TLabel;
    Layout53: TLayout;
    Image42: TImage;
    checkC8: TImage;
    lblRespC8: TLabel;
    Layout54: TLayout;
    Image44: TImage;
    checkB8: TImage;
    lblRespB8: TLabel;
    Layout55: TLayout;
    lblPergunta8: TLabel;
    imgPergunta8: TRectangle;
    Layout56: TLayout;
    Image46: TImage;
    Image47: TImage;
    Layout57: TLayout;
    Label13: TLabel;
    Layout58: TLayout;
    Layout59: TLayout;
    Image32: TImage;
    checkA9: TImage;
    lblRespA9: TLabel;
    Layout60: TLayout;
    Image43: TImage;
    checkD9: TImage;
    lblRespD9: TLabel;
    Layout61: TLayout;
    Image48: TImage;
    checkC9: TImage;
    lblRespC9: TLabel;
    Layout62: TLayout;
    Image50: TImage;
    checkB9: TImage;
    lblRespB9: TLabel;
    Layout63: TLayout;
    lblPergunta9: TLabel;
    imgPergunta9: TRectangle;
    Layout64: TLayout;
    Image52: TImage;
    Image53: TImage;
    Layout65: TLayout;
    Label14: TLabel;
    Layout66: TLayout;
    Layout67: TLayout;
    Image39: TImage;
    checkA10: TImage;
    lblRespA10: TLabel;
    Layout68: TLayout;
    Image49: TImage;
    checkD10: TImage;
    lblRespD10: TLabel;
    Layout69: TLayout;
    Image54: TImage;
    checkC10: TImage;
    lblRespC10: TLabel;
    Layout70: TLayout;
    Image56: TImage;
    checkB10: TImage;
    lblRespB10: TLabel;
    Layout71: TLayout;
    lblPergunta10: TLabel;
    imgPergunta10: TRectangle;
    Layout72: TLayout;
    Image58: TImage;
    Image59: TImage;
    Layout73: TLayout;
    Label15: TLabel;
    Act11: TChangeTabAction;
    Act12: TChangeTabAction;
    Act13: TChangeTabAction;
    Act14: TChangeTabAction;
    Act15: TChangeTabAction;
    Act16: TChangeTabAction;
    Act17: TChangeTabAction;
    Act18: TChangeTabAction;
    Act19: TChangeTabAction;
    Act20: TChangeTabAction;
    Act21: TChangeTabAction;
    Act22: TChangeTabAction;
    Act23: TChangeTabAction;
    Act24: TChangeTabAction;
    Act25: TChangeTabAction;
    Act26: TChangeTabAction;
    Act27: TChangeTabAction;
    Act28: TChangeTabAction;
    Act29: TChangeTabAction;
    Act30: TChangeTabAction;
    Layout74: TLayout;
    Layout75: TLayout;
    Image45: TImage;
    checkA11: TImage;
    lblRespA11: TLabel;
    Layout76: TLayout;
    Image55: TImage;
    checkD11: TImage;
    lblRespD11: TLabel;
    Layout77: TLayout;
    Image60: TImage;
    checkC11: TImage;
    lblRespC11: TLabel;
    Layout78: TLayout;
    Image62: TImage;
    checkB11: TImage;
    lblRespB11: TLabel;
    Layout79: TLayout;
    lblPergunta11: TLabel;
    imgPergunta11: TRectangle;
    Layout80: TLayout;
    Image64: TImage;
    Image65: TImage;
    Layout81: TLayout;
    Label16: TLabel;
    Layout82: TLayout;
    Layout83: TLayout;
    Image51: TImage;
    checkA12: TImage;
    lblRespA12: TLabel;
    Layout84: TLayout;
    Image61: TImage;
    checkD12: TImage;
    lblRespD12: TLabel;
    Layout85: TLayout;
    Image66: TImage;
    checkC12: TImage;
    lblRespC12: TLabel;
    Layout86: TLayout;
    Image68: TImage;
    checkB12: TImage;
    lblRespB12: TLabel;
    Layout87: TLayout;
    lblPergunta12: TLabel;
    imgPergunta12: TRectangle;
    Layout88: TLayout;
    Image70: TImage;
    Image71: TImage;
    Layout89: TLayout;
    Label17: TLabel;
    Layout90: TLayout;
    Layout91: TLayout;
    Image57: TImage;
    checkA13: TImage;
    lblRespA13: TLabel;
    Layout92: TLayout;
    Image67: TImage;
    checkD13: TImage;
    lblRespD13: TLabel;
    Layout93: TLayout;
    Image72: TImage;
    checkC13: TImage;
    lblRespC13: TLabel;
    Layout94: TLayout;
    Image74: TImage;
    checkB13: TImage;
    lblRespB13: TLabel;
    Layout95: TLayout;
    lblPergunta13: TLabel;
    imgPergunta13: TRectangle;
    Layout96: TLayout;
    Image76: TImage;
    Image77: TImage;
    Layout97: TLayout;
    Label18: TLabel;
    Layout98: TLayout;
    Layout99: TLayout;
    Image63: TImage;
    checkA14: TImage;
    lblRespA14: TLabel;
    Layout100: TLayout;
    Image73: TImage;
    checkD14: TImage;
    lblRespD14: TLabel;
    Layout101: TLayout;
    Image78: TImage;
    checkC14: TImage;
    lblRespC14: TLabel;
    Layout102: TLayout;
    Image80: TImage;
    checkB14: TImage;
    lblRespB14: TLabel;
    Layout103: TLayout;
    lblPergunta14: TLabel;
    imgPergunta14: TRectangle;
    Layout104: TLayout;
    Image82: TImage;
    Image83: TImage;
    Layout105: TLayout;
    Label19: TLabel;
    Layout106: TLayout;
    Image69: TImage;
    Image75: TImage;
    Layout107: TLayout;
    Label3: TLabel;
    Layout108: TLayout;
    Layout109: TLayout;
    Image79: TImage;
    checkA15: TImage;
    lblRespA15: TLabel;
    Layout110: TLayout;
    Image84: TImage;
    checkD15: TImage;
    lblRespD15: TLabel;
    Layout111: TLayout;
    Image86: TImage;
    checkC15: TImage;
    lblRespC15: TLabel;
    Layout112: TLayout;
    Image88: TImage;
    checkB15: TImage;
    lblRespB15: TLabel;
    Layout113: TLayout;
    lblPergunta15: TLabel;
    imgPergunta15: TRectangle;
    Layout114: TLayout;
    Image90: TImage;
    Image91: TImage;
    Layout115: TLayout;
    Label4: TLabel;
    Layout116: TLayout;
    Layout117: TLayout;
    Image92: TImage;
    checkA16: TImage;
    lblRespA16: TLabel;
    Layout118: TLayout;
    Image94: TImage;
    checkD16: TImage;
    lblRespD16: TLabel;
    Layout119: TLayout;
    Image96: TImage;
    checkC16: TImage;
    lblRespC16: TLabel;
    Layout120: TLayout;
    Image98: TImage;
    checkB16: TImage;
    lblRespB16: TLabel;
    Layout121: TLayout;
    lblPergunta16: TLabel;
    imgPergunta16: TRectangle;
    Layout122: TLayout;
    Image81: TImage;
    Image85: TImage;
    Layout123: TLayout;
    Label5: TLabel;
    Layout124: TLayout;
    Layout125: TLayout;
    Image87: TImage;
    checkA17: TImage;
    lblRespA17: TLabel;
    Layout126: TLayout;
    Image93: TImage;
    checkD17: TImage;
    lblRespD17: TLabel;
    Layout127: TLayout;
    Image97: TImage;
    checkC17: TImage;
    lblRespC17: TLabel;
    Layout128: TLayout;
    Image100: TImage;
    checkB17: TImage;
    lblRespB17: TLabel;
    Layout129: TLayout;
    lblPergunta17: TLabel;
    imgPergunta17: TRectangle;
    Layout130: TLayout;
    Image89: TImage;
    Layout131: TLayout;
    Label6: TLabel;
    Layout132: TLayout;
    Layout133: TLayout;
    Image99: TImage;
    checkA18: TImage;
    lblRespA18: TLabel;
    Layout134: TLayout;
    Image102: TImage;
    checkD18: TImage;
    lblRespD18: TLabel;
    Layout135: TLayout;
    Image104: TImage;
    checkC18: TImage;
    lblRespC18: TLabel;
    Layout136: TLayout;
    Image106: TImage;
    checkB18: TImage;
    lblRespB18: TLabel;
    Layout137: TLayout;
    lblPergunta18: TLabel;
    imgPergunta18: TRectangle;
    Layout138: TLayout;
    Image101: TImage;
    Image103: TImage;
    Layout139: TLayout;
    Label7: TLabel;
    Layout140: TLayout;
    Layout141: TLayout;
    Image105: TImage;
    checkA19: TImage;
    lblRespA19: TLabel;
    Layout142: TLayout;
    Image108: TImage;
    checkD19: TImage;
    lblRespD19: TLabel;
    Layout143: TLayout;
    Image110: TImage;
    checkC19: TImage;
    lblRespC19: TLabel;
    Layout144: TLayout;
    Image112: TImage;
    checkB19: TImage;
    lblRespB19: TLabel;
    Layout145: TLayout;
    lblPergunta19: TLabel;
    imgPergunta19: TRectangle;
    Layout146: TLayout;
    Image107: TImage;
    Image109: TImage;
    Layout147: TLayout;
    Label20: TLabel;
    Layout148: TLayout;
    Layout149: TLayout;
    Image111: TImage;
    checkA20: TImage;
    lblRespA20: TLabel;
    Layout150: TLayout;
    Image114: TImage;
    checkD20: TImage;
    lblRespD20: TLabel;
    Layout151: TLayout;
    Image116: TImage;
    checkC20: TImage;
    lblRespC20: TLabel;
    Layout152: TLayout;
    Image118: TImage;
    checkB20: TImage;
    lblRespB20: TLabel;
    Layout153: TLayout;
    lblPergunta20: TLabel;
    imgPergunta20: TRectangle;
    Layout154: TLayout;
    Image113: TImage;
    Image115: TImage;
    Layout155: TLayout;
    Label21: TLabel;
    Layout156: TLayout;
    Layout157: TLayout;
    Image117: TImage;
    checkA21: TImage;
    lblRespA21: TLabel;
    Layout158: TLayout;
    Image120: TImage;
    checkD21: TImage;
    lblRespD21: TLabel;
    Layout159: TLayout;
    Image122: TImage;
    checkC21: TImage;
    lblRespC21: TLabel;
    Layout160: TLayout;
    Image124: TImage;
    checkB21: TImage;
    lblRespB21: TLabel;
    Layout161: TLayout;
    lblPergunta21: TLabel;
    imgPergunta21: TRectangle;
    Layout162: TLayout;
    Image119: TImage;
    Image121: TImage;
    Layout163: TLayout;
    Label22: TLabel;
    Layout164: TLayout;
    Layout165: TLayout;
    Image123: TImage;
    checkA22: TImage;
    lblRespA22: TLabel;
    Layout166: TLayout;
    Image126: TImage;
    checkD22: TImage;
    lblRespD22: TLabel;
    Layout167: TLayout;
    Image128: TImage;
    checkC22: TImage;
    lblRespC22: TLabel;
    Layout168: TLayout;
    Image130: TImage;
    checkB22: TImage;
    lblRespB22: TLabel;
    Layout169: TLayout;
    lblPergunta22: TLabel;
    imgPergunta22: TRectangle;
    Layout170: TLayout;
    Image125: TImage;
    Image127: TImage;
    Layout171: TLayout;
    Label23: TLabel;
    Layout172: TLayout;
    Layout173: TLayout;
    Image129: TImage;
    checkA23: TImage;
    lblRespA23: TLabel;
    Layout174: TLayout;
    Image132: TImage;
    checkD23: TImage;
    lblRespD23: TLabel;
    Layout175: TLayout;
    Image134: TImage;
    checkC23: TImage;
    lblRespC23: TLabel;
    Layout176: TLayout;
    Image136: TImage;
    checkB23: TImage;
    lblRespB23: TLabel;
    Layout177: TLayout;
    lblPergunta23: TLabel;
    imgPergunta23: TRectangle;
    Layout178: TLayout;
    Image131: TImage;
    Image133: TImage;
    Layout179: TLayout;
    Label24: TLabel;
    Layout180: TLayout;
    Layout181: TLayout;
    Image135: TImage;
    checkA24: TImage;
    lblRespA24: TLabel;
    Layout182: TLayout;
    Image138: TImage;
    checkD24: TImage;
    lblRespD24: TLabel;
    Layout183: TLayout;
    Image140: TImage;
    checkC24: TImage;
    lblRespC24: TLabel;
    Layout184: TLayout;
    Image142: TImage;
    checkB24: TImage;
    lblRespB24: TLabel;
    Layout185: TLayout;
    lblPergunta24: TLabel;
    imgPergunta24: TRectangle;
    Layout186: TLayout;
    Image137: TImage;
    Image139: TImage;
    Layout187: TLayout;
    Label25: TLabel;
    Layout188: TLayout;
    Layout189: TLayout;
    Image141: TImage;
    checkA25: TImage;
    lblRespA25: TLabel;
    Layout190: TLayout;
    Image144: TImage;
    checkD25: TImage;
    lblRespD25: TLabel;
    Layout191: TLayout;
    Image146: TImage;
    checkC25: TImage;
    lblRespC25: TLabel;
    Layout192: TLayout;
    Image148: TImage;
    checkB25: TImage;
    lblRespB25: TLabel;
    Layout193: TLayout;
    lblPergunta25: TLabel;
    imgPergunta25: TRectangle;
    Layout194: TLayout;
    Image143: TImage;
    Image145: TImage;
    Layout195: TLayout;
    Label26: TLabel;
    Layout196: TLayout;
    Layout197: TLayout;
    Image147: TImage;
    checkA26: TImage;
    lblRespA26: TLabel;
    Layout198: TLayout;
    Image150: TImage;
    checkD26: TImage;
    lblRespD26: TLabel;
    Layout199: TLayout;
    Image152: TImage;
    checkC26: TImage;
    lblRespC26: TLabel;
    Layout200: TLayout;
    Image154: TImage;
    checkB26: TImage;
    lblRespB26: TLabel;
    Layout201: TLayout;
    lblPergunta26: TLabel;
    imgPergunta26: TRectangle;
    Layout202: TLayout;
    Image149: TImage;
    Image151: TImage;
    Layout203: TLayout;
    Label27: TLabel;
    Layout204: TLayout;
    Layout205: TLayout;
    Image153: TImage;
    checkA27: TImage;
    lblRespA27: TLabel;
    Layout206: TLayout;
    Image156: TImage;
    checkD27: TImage;
    lblRespD27: TLabel;
    Layout207: TLayout;
    Image158: TImage;
    checkC27: TImage;
    lblRespC27: TLabel;
    Layout208: TLayout;
    Image160: TImage;
    checkB27: TImage;
    lblRespB27: TLabel;
    Layout209: TLayout;
    lblPergunta27: TLabel;
    imgPergunta27: TRectangle;
    Layout210: TLayout;
    Image155: TImage;
    Image157: TImage;
    Layout211: TLayout;
    Label28: TLabel;
    Layout212: TLayout;
    Layout213: TLayout;
    Image159: TImage;
    checkA28: TImage;
    lblRespA28: TLabel;
    Layout214: TLayout;
    Image162: TImage;
    checkD28: TImage;
    lblRespD28: TLabel;
    Layout215: TLayout;
    Image164: TImage;
    checkC28: TImage;
    lblRespC28: TLabel;
    Layout216: TLayout;
    Image166: TImage;
    checkB28: TImage;
    lblRespB28: TLabel;
    Layout217: TLayout;
    lblPergunta28: TLabel;
    imgPergunta28: TRectangle;
    Layout218: TLayout;
    Image161: TImage;
    Image163: TImage;
    Layout219: TLayout;
    Label29: TLabel;
    Layout220: TLayout;
    Layout221: TLayout;
    Image165: TImage;
    checkA29: TImage;
    lblRespA29: TLabel;
    Layout222: TLayout;
    Image168: TImage;
    checkD29: TImage;
    lblRespD29: TLabel;
    Layout223: TLayout;
    Image170: TImage;
    checkC29: TImage;
    lblRespC29: TLabel;
    Layout224: TLayout;
    Image172: TImage;
    checkB29: TImage;
    lblRespB29: TLabel;
    Layout225: TLayout;
    lblPergunta29: TLabel;
    imgPergunta29: TRectangle;
    Layout226: TLayout;
    Image167: TImage;
    Layout227: TLayout;
    Label30: TLabel;
    Layout228: TLayout;
    Layout229: TLayout;
    Image171: TImage;
    checkA30: TImage;
    lblRespA30: TLabel;
    Layout230: TLayout;
    Image174: TImage;
    checkD30: TImage;
    lblRespD30: TLabel;
    Layout231: TLayout;
    Image176: TImage;
    checkC30: TImage;
    lblRespC30: TLabel;
    Layout232: TLayout;
    Image178: TImage;
    checkB30: TImage;
    lblRespB30: TLabel;
    Layout233: TLayout;
    lblPergunta30: TLabel;
    imgPergunta30: TRectangle;
    ActFIM: TChangeTabAction;
    Layout236: TLayout;
    Layout241: TLayout;
    layResultado: TLayout;
    lblAprovado: TLabel;
    Layout234: TLayout;
    lblAcertos: TLabel;
    Layout235: TLayout;
    lblErros: TLabel;
    Image95: TImage;
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    Rectangle3: TRectangle;
    Rectangle4: TRectangle;
    Rectangle5: TRectangle;
    Rectangle6: TRectangle;
    Rectangle7: TRectangle;
    Rectangle8: TRectangle;
    Rectangle9: TRectangle;
    Rectangle10: TRectangle;
    Rectangle11: TRectangle;
    Rectangle12: TRectangle;
    Rectangle13: TRectangle;
    Rectangle14: TRectangle;
    Rectangle15: TRectangle;
    Rectangle16: TRectangle;
    Rectangle17: TRectangle;
    Rectangle18: TRectangle;
    Rectangle19: TRectangle;
    Rectangle20: TRectangle;
    Rectangle21: TRectangle;
    Rectangle22: TRectangle;
    Rectangle23: TRectangle;
    Rectangle24: TRectangle;
    Rectangle25: TRectangle;
    Rectangle26: TRectangle;
    Rectangle27: TRectangle;
    Rectangle28: TRectangle;
    Rectangle29: TRectangle;
    Rectangle30: TRectangle;
    Rectangle31: TRectangle;
    Rectangle32: TRectangle;
    Rectangle33: TRectangle;
    Rectangle34: TRectangle;
    Rectangle35: TRectangle;
    Rectangle36: TRectangle;
    Rectangle37: TRectangle;
    Rectangle38: TRectangle;
    Rectangle39: TRectangle;
    Rectangle40: TRectangle;
    Rectangle41: TRectangle;
    Rectangle42: TRectangle;
    Rectangle43: TRectangle;
    Rectangle44: TRectangle;
    Rectangle45: TRectangle;
    Rectangle46: TRectangle;
    Rectangle47: TRectangle;
    Rectangle48: TRectangle;
    Rectangle49: TRectangle;
    Rectangle50: TRectangle;
    Rectangle51: TRectangle;
    Rectangle52: TRectangle;
    Rectangle53: TRectangle;
    Rectangle54: TRectangle;
    Rectangle55: TRectangle;
    Rectangle56: TRectangle;
    Rectangle57: TRectangle;
    Rectangle58: TRectangle;
    Rectangle59: TRectangle;
    Rectangle60: TRectangle;
    Rectangle61: TRectangle;
    Rectangle62: TRectangle;
    Rectangle63: TRectangle;
    Rectangle64: TRectangle;
    Rectangle65: TRectangle;
    Rectangle66: TRectangle;
    Rectangle67: TRectangle;
    Rectangle68: TRectangle;
    Rectangle69: TRectangle;
    Rectangle70: TRectangle;
    Rectangle71: TRectangle;
    Rectangle72: TRectangle;
    Rectangle73: TRectangle;
    Rectangle74: TRectangle;
    Rectangle75: TRectangle;
    Rectangle76: TRectangle;
    Rectangle77: TRectangle;
    Rectangle78: TRectangle;
    Rectangle79: TRectangle;
    Rectangle80: TRectangle;
    Rectangle81: TRectangle;
    Rectangle82: TRectangle;
    Rectangle83: TRectangle;
    Rectangle84: TRectangle;
    Rectangle85: TRectangle;
    Rectangle86: TRectangle;
    Rectangle87: TRectangle;
    Rectangle88: TRectangle;
    Rectangle89: TRectangle;
    Rectangle90: TRectangle;
    Rectangle91: TRectangle;
    Rectangle92: TRectangle;
    Rectangle93: TRectangle;
    Rectangle94: TRectangle;
    Rectangle95: TRectangle;
    Rectangle96: TRectangle;
    Rectangle97: TRectangle;
    Rectangle98: TRectangle;
    Rectangle99: TRectangle;
    Rectangle100: TRectangle;
    Rectangle101: TRectangle;
    Rectangle102: TRectangle;
    Rectangle103: TRectangle;
    Rectangle104: TRectangle;
    Rectangle105: TRectangle;
    Rectangle106: TRectangle;
    Rectangle107: TRectangle;
    Rectangle108: TRectangle;
    Rectangle109: TRectangle;
    Rectangle110: TRectangle;
    Rectangle111: TRectangle;
    Rectangle112: TRectangle;
    Rectangle113: TRectangle;
    Rectangle114: TRectangle;
    Rectangle115: TRectangle;
    Rectangle116: TRectangle;
    Rectangle117: TRectangle;
    Rectangle118: TRectangle;
    Rectangle119: TRectangle;
    Rectangle120: TRectangle;
    Rectangle121: TRectangle;
    Rectangle122: TRectangle;
    Rectangle123: TRectangle;
    Rectangle124: TRectangle;
    Rectangle125: TRectangle;
    Rectangle126: TRectangle;
    Rectangle127: TRectangle;
    Rectangle128: TRectangle;
    Rectangle129: TRectangle;
    Rectangle130: TRectangle;
    Rectangle131: TRectangle;
    Rectangle132: TRectangle;
    Rectangle133: TRectangle;
    Rectangle134: TRectangle;
    Rectangle135: TRectangle;
    Rectangle136: TRectangle;
    Rectangle137: TRectangle;
    Rectangle138: TRectangle;
    Rectangle139: TRectangle;
    Rectangle140: TRectangle;
    Rectangle141: TRectangle;
    Rectangle142: TRectangle;
    Rectangle143: TRectangle;
    Rectangle144: TRectangle;
    Rectangle145: TRectangle;
    Rectangle146: TRectangle;
    Rectangle147: TRectangle;
    Rectangle148: TRectangle;
    Rectangle149: TRectangle;
    Rectangle150: TRectangle;
    Rectangle151: TRectangle;
    Rectangle152: TRectangle;
    LayImg1: TLayout;
    procedure FormShow(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure btnPosterior1Click(Sender: TObject);
    procedure btnPosterior2Click(Sender: TObject);
    procedure btnPosterior3Click(Sender: TObject);
    procedure Image16Click(Sender: TObject);
    procedure Image10Click(Sender: TObject);
    procedure lblRespA1Click(Sender: TObject);
    procedure lblRespB1Click(Sender: TObject);
    procedure lblRespC1Click(Sender: TObject);
    procedure lblRespD1Click(Sender: TObject);
    procedure lblRespA2Click(Sender: TObject);
    procedure lblRespB2Click(Sender: TObject);
    procedure lblRespC2Click(Sender: TObject);
    procedure lblRespD2Click(Sender: TObject);
    procedure lblRespD4Click(Sender: TObject);
    procedure lblRespA4Click(Sender: TObject);
    procedure lblRespB4Click(Sender: TObject);
    procedure lblRespC4Click(Sender: TObject);
    procedure lblRespA3Click(Sender: TObject);
    procedure lblRespB3Click(Sender: TObject);
    procedure lblRespC3Click(Sender: TObject);
    procedure lblRespD3Click(Sender: TObject);
    procedure Image22Click(Sender: TObject);
    procedure btnPosterior4Click(Sender: TObject);
    procedure Image29Click(Sender: TObject);
    procedure lblRespD5Click(Sender: TObject);
    procedure lblRespA5Click(Sender: TObject);
    procedure lblRespB5Click(Sender: TObject);
    procedure lblRespC5Click(Sender: TObject);
    procedure Image35Click(Sender: TObject);
    procedure Image36Click(Sender: TObject);
    procedure lblRespA6Click(Sender: TObject);
    procedure lblRespB6Click(Sender: TObject);
    procedure lblRespC6Click(Sender: TObject);
    procedure lblRespD6Click(Sender: TObject);
    procedure Image40Click(Sender: TObject);
    procedure Image41Click(Sender: TObject);
    procedure Image30Click(Sender: TObject);
    procedure lblRespA7Click(Sender: TObject);
    procedure lblRespB7Click(Sender: TObject);
    procedure lblRespC7Click(Sender: TObject);
    procedure lblRespD7Click(Sender: TObject);
    procedure Image47Click(Sender: TObject);
    procedure Image46Click(Sender: TObject);
    procedure lblRespA8Click(Sender: TObject);
    procedure lblRespB8Click(Sender: TObject);
    procedure lblRespC8Click(Sender: TObject);
    procedure lblRespD8Click(Sender: TObject);
    procedure Image53Click(Sender: TObject);
    procedure Image52Click(Sender: TObject);
    procedure lblRespA9Click(Sender: TObject);
    procedure lblRespB9Click(Sender: TObject);
    procedure lblRespC9Click(Sender: TObject);
    procedure lblRespD9Click(Sender: TObject);
    procedure Image59Click(Sender: TObject);
    procedure Image58Click(Sender: TObject);
    procedure lblRespA10Click(Sender: TObject);
    procedure lblRespB10Click(Sender: TObject);
    procedure lblRespC10Click(Sender: TObject);
    procedure lblRespD10Click(Sender: TObject);
    procedure Image65Click(Sender: TObject);
    procedure Image64Click(Sender: TObject);
    procedure lblRespA11Click(Sender: TObject);
    procedure lblRespB11Click(Sender: TObject);
    procedure lblRespC11Click(Sender: TObject);
    procedure lblRespD11Click(Sender: TObject);
    procedure Image71Click(Sender: TObject);
    procedure Image70Click(Sender: TObject);
    procedure lblRespA12Click(Sender: TObject);
    procedure lblRespB12Click(Sender: TObject);
    procedure lblRespC12Click(Sender: TObject);
    procedure lblRespD12Click(Sender: TObject);
    procedure Image77Click(Sender: TObject);
    procedure Image76Click(Sender: TObject);
    procedure lblRespA13Click(Sender: TObject);
    procedure lblRespB13Click(Sender: TObject);
    procedure lblRespC13Click(Sender: TObject);
    procedure lblRespD13Click(Sender: TObject);
    procedure Image83Click(Sender: TObject);
    procedure Image82Click(Sender: TObject);
    procedure lblRespA14Click(Sender: TObject);
    procedure lblRespB14Click(Sender: TObject);
    procedure lblRespC14Click(Sender: TObject);
    procedure lblRespD14Click(Sender: TObject);
    procedure Image75Click(Sender: TObject);
    procedure Image69Click(Sender: TObject);
    procedure lblRespA15Click(Sender: TObject);
    procedure lblRespB15Click(Sender: TObject);
    procedure lblRespC15Click(Sender: TObject);
    procedure lblRespD15Click(Sender: TObject);
    procedure Image91Click(Sender: TObject);
    procedure Image90Click(Sender: TObject);
    procedure lblRespA16Click(Sender: TObject);
    procedure lblRespB16Click(Sender: TObject);
    procedure lblRespC16Click(Sender: TObject);
    procedure lblRespD16Click(Sender: TObject);
    procedure Image85Click(Sender: TObject);
    procedure Image81Click(Sender: TObject);
    procedure lblRespA17Click(Sender: TObject);
    procedure lblRespB17Click(Sender: TObject);
    procedure lblRespC17Click(Sender: TObject);
    procedure lblRespD17Click(Sender: TObject);
    procedure Image95Click(Sender: TObject);
    procedure Image89Click(Sender: TObject);
    procedure lblRespA18Click(Sender: TObject);
    procedure lblRespB18Click(Sender: TObject);
    procedure lblRespC18Click(Sender: TObject);
    procedure lblRespD18Click(Sender: TObject);
    procedure Image103Click(Sender: TObject);
    procedure Image101Click(Sender: TObject);
    procedure lblRespA19Click(Sender: TObject);
    procedure lblRespB19Click(Sender: TObject);
    procedure lblRespC19Click(Sender: TObject);
    procedure lblRespD19Click(Sender: TObject);
    procedure Image109Click(Sender: TObject);
    procedure Image107Click(Sender: TObject);
    procedure lblRespA20Click(Sender: TObject);
    procedure lblRespC20Click(Sender: TObject);
    procedure lblRespD20Click(Sender: TObject);
    procedure lblRespB20Click(Sender: TObject);
    procedure btnCorrigirClick(Sender: TObject);
    procedure Image115Click(Sender: TObject);
    procedure Image113Click(Sender: TObject);
    procedure lblRespA21Click(Sender: TObject);
    procedure lblRespB21Click(Sender: TObject);
    procedure lblRespC21Click(Sender: TObject);
    procedure lblRespD21Click(Sender: TObject);
    procedure Image121Click(Sender: TObject);
    procedure Image119Click(Sender: TObject);
    procedure lblRespA22Click(Sender: TObject);
    procedure lblRespB22Click(Sender: TObject);
    procedure lblRespC22Click(Sender: TObject);
    procedure lblRespD22Click(Sender: TObject);
    procedure Image127Click(Sender: TObject);
    procedure Image125Click(Sender: TObject);
    procedure lblRespA23Click(Sender: TObject);
    procedure lblRespB23Click(Sender: TObject);
    procedure lblRespC23Click(Sender: TObject);
    procedure lblRespD23Click(Sender: TObject);
    procedure Image133Click(Sender: TObject);
    procedure Image131Click(Sender: TObject);
    procedure lblRespA24Click(Sender: TObject);
    procedure lblRespB24Click(Sender: TObject);
    procedure lblRespC24Click(Sender: TObject);
    procedure lblRespD24Click(Sender: TObject);
    procedure Image139Click(Sender: TObject);
    procedure Image137Click(Sender: TObject);
    procedure lblRespA25Click(Sender: TObject);
    procedure lblRespB25Click(Sender: TObject);
    procedure lblRespC25Click(Sender: TObject);
    procedure lblRespD25Click(Sender: TObject);
    procedure Image145Click(Sender: TObject);
    procedure Image143Click(Sender: TObject);
    procedure lblRespA26Click(Sender: TObject);
    procedure lblRespB26Click(Sender: TObject);
    procedure lblRespC26Click(Sender: TObject);
    procedure lblRespD26Click(Sender: TObject);
    procedure Image151Click(Sender: TObject);
    procedure Image149Click(Sender: TObject);
    procedure lblRespA27Click(Sender: TObject);
    procedure lblRespB27Click(Sender: TObject);
    procedure lblRespC27Click(Sender: TObject);
    procedure lblRespD27Click(Sender: TObject);
    procedure Image157Click(Sender: TObject);
    procedure Image155Click(Sender: TObject);
    procedure lblRespA28Click(Sender: TObject);
    procedure lblRespB28Click(Sender: TObject);
    procedure lblRespC28Click(Sender: TObject);
    procedure lblRespD28Click(Sender: TObject);
    procedure Image163Click(Sender: TObject);
    procedure Image161Click(Sender: TObject);
    procedure lblRespA29Click(Sender: TObject);
    procedure lblRespB29Click(Sender: TObject);
    procedure lblRespC29Click(Sender: TObject);
    procedure lblRespD29Click(Sender: TObject);
    procedure Image169Click(Sender: TObject);
    procedure Image167Click(Sender: TObject);
    procedure lblRespA30Click(Sender: TObject);
    procedure lblRespB30Click(Sender: TObject);
    procedure lblRespC30Click(Sender: TObject);
    procedure lblRespD30Click(Sender: TObject);
    procedure Label30Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Label8Click(Sender: TObject);
    procedure Label9Click(Sender: TObject);
    procedure Label10Click(Sender: TObject);
    procedure Label11Click(Sender: TObject);
    procedure Label12Click(Sender: TObject);
    procedure Label13Click(Sender: TObject);
    procedure Label14Click(Sender: TObject);
    procedure Label15Click(Sender: TObject);
    procedure Label16Click(Sender: TObject);
    procedure Label17Click(Sender: TObject);
    procedure Label18Click(Sender: TObject);
    procedure Label19Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure Label6Click(Sender: TObject);
    procedure Label7Click(Sender: TObject);
    procedure Label20Click(Sender: TObject);
    procedure Label21Click(Sender: TObject);
    procedure Label22Click(Sender: TObject);
    procedure Label23Click(Sender: TObject);
    procedure Label24Click(Sender: TObject);
    procedure Label25Click(Sender: TObject);
    procedure Label26Click(Sender: TObject);
    procedure Label27Click(Sender: TObject);
    procedure Label28Click(Sender: TObject);
    procedure Label29Click(Sender: TObject);
  private
  var_horafinal : TTime;
    procedure Finalizar;

    { Private declarations }
  public
    questao: array[1..30] of Integer;
    resposta: array[1..30] of String;
    PROVA: array of String;
    RESP_CORRETA : String;
    ID_PERGUNTA  : String;
    ComErros : Boolean;
    procedure mostraID(id: Integer; desc : String);
    { Public declarations }
  end;

var
  PageProva: TPageProva;

implementation

{$R *.fmx}

uses R2DW.HABILITACAO.MODEL;


procedure TPageProva.Image1Click(Sender: TObject);
begin
CLose;
DataModule1.CheckFalse;
end;



procedure TPageProva.FormShow(Sender: TObject);
begin
var_horafinal := Time() + StrToTime('01:00');
lblPergunta1.AutoSize := true;

end;

procedure TPageProva.Finalizar;
begin
   if ComErros = false then
   begin
    DataModule1.Corrigir;
    ActFIM.Execute;
    lblNQuestao.Text := 'Resultado';
    lblCronometro.Visible := false;

   end
   else
   begin
    DataModule1.CorrigirComErradas;
    ActFIM.Execute;
    lblNQuestao.Text := 'Resultado';
    lblCronometro.Visible := false;

   end;


end;


procedure TPageProva.btnCorrigirClick(Sender: TObject);
begin
Finalizar;
end;

procedure TPageProva.btnPosterior1Click(Sender: TObject);
begin
Act2.Execute;
lblNQuestao.Text := 'Quest�o: 2 de 30';
end;

procedure TPageProva.btnPosterior2Click(Sender: TObject);
begin
Act3.Execute;
lblNQuestao.Text := 'Quest�o: 3 de 30';
end;

procedure TPageProva.btnPosterior3Click(Sender: TObject);
begin
Act4.Execute;
lblNQuestao.Text := 'Quest�o: 4 de 30';

end;

procedure TPageProva.Image101Click(Sender: TObject);
begin
Act18.Execute;
lblNQuestao.Text := 'Quest�o: 18 de 30';
end;

procedure TPageProva.Image103Click(Sender: TObject);
begin
Act20.Execute;
lblNQuestao.Text := 'Quest�o: 20 de 30';
end;

procedure TPageProva.Image107Click(Sender: TObject);
begin
Act19.Execute;
lblNQuestao.Text := 'Quest�o: 19 de 30';
end;

procedure TPageProva.Image109Click(Sender: TObject);
begin
Act21.Execute;
lblNQuestao.Text := 'Quest�o: 21 de 30';
end;

procedure TPageProva.Image10Click(Sender: TObject);
begin
Act1.Execute;
lblNQuestao.Text := 'Quest�o: 1 de 30';
end;

procedure TPageProva.Image113Click(Sender: TObject);
begin
Act20.Execute;
lblNQuestao.Text := 'Quest�o: 20 de 30';
end;

procedure TPageProva.Image115Click(Sender: TObject);
begin
Act22.Execute;
lblNQuestao.Text := 'Quest�o: 22 de 30';
end;

procedure TPageProva.Image119Click(Sender: TObject);
begin
Act21.Execute;
lblNQuestao.Text := 'Quest�o: 21 de 30';
end;

procedure TPageProva.Image121Click(Sender: TObject);
begin
Act23.Execute;
lblNQuestao.Text := 'Quest�o: 23 de 30';
end;

procedure TPageProva.Image125Click(Sender: TObject);
begin
Act22.Execute;
lblNQuestao.Text := 'Quest�o: 22 de 30';
end;

procedure TPageProva.Image127Click(Sender: TObject);
begin
Act24.Execute;
lblNQuestao.Text := 'Quest�o: 24 de 30';
end;

procedure TPageProva.Image131Click(Sender: TObject);
begin
Act23.Execute;
lblNQuestao.Text := 'Quest�o: 23 de 30';
end;

procedure TPageProva.Image133Click(Sender: TObject);
begin
Act25.Execute;
lblNQuestao.Text := 'Quest�o: 25 de 30';
end;

procedure TPageProva.Image137Click(Sender: TObject);
begin
Act24.Execute;
lblNQuestao.Text := 'Quest�o: 24 de 30';
end;

procedure TPageProva.Image139Click(Sender: TObject);
begin
Act26.Execute;
lblNQuestao.Text := 'Quest�o: 26 de 30';
end;

procedure TPageProva.Image143Click(Sender: TObject);
begin
Act25.Execute;
lblNQuestao.Text := 'Quest�o: 25 de 30';
end;

procedure TPageProva.Image145Click(Sender: TObject);
begin
Act27.Execute;
lblNQuestao.Text := 'Quest�o: 27 de 30';
end;

procedure TPageProva.Image149Click(Sender: TObject);
begin
Act26.Execute;
lblNQuestao.Text := 'Quest�o: 26 de 30';
end;

procedure TPageProva.Image151Click(Sender: TObject);
begin
Act28.Execute;
lblNQuestao.Text := 'Quest�o: 28 de 30';
end;

procedure TPageProva.Image155Click(Sender: TObject);
begin
Act27.Execute;
lblNQuestao.Text := 'Quest�o: 27 de 30';
end;

procedure TPageProva.Image157Click(Sender: TObject);
begin
Act29.Execute;
lblNQuestao.Text := 'Quest�o: 29 de 30';
end;

procedure TPageProva.Image161Click(Sender: TObject);
begin
Act28.Execute;
lblNQuestao.Text := 'Quest�o: 28 de 30';
end;

procedure TPageProva.Image163Click(Sender: TObject);
begin
Act30.Execute;
lblNQuestao.Text := 'Quest�o: 30 de 30';
end;

procedure TPageProva.Image167Click(Sender: TObject);
begin
 Act29.Execute;
lblNQuestao.Text := 'Quest�o: 29 de 30';
end;

procedure TPageProva.Image169Click(Sender: TObject);
begin
ActFIM.Execute;
lblNQuestao.Text := 'Quest�o: 30 de 30';
end;

procedure TPageProva.Image16Click(Sender: TObject);
begin
Act2.Execute;
lblNQuestao.Text := 'Quest�o: 2 de 30';
end;

procedure TPageProva.Image22Click(Sender: TObject);
begin
Act3.Execute;
lblNQuestao.Text := 'Quest�o: 3 de 30';
end;

procedure TPageProva.Image29Click(Sender: TObject);
begin
Act4.Execute;
lblNQuestao.Text := 'Quest�o: 4 de 30';
end;

procedure TPageProva.Image30Click(Sender: TObject);
begin
Act6.Execute;
lblNQuestao.Text := 'Quest�o: 6 de 30';
end;

procedure TPageProva.Image35Click(Sender: TObject);
begin
Act5.Execute;
lblNQuestao.Text := 'Quest�o: 5 de 30';
end;

procedure TPageProva.Image36Click(Sender: TObject);
begin
Act7.Execute;
lblNQuestao.Text := 'Quest�o: 7 de 30';
end;

procedure TPageProva.Image40Click(Sender: TObject);
begin
Act6.Execute;
lblNQuestao.Text := 'Quest�o: 6 de 30';
end;

procedure TPageProva.Image41Click(Sender: TObject);
begin
Act8.Execute;
lblNQuestao.Text := 'Quest�o: 8 de 30';
end;

procedure TPageProva.Image46Click(Sender: TObject);
begin
Act7.Execute;
lblNQuestao.Text := 'Quest�o: 7 de 30';
end;

procedure TPageProva.Image47Click(Sender: TObject);
begin
Act9.Execute;
lblNQuestao.Text := 'Quest�o: 9 de 30';
end;

procedure TPageProva.Image52Click(Sender: TObject);
begin
Act8.Execute;
lblNQuestao.Text := 'Quest�o: 8 de 30';
end;

procedure TPageProva.Image53Click(Sender: TObject);
begin
Act10.Execute;
lblNQuestao.Text := 'Quest�o: 10 de 30';
end;

procedure TPageProva.Image58Click(Sender: TObject);
begin
Act9.Execute;
lblNQuestao.Text := 'Quest�o: 9 de 30';
end;

procedure TPageProva.Image59Click(Sender: TObject);
begin
Act11.Execute;
lblNQuestao.Text := 'Quest�o: 11 de 30';
end;

procedure TPageProva.Image64Click(Sender: TObject);
begin
Act10.Execute;
lblNQuestao.Text := 'Quest�o: 10 de 30';
end;

procedure TPageProva.Image65Click(Sender: TObject);
begin
Act12.Execute;
lblNQuestao.Text := 'Quest�o: 12 de 30';
end;

procedure TPageProva.Image69Click(Sender: TObject);
begin
Act14.Execute;
lblNQuestao.Text := 'Quest�o: 14 de 30';
end;

procedure TPageProva.Image70Click(Sender: TObject);
begin
Act11.Execute;
lblNQuestao.Text := 'Quest�o: 11 de 30';
end;

procedure TPageProva.Image71Click(Sender: TObject);
begin
Act13.Execute;
lblNQuestao.Text := 'Quest�o: 13 de 30';
end;

procedure TPageProva.Image75Click(Sender: TObject);
begin
Act16.Execute;
lblNQuestao.Text := 'Quest�o: 16 de 30';
end;

procedure TPageProva.Image76Click(Sender: TObject);
begin
Act12.Execute;
lblNQuestao.Text := 'Quest�o: 12 de 30';
end;

procedure TPageProva.Image77Click(Sender: TObject);
begin
Act14.Execute;
lblNQuestao.Text := 'Quest�o: 14 de 30';
end;

procedure TPageProva.Image81Click(Sender: TObject);
begin
Act16.Execute;
lblNQuestao.Text := 'Quest�o: 16 de 30';
end;

procedure TPageProva.Image82Click(Sender: TObject);
begin
Act13.Execute;
lblNQuestao.Text := 'Quest�o: 13 de 30';
end;

procedure TPageProva.Image83Click(Sender: TObject);
begin
Act15.Execute;
lblNQuestao.Text := 'Quest�o: 15 de 30';
end;

procedure TPageProva.Image85Click(Sender: TObject);
begin
Act18.Execute;
lblNQuestao.Text := 'Quest�o: 18 de 30';
end;

procedure TPageProva.Image89Click(Sender: TObject);
begin
Act17.Execute;
lblNQuestao.Text := 'Quest�o: 17 de 30';
end;

procedure TPageProva.Image90Click(Sender: TObject);
begin
Act15.Execute;
lblNQuestao.Text := 'Quest�o: 15 de 30';
end;

procedure TPageProva.Image91Click(Sender: TObject);
begin
Act17.Execute;
lblNQuestao.Text := 'Quest�o: 17 de 30';
end;

procedure TPageProva.Image95Click(Sender: TObject);
begin
Act19.Execute;
lblNQuestao.Text := 'Quest�o: 19 de 30';
end;

procedure TPageProva.Label10Click(Sender: TObject);
begin
Finalizar;
end;

procedure TPageProva.Label11Click(Sender: TObject);
begin
Finalizar;
end;

procedure TPageProva.Label12Click(Sender: TObject);
begin
Finalizar;
end;

procedure TPageProva.Label13Click(Sender: TObject);
begin
Finalizar;
end;

procedure TPageProva.Label14Click(Sender: TObject);
begin
Finalizar;
end;

procedure TPageProva.Label15Click(Sender: TObject);
begin
Finalizar;
end;

procedure TPageProva.Label16Click(Sender: TObject);
begin
Finalizar;
end;

procedure TPageProva.Label17Click(Sender: TObject);
begin
Finalizar;
end;

procedure TPageProva.Label18Click(Sender: TObject);
begin
Finalizar;
end;

procedure TPageProva.Label19Click(Sender: TObject);
begin
Finalizar;
end;

procedure TPageProva.Label20Click(Sender: TObject);
begin
Finalizar;
end;

procedure TPageProva.Label21Click(Sender: TObject);
begin
Finalizar;
end;

procedure TPageProva.Label22Click(Sender: TObject);
begin
Finalizar;
end;

procedure TPageProva.Label23Click(Sender: TObject);
begin
Finalizar;
end;

procedure TPageProva.Label24Click(Sender: TObject);
begin
Finalizar;
end;

procedure TPageProva.Label25Click(Sender: TObject);
begin
Finalizar;
end;

procedure TPageProva.Label26Click(Sender: TObject);
begin
Finalizar;
end;

procedure TPageProva.Label27Click(Sender: TObject);
begin
Finalizar;
end;

procedure TPageProva.Label28Click(Sender: TObject);
begin
Finalizar;
end;

procedure TPageProva.Label29Click(Sender: TObject);
begin
Finalizar;
end;

procedure TPageProva.Label2Click(Sender: TObject);
begin
Finalizar;
end;

procedure TPageProva.Label30Click(Sender: TObject);
begin
Finalizar;
end;

procedure TPageProva.Label3Click(Sender: TObject);
begin
Finalizar;
end;

procedure TPageProva.Label4Click(Sender: TObject);
begin
Finalizar;
end;

procedure TPageProva.Label5Click(Sender: TObject);
begin
Finalizar;
end;

procedure TPageProva.Label6Click(Sender: TObject);
begin
Finalizar;
end;

procedure TPageProva.Label7Click(Sender: TObject);
begin
Finalizar;
end;

procedure TPageProva.Label8Click(Sender: TObject);
begin
Finalizar;
end;

procedure TPageProva.Label9Click(Sender: TObject);
begin
 Finalizar;
end;

procedure TPageProva.btnPosterior4Click(Sender: TObject);
begin
Act5.Execute;
lblNQuestao.Text := 'Quest�o: 5 de 30';
end;

//CHECK PERGUNTA 1 //

procedure TPageProva.lblRespA1Click(Sender: TObject);
begin

  resposta[1] := 'A';
  checkA.Visible := true;
  checkB.Visible := false;
  checkC.Visible := false;
  checkD.Visible := false;
end;


procedure TPageProva.lblRespB1Click(Sender: TObject);
begin

  resposta[1]  := 'B';
  checkA.Visible := false;
  checkB.Visible := true;
  checkC.Visible := false;
  checkD.Visible := false;
end;


procedure TPageProva.lblRespC1Click(Sender: TObject);
begin

  resposta[1]  := 'C';
  checkA.Visible := false;
  checkB.Visible := false;
  checkC.Visible := true;
  checkD.Visible := false;
end;


procedure TPageProva.lblRespD1Click(Sender: TObject);
begin

  resposta[1]  := 'D';
  checkA.Visible := false;
  checkB.Visible := false;
  checkC.Visible := false;
  checkD.Visible := true;
end;


//**CHECK PERGUNTA 1 **//

//CHECK PERGUNTA 2 //


procedure TPageProva.lblRespA2Click(Sender: TObject);
begin
  resposta[2]  := 'A';
  checkA2.Visible := true;
  checkB2.Visible := false;
  checkC2.Visible := false;
  checkD2.Visible := false;
end;


procedure TPageProva.lblRespB2Click(Sender: TObject);
begin

  resposta[2] := 'B';
  checkA2.Visible := false;
  checkB2.Visible := true;
  checkC2.Visible := false;
  checkD2.Visible := false;
end;


procedure TPageProva.lblRespC2Click(Sender: TObject);
begin

  resposta[2] := 'C';
  checkA2.Visible := false;
  checkB2.Visible := false;
  checkC2.Visible := true;
  checkD2.Visible := false;
end;


procedure TPageProva.lblRespD2Click(Sender: TObject);
begin

  resposta[2] := 'D';
  checkA2.Visible := false;
  checkB2.Visible := false;
  checkC2.Visible := false;
  checkD2.Visible := true;
end;


//**CHECK PERGUNTA 2 **//

//CHECK PERGUNTA 3 //

procedure TPageProva.lblRespA3Click(Sender: TObject);
begin
  resposta[3] := 'A';
  checkA3.Visible := true;
  checkB3.Visible := false;
  checkC3.Visible := false;
  checkD3.Visible := false;
end;



procedure TPageProva.lblRespB3Click(Sender: TObject);
begin

  resposta[3] := 'B';
  checkA3.Visible := false;
  checkB3.Visible := true;
  checkC3.Visible := false;
  checkD3.Visible := false;
end;


procedure TPageProva.lblRespC3Click(Sender: TObject);
begin

  resposta[3] := 'C';
  checkA3.Visible := false;
  checkB3.Visible := false;
  checkC3.Visible := true;
  checkD3.Visible := false;

end;



procedure TPageProva.lblRespD3Click(Sender: TObject);
begin

  resposta[3] := 'D';
  checkA3.Visible := false;
  checkB3.Visible := false;
  checkC3.Visible := false;
  checkD3.Visible := true;
end;


//**CHECK PERGUNTA 3 **//


//CHECK PERGUNTA 4 //
procedure TPageProva.lblRespA4Click(Sender: TObject);
begin
  resposta[4] := 'A';
  checkA4.Visible := true;
  checkB4.Visible := false;
  checkC4.Visible := false;
  checkD4.Visible := false;
end;


procedure TPageProva.lblRespB4Click(Sender: TObject);
begin

  resposta[4] := 'B';
  checkA4.Visible := false;
  checkB4.Visible := true;
  checkC4.Visible := false;
  checkD4.Visible := false;
end;



procedure TPageProva.lblRespC4Click(Sender: TObject);
begin

  resposta[4] := 'C';
  checkA4.Visible := false;
  checkB4.Visible := false;
  checkC4.Visible := true;
  checkD4.Visible := false;
end;


procedure TPageProva.lblRespD4Click(Sender: TObject);
begin

  resposta[4] := 'D';
  checkA4.Visible := false;
  checkB4.Visible := false;
  checkC4.Visible := false;
  checkD4.Visible := true;
end;



//**CHECK PERGUNTA 4 **//

//CHECK PERGUNTA 5 //

procedure TPageProva.lblRespA5Click(Sender: TObject);
begin
  resposta[5] := 'A';
  checkA5.Visible := true;
  checkB5.Visible := false;
  checkC5.Visible := false;
  checkD5.Visible := false;
end;


procedure TPageProva.lblRespB5Click(Sender: TObject);
begin

  resposta[5] := 'B';
  checkA5.Visible := false;
  checkB5.Visible := true;
  checkC5.Visible := false;
  checkD5.Visible := false;
end;


procedure TPageProva.lblRespC5Click(Sender: TObject);
begin

  resposta[5] := 'C';
  checkA5.Visible := false;
  checkB5.Visible := false;
  checkC5.Visible := true;
  checkD5.Visible := false;
end;

procedure TPageProva.lblRespD5Click(Sender: TObject);
begin

  resposta[5] := 'D';
  checkA5.Visible := false;
  checkB5.Visible := false;
  checkC5.Visible := false;
  checkD5.Visible := true;
end;


//**CHECK PERGUNTA 5 **//

//CHECK PERGUNTA 6 //

procedure TPageProva.lblRespA6Click(Sender: TObject);
begin
  resposta[6] := 'A';
  checkA6.Visible := true;
  checkB6.Visible := false;
  checkC6.Visible := false;
  checkD5.Visible := false;
end;

procedure TPageProva.lblRespB6Click(Sender: TObject);
begin

  resposta[6] := 'B';
  checkA6.Visible := false;
  checkB6.Visible := true;
  checkC6.Visible := false;
  checkD6.Visible := false;
end;



procedure TPageProva.lblRespC6Click(Sender: TObject);
begin

  resposta[6] := 'C';
  checkA6.Visible := false;
  checkB6.Visible := false;
  checkC6.Visible := true;
  checkD6.Visible := false;
end;

procedure TPageProva.lblRespD6Click(Sender: TObject);
begin

  resposta[6] := 'D';
  checkA6.Visible := false;
  checkB6.Visible := false;
  checkC6.Visible := false;
  checkD6.Visible := true;
end;



//**CHECK PERGUNTA 6 **//

//CHECK PERGUNTA 7 //

procedure TPageProva.lblRespA7Click(Sender: TObject);
begin
  resposta[7] := 'A';
  checkA7.Visible := true;
  checkB7.Visible := false;
  checkC7.Visible := false;
  checkD7.Visible := false;
end;


procedure TPageProva.lblRespB7Click(Sender: TObject);
begin

  resposta[7]:= 'B';
  checkA7.Visible := false;
  checkB7.Visible := true;
  checkC7.Visible := false;
  checkD7.Visible := false;
end;


procedure TPageProva.lblRespC7Click(Sender: TObject);
begin

  resposta[7] := 'C';
  checkA7.Visible := false;
  checkB7.Visible := false;
  checkC7.Visible := true;
  checkD7.Visible := false;
end;


procedure TPageProva.lblRespD7Click(Sender: TObject);
begin

  resposta[7]:= 'D';
  checkA7.Visible := false;
  checkB7.Visible := false;
  checkC7.Visible := false;
  checkD7.Visible := true;
end;



//**CHECK PERGUNTA 7 **//

//CHECK PERGUNTA 8 //

procedure TPageProva.lblRespA8Click(Sender: TObject);
begin
  resposta[8] := 'A';
  checkA8.Visible := true;
  checkB8.Visible := false;
  checkC8.Visible := false;
  checkD8.Visible := false;
end;



procedure TPageProva.lblRespB8Click(Sender: TObject);
begin

  resposta[8] := 'B';
  checkA8.Visible := false;
  checkB8.Visible := true;
  checkC8.Visible := false;
  checkD8.Visible := false;
end;


procedure TPageProva.lblRespC8Click(Sender: TObject);
begin

  resposta[8] := 'C';
  checkA8.Visible := false;
  checkB8.Visible := false;
  checkC8.Visible := true;
  checkD8.Visible := false;
end;


procedure TPageProva.lblRespD8Click(Sender: TObject);
begin

  resposta[8] := 'D';
  checkA8.Visible := false;
  checkB8.Visible := false;
  checkC8.Visible := false;
  checkD8.Visible := true;
end;


//**CHECK PERGUNTA 8 **//

//CHECK PERGUNTA 9 //

procedure TPageProva.lblRespA9Click(Sender: TObject);
begin
  resposta[9] := 'A';
  checkA9.Visible := true;
  checkB9.Visible := false;
  checkC9.Visible := false;
  checkD9.Visible := false;
end;

procedure TPageProva.lblRespB9Click(Sender: TObject);
begin

  resposta[9] := 'B';
  checkA9.Visible := false;
  checkB9.Visible := true;
  checkC9.Visible := false;
  checkD9.Visible := false;
end;

procedure TPageProva.lblRespC9Click(Sender: TObject);
begin

  resposta[9] := 'C';
  checkA9.Visible := false;
  checkB9.Visible := false;
  checkC9.Visible := true;
  checkD9.Visible := false;
end;

procedure TPageProva.lblRespD9Click(Sender: TObject);
begin

  resposta[9] := 'D';
  checkA9.Visible := false;
  checkB9.Visible := false;
  checkC9.Visible := false;
  checkD9.Visible := true;
end;

procedure TPageProva.mostraID(id: Integer; desc : String);
begin
  if desc = '0' then
  begin
    ShowMessage('vazio' +  id.ToString);
  end
  else
  begin
   ShowMessage('vazio' +  id.ToString);

  end;

end;

//**CHECK PERGUNTA 9 **//

//CHECK PERGUNTA 10 //

procedure TPageProva.lblRespA10Click(Sender: TObject);
begin
  resposta[10] := 'A';
  checkA10.Visible := true;
  checkB10.Visible := false;
  checkC10.Visible := false;
  checkD10.Visible := false;
end;


procedure TPageProva.lblRespB10Click(Sender: TObject);
begin

  resposta[10] := 'B';
  checkA10.Visible := false;
  checkB10.Visible := true;
  checkC10.Visible := false;
  checkD10.Visible := false;
end;


procedure TPageProva.lblRespC10Click(Sender: TObject);
begin

  resposta[10] := 'C';
  checkA10.Visible := false;
  checkB10.Visible := false;
  checkC10.Visible := true;
  checkD10.Visible := false;
end;


procedure TPageProva.lblRespD10Click(Sender: TObject);
begin

  resposta[10] := 'D';
  checkA10.Visible := false;
  checkB10.Visible := false;
  checkC10.Visible := false;
  checkD10.Visible := true;
end;

//**CHECK PERGUNTA 10 **//


//CHECK PERGUNTA 11 //

procedure TPageProva.lblRespA11Click(Sender: TObject);
begin
  resposta[11] := 'A';
  checkA11.Visible := true;
  checkB11.Visible := false;
  checkC11.Visible := false;
  checkD11.Visible := false;
end;



procedure TPageProva.lblRespB11Click(Sender: TObject);
begin

  resposta[11] := 'B';
  checkA11.Visible := false;
  checkB11.Visible := true;
  checkC11.Visible := false;
  checkD11.Visible := false;
end;


procedure TPageProva.lblRespC11Click(Sender: TObject);
begin

  resposta[11]:= 'C';
  checkA11.Visible := false;
  checkB11.Visible := false;
  checkC11.Visible := true;
  checkD11.Visible := false;
end;

procedure TPageProva.lblRespD11Click(Sender: TObject);
begin

  resposta[11] := 'D';
  checkA11.Visible := false;
  checkB11.Visible := false;
  checkC11.Visible := false;
  checkD11.Visible := true;
end;

//**CHECK PERGUNTA 11 **//

//CHECK PERGUNTA 12 //

procedure TPageProva.lblRespA12Click(Sender: TObject);
begin
  resposta[12] := 'A';
  checkA12.Visible := true;
  checkB12.Visible := false;
  checkC12.Visible := false;
  checkD12.Visible := false;
end;


procedure TPageProva.lblRespB12Click(Sender: TObject);
begin

  resposta[12]:= 'B';
  checkA12.Visible := false;
  checkB12.Visible := true;
  checkC12.Visible := false;
  checkD12.Visible := false;
end;


procedure TPageProva.lblRespC12Click(Sender: TObject);
begin

  resposta[12] := 'C';
  checkA12.Visible := false;
  checkB12.Visible := false;
  checkC12.Visible := true;
  checkD12.Visible := false;
end;



procedure TPageProva.lblRespD12Click(Sender: TObject);
begin

  resposta[12] := 'D';
  checkA12.Visible := false;
  checkB12.Visible := false;
  checkC12.Visible := false;
  checkD12.Visible := true;
end;


//**CHECK PERGUNTA 12 **//

//CHECK PERGUNTA 13 //

procedure TPageProva.lblRespA13Click(Sender: TObject);
begin
  resposta[13] := 'A';
  checkA13.Visible := true;
  checkB13.Visible := false;
  checkC13.Visible := false;
  checkD13.Visible := false;
end;



procedure TPageProva.lblRespB13Click(Sender: TObject);
begin

  resposta[13] := 'B';
  checkA13.Visible := false;
  checkB13.Visible := true;
  checkC13.Visible := false;
  checkD13.Visible := false;
end;


procedure TPageProva.lblRespC13Click(Sender: TObject);
begin

  resposta[13] := 'C';
  checkA13.Visible := false;
  checkB13.Visible := false;
  checkC13.Visible := true;
  checkD13.Visible := false;
end;

procedure TPageProva.lblRespD13Click(Sender: TObject);
begin

  resposta[13] := 'D';
  checkA13.Visible := false;
  checkB13.Visible := false;
  checkC13.Visible := false;
  checkD13.Visible := true;
end;


//**CHECK PERGUNTA 13 **//

//CHECK PERGUNTA 14 //

procedure TPageProva.lblRespA14Click(Sender: TObject);
begin
  resposta[14] := 'A';
  checkA14.Visible := true;
  checkB14.Visible := false;
  checkC14.Visible := false;
  checkD14.Visible := false;
end;


procedure TPageProva.lblRespB14Click(Sender: TObject);
begin

  Resposta[14] := 'B';
  checkA14.Visible := false;
  checkB14.Visible := true;
  checkC14.Visible := false;
  checkD14.Visible := false;
end;


procedure TPageProva.lblRespC14Click(Sender: TObject);
begin

  resposta[14] := 'C';
  checkA14.Visible := false;
  checkB14.Visible := false;
  checkC14.Visible := true;
  checkD14.Visible := false;
end;


procedure TPageProva.lblRespD14Click(Sender: TObject);
begin

  resposta[14] := 'D';
  checkA14.Visible := false;
  checkB14.Visible := false;
  checkC14.Visible := false;
  checkD14.Visible := true;
end;


//**CHECK PERGUNTA 14 **//

//CHECK PERGUNTA 15 //

procedure TPageProva.lblRespA15Click(Sender: TObject);
begin
  resposta[15] := 'A';
  checkA15.Visible := true;
  checkB15.Visible := false;
  checkC15.Visible := false;
  checkD15.Visible := false;
end;


procedure TPageProva.lblRespB15Click(Sender: TObject);
begin

  resposta[15] := 'B';
  checkA15.Visible := false;
  checkB15.Visible := true;
  checkC15.Visible := false;
  checkD15.Visible := false;
end;


procedure TPageProva.lblRespC15Click(Sender: TObject);
begin

  resposta[15] := 'C';
  checkA15.Visible := false;
  checkB15.Visible := false;
  checkC15.Visible := true;
  checkD15.Visible := false;
end;


procedure TPageProva.lblRespD15Click(Sender: TObject);
begin

  resposta[15] := 'D';
  checkA15.Visible := false;
  checkB15.Visible := false;
  checkC15.Visible := false;
  checkD15.Visible := true;
end;


//**CHECK PERGUNTA 15 **//

//CHECK PERGUNTA 16 //

procedure TPageProva.lblRespA16Click(Sender: TObject);
begin
  resposta[16] := 'A';
  checkA16.Visible := true;
  checkB16.Visible := false;
  checkC16.Visible := false;
  checkD16.Visible := false;
end;


procedure TPageProva.lblRespB16Click(Sender: TObject);
begin

  resposta[16] := 'B';
  checkA16.Visible := false;
  checkB16.Visible := true;
  checkC16.Visible := false;
  checkD16.Visible := false;
end;


procedure TPageProva.lblRespC16Click(Sender: TObject);
begin

  resposta[16]:= 'C';
  checkA16.Visible := false;
  checkB16.Visible := false;
  checkC16.Visible := true;
  checkD16.Visible := false;
end;


procedure TPageProva.lblRespD16Click(Sender: TObject);
begin

  resposta[16] := 'D';
  checkA16.Visible := false;
  checkB16.Visible := false;
  checkC16.Visible := false;
  checkD16.Visible := true;
end;


//**CHECK PERGUNTA 16 **//

//CHECK PERGUNTA 17 //

procedure TPageProva.lblRespA17Click(Sender: TObject);
begin
  resposta[17] := 'A';
  checkA17.Visible := true;
  checkB17.Visible := false;
  checkC17.Visible := false;
  checkD17.Visible := false;
end;

procedure TPageProva.lblRespB17Click(Sender: TObject);
begin

  resposta[17] := 'B';
  checkA17.Visible := false;
  checkB17.Visible := true;
  checkC17.Visible := false;
  checkD17.Visible := false;
end;

procedure TPageProva.lblRespC17Click(Sender: TObject);
begin

  resposta[17] := 'C';
  checkA17.Visible := false;
  checkB17.Visible := false;
  checkC17.Visible := true;
  checkD17.Visible := false;
end;


procedure TPageProva.lblRespD17Click(Sender: TObject);
begin

  resposta[17] := 'D';
  checkA17.Visible := false;
  checkB17.Visible := false;
  checkC17.Visible := false;
  checkD17.Visible := true;
end;


//**CHECK PERGUNTA 17 **//

//CHECK PERGUNTA 18 //

procedure TPageProva.lblRespA18Click(Sender: TObject);
begin
  resposta[18] := 'A';
  checkA18.Visible := true;
  checkB18.Visible := false;
  checkC18.Visible := false;
  checkD18.Visible := false;
end;

procedure TPageProva.lblRespB18Click(Sender: TObject);
begin

  resposta[18] := 'B';
  checkA18.Visible := false;
  checkB18.Visible := true;
  checkC18.Visible := false;
  checkD18.Visible := false;
end;


procedure TPageProva.lblRespC18Click(Sender: TObject);
begin

  resposta[18] := 'C';
  checkA18.Visible := false;
  checkB18.Visible := false;
  checkC18.Visible := true;
  checkD18.Visible := false;
end;


procedure TPageProva.lblRespD18Click(Sender: TObject);
begin

  resposta[18] := 'D';
  checkA18.Visible := false;
  checkB18.Visible := false;
  checkC18.Visible := false;
  checkD18.Visible := true;
end;


//**CHECK PERGUNTA 18 **//

//CHECK PERGUNTA 19 //

procedure TPageProva.lblRespA19Click(Sender: TObject);
begin
  resposta[19] := 'A';
  checkA19.Visible := true;
  checkB19.Visible := false;
  checkC19.Visible := false;
  checkD19.Visible := false;
end;

procedure TPageProva.lblRespB19Click(Sender: TObject);
begin

  resposta[19] := 'B';
  checkA19.Visible := false;
  checkB19.Visible := true;
  checkC19.Visible := false;
  checkD19.Visible := false;
end;

procedure TPageProva.lblRespC19Click(Sender: TObject);
begin

  resposta[19] := 'C';
  checkA19.Visible := false;
  checkB19.Visible := false;
  checkC19.Visible := true;
  checkD19.Visible := false;
end;

procedure TPageProva.lblRespD19Click(Sender: TObject);
begin

  resposta[19] := 'D';
  checkA19.Visible := false;
  checkB19.Visible := false;
  checkC19.Visible := false;
  checkD19.Visible := true;
end;

//**CHECK PERGUNTA 19 **//

//CHECK PERGUNTA 20 //

procedure TPageProva.lblRespA20Click(Sender: TObject);
begin
  resposta[20] := 'A';
  checkA20.Visible := true;
  checkB20.Visible := false;
  checkC20.Visible := false;
  checkD20.Visible := false;
end;

procedure TPageProva.lblRespB20Click(Sender: TObject);
begin

  resposta[20] := 'B';
  checkA20.Visible := false;
  checkB20.Visible := true;
  checkC20.Visible := false;
  checkD20.Visible := false;
end;


procedure TPageProva.lblRespC20Click(Sender: TObject);
begin

  resposta[20] := 'C';
  checkA20.Visible := false;
  checkB20.Visible := false;
  checkC20.Visible := true;
  checkD20.Visible := false;
end;


procedure TPageProva.lblRespD20Click(Sender: TObject);
begin

  resposta[20]:= 'D';
  checkA20.Visible := false;
  checkB20.Visible := false;
  checkC20.Visible := false;
  checkD20.Visible := true;
end;


//**CHECK PERGUNTA 20 **//

//CHECK PERGUNTA 20 //

procedure TPageProva.lblRespA21Click(Sender: TObject);
begin
  resposta[21] := 'A';
  checkA21.Visible := true;
  checkB21.Visible := false;
  checkC21.Visible := false;
  checkD21.Visible := false;
end;



procedure TPageProva.lblRespB21Click(Sender: TObject);
begin

  resposta[21] := 'B';
  checkA21.Visible := false;
  checkB21.Visible := true;
  checkC21.Visible := false;
  checkD21.Visible := false;
end;


procedure TPageProva.lblRespC21Click(Sender: TObject);
begin

  resposta[21] := 'C';
  checkA21.Visible := false;
  checkB21.Visible := false;
  checkC21.Visible := true;
  checkD21.Visible := false;
end;



procedure TPageProva.lblRespD21Click(Sender: TObject);
begin

  resposta[21]:= 'D';
  checkA21.Visible := false;
  checkB21.Visible := false;
  checkC21.Visible := false;
  checkD21.Visible := true;
end;


//**CHECK PERGUNTA 21 **//

//CHECK PERGUNTA 22 //

procedure TPageProva.lblRespA22Click(Sender: TObject);
begin
  resposta[22] := 'A';
  checkA22.Visible := true;
  checkB22.Visible := false;
  checkC22.Visible := false;
  checkD22.Visible := false;
end;


procedure TPageProva.lblRespB22Click(Sender: TObject);
begin

  resposta[22] := 'B';
  checkA22.Visible := false;
  checkB22.Visible := true;
  checkC22.Visible := false;
  checkD22.Visible := false;
end;



procedure TPageProva.lblRespC22Click(Sender: TObject);
begin

  resposta[22] := 'C';
  checkA22.Visible := false;
  checkB22.Visible := false;
  checkC22.Visible := true;
  checkD22.Visible := false;
end;



procedure TPageProva.lblRespD22Click(Sender: TObject);
begin

  resposta[22]:= 'D';
  checkA22.Visible := false;
  checkB22.Visible := false;
  checkC22.Visible := false;
  checkD22.Visible := true;
end;

//**CHECK PERGUNTA 22 **//

//CHECK PERGUNTA 23 //

procedure TPageProva.lblRespA23Click(Sender: TObject);
begin
  resposta[23] := 'A';
  checkA23.Visible := true;
  checkB23.Visible := false;
  checkC23.Visible := false;
  checkD23.Visible := false;
end;


procedure TPageProva.lblRespB23Click(Sender: TObject);
begin

  resposta[23] := 'B';
  checkA23.Visible := false;
  checkB23.Visible := true;
  checkC23.Visible := false;
  checkD23.Visible := false;
end;


procedure TPageProva.lblRespC23Click(Sender: TObject);
begin

  resposta[23] := 'C';
  checkA23.Visible := false;
  checkB23.Visible := false;
  checkC23.Visible := true;
  checkD23.Visible := false;
end;



procedure TPageProva.lblRespD23Click(Sender: TObject);
begin

  resposta[23]:= 'D';
  checkA23.Visible := false;
  checkB23.Visible := false;
  checkC23.Visible := false;
  checkD23.Visible := true;
end;



//**CHECK PERGUNTA 23 **//

//CHECK PERGUNTA 24 //

procedure TPageProva.lblRespA24Click(Sender: TObject);
begin
  resposta[24] := 'A';
  checkA24.Visible := true;
  checkB24.Visible := false;
  checkC24.Visible := false;
  checkD24.Visible := false;
end;


procedure TPageProva.lblRespB24Click(Sender: TObject);
begin

  resposta[24] := 'B';
  checkA24.Visible := false;
  checkB24.Visible := true;
  checkC24.Visible := false;
  checkD24.Visible := false;
end;


procedure TPageProva.lblRespC24Click(Sender: TObject);
begin

  resposta[24] := 'C';
  checkA24.Visible := false;
  checkB24.Visible := false;
  checkC24.Visible := true;
  checkD24.Visible := false;
end;

procedure TPageProva.lblRespD24Click(Sender: TObject);
begin

  resposta[24]:= 'D';
  checkA24.Visible := false;
  checkB24.Visible := false;
  checkC24.Visible := false;
  checkD24.Visible := true;
end;


//**CHECK PERGUNTA 24 **//

//CHECK PERGUNTA 25 //

procedure TPageProva.lblRespA25Click(Sender: TObject);
begin
  resposta[25] := 'A';
  checkA25.Visible := true;
  checkB25.Visible := false;
  checkC25.Visible := false;
  checkD25.Visible := false;
end;

procedure TPageProva.lblRespB25Click(Sender: TObject);
begin

  resposta[25] := 'B';
  checkA25.Visible := false;
  checkB25.Visible := true;
  checkC25.Visible := false;
  checkD25.Visible := false;
end;


procedure TPageProva.lblRespC25Click(Sender: TObject);
begin

  resposta[25] := 'C';
  checkA25.Visible := false;
  checkB25.Visible := false;
  checkC25.Visible := true;
  checkD25.Visible := false;
end;



procedure TPageProva.lblRespD25Click(Sender: TObject);
begin

  resposta[25]:= 'D';
  checkA25.Visible := false;
  checkB25.Visible := false;
  checkC25.Visible := false;
  checkD25.Visible := true;
end;


//**CHECK PERGUNTA 25 **//

//CHECK PERGUNTA 26 //

procedure TPageProva.lblRespA26Click(Sender: TObject);
begin
  resposta[26] := 'A';
  checkA26.Visible := true;
  checkB26.Visible := false;
  checkC26.Visible := false;
  checkD26.Visible := false;
end;



procedure TPageProva.lblRespB26Click(Sender: TObject);
begin

  resposta[26] := 'B';
  checkA26.Visible := false;
  checkB26.Visible := true;
  checkC26.Visible := false;
  checkD26.Visible := false;
end;



procedure TPageProva.lblRespC26Click(Sender: TObject);
begin

  resposta[26] := 'C';
  checkA26.Visible := false;
  checkB26.Visible := false;
  checkC26.Visible := true;
  checkD26.Visible := false;
end;

procedure TPageProva.lblRespD26Click(Sender: TObject);
begin

  resposta[26]:= 'D';
  checkA26.Visible := false;
  checkB26.Visible := false;
  checkC26.Visible := false;
  checkD26.Visible := true;
end;


//**CHECK PERGUNTA 26 **//

//CHECK PERGUNTA 27 //

procedure TPageProva.lblRespA27Click(Sender: TObject);
begin
  resposta[27] := 'A';
  checkA27.Visible := true;
  checkB27.Visible := false;
  checkC27.Visible := false;
  checkD27.Visible := false;
end;


procedure TPageProva.lblRespB27Click(Sender: TObject);
begin

  resposta[27] := 'B';
  checkA27.Visible := false;
  checkB27.Visible := true;
  checkC27.Visible := false;
  checkD27.Visible := false;
end;



procedure TPageProva.lblRespC27Click(Sender: TObject);
begin

  resposta[27] := 'C';
  checkA27.Visible := false;
  checkB27.Visible := false;
  checkC27.Visible := true;
  checkD27.Visible := false;
end;



procedure TPageProva.lblRespD27Click(Sender: TObject);
begin

  resposta[27]:= 'D';
  checkA27.Visible := false;
  checkB27.Visible := false;
  checkC27.Visible := false;
  checkD27.Visible := true;
end;



//**CHECK PERGUNTA 27 **//

//CHECK PERGUNTA 28 //

procedure TPageProva.lblRespA28Click(Sender: TObject);
begin
  resposta[28] := 'A';
  checkA28.Visible := true;
  checkB28.Visible := false;
  checkC28.Visible := false;
  checkD28.Visible := false;
end;



procedure TPageProva.lblRespB28Click(Sender: TObject);
begin

  resposta[28] := 'B';
  checkA28.Visible := false;
  checkB28.Visible := true;
  checkC28.Visible := false;
  checkD28.Visible := false;
end;



procedure TPageProva.lblRespC28Click(Sender: TObject);
begin

  resposta[28] := 'C';
  checkA28.Visible := false;
  checkB28.Visible := false;
  checkC28.Visible := true;
  checkD28.Visible := false;
end;


procedure TPageProva.lblRespD28Click(Sender: TObject);
begin

  resposta[28]:= 'D';
  checkA28.Visible := false;
  checkB28.Visible := false;
  checkC28.Visible := false;
  checkD28.Visible := true;
end;


//**CHECK PERGUNTA 28 **//

//CHECK PERGUNTA 29 //

procedure TPageProva.lblRespA29Click(Sender: TObject);
begin
  resposta[29] := 'A';
  checkA29.Visible := true;
  checkB29.Visible := false;
  checkC29.Visible := false;
  checkD29.Visible := false;
end;

procedure TPageProva.lblRespB29Click(Sender: TObject);
begin

  resposta[29] := 'B';
  checkA29.Visible := false;
  checkB29.Visible := true;
  checkC29.Visible := false;
  checkD29.Visible := false;
end;

procedure TPageProva.lblRespC29Click(Sender: TObject);
begin

  resposta[29] := 'C';
  checkA29.Visible := false;
  checkB29.Visible := false;
  checkC29.Visible := true;
  checkD29.Visible := false;
end;

procedure TPageProva.lblRespD29Click(Sender: TObject);
begin

  resposta[29]:= 'D';
  checkA29.Visible := false;
  checkB29.Visible := false;
  checkC29.Visible := false;
  checkD29.Visible := true;
end;

//**CHECK PERGUNTA 29 **//

//CHECK PERGUNTA 30 //

procedure TPageProva.lblRespA30Click(Sender: TObject);
begin
  resposta[30] := 'A';
  checkA30.Visible := true;
  checkB30.Visible := false;
  checkC30.Visible := false;
  checkD30.Visible := false;
end;

procedure TPageProva.lblRespB30Click(Sender: TObject);
begin

  resposta[30] := 'B';
  checkA30.Visible := false;
  checkB30.Visible := true;
  checkC30.Visible := false;
  checkD30.Visible := false;
end;

procedure TPageProva.lblRespC30Click(Sender: TObject);
begin

  resposta[30] := 'C';
  checkA30.Visible := false;
  checkB30.Visible := false;
  checkC30.Visible := true;
  checkD30.Visible := false;
end;

procedure TPageProva.lblRespD30Click(Sender: TObject);
begin

  resposta[30]:= 'D';
  checkA30.Visible := false;
  checkB30.Visible := false;
  checkC30.Visible := false;
  checkD30.Visible := true;
end;

//**CHECK PERGUNTA 30 **//


procedure TPageProva.TimerTimer(Sender: TObject);
begin
   lblCronometro.Text := TimeToStr(var_horafinal - Time());
  if (Time() > var_horafinal) then
  begin
      Timer.Enabled := false;
      ShowMessage('Acabou o tempo');
  end;

end;

end.