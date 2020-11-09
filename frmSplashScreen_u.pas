unit frmSplashScreen_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TfrmSplashScreen = class(TForm)
    picLogo: TImage;
    Delay: TTimer;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure DelayTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    bSplashAnimation : boolean;
  end;

var
  frmSplashScreen: TfrmSplashScreen;

implementation

{$R *.dfm}

procedure TfrmSplashScreen.DelayTimer(Sender: TObject);
begin
 Delay.Enabled := false;
 bSplashAnimation := true;
end;

procedure TfrmSplashScreen.FormCreate(Sender: TObject);
begin
  picLogo.Picture.LoadFromFile(GetCurrentDir + '/TitleScreen.png');
end;

procedure TfrmSplashScreen.FormShow(Sender: TObject);
begin
  Onshow := nil;
  bSplashAnimation := false;
  Delay.Interval := 3000;
  Delay.Enabled := true;
end;

end.
