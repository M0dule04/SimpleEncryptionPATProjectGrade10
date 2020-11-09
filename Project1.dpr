program Project1;

uses
  Vcl.Forms,
  frmCypher_u in 'frmCypher_u.pas' {frmCipher},
  frmSplashScreen_u in 'frmSplashScreen_u.pas' {frmSplashScreen};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  frmSplashScreen := TfrmSplashScreen.Create(nil);
  try
    frmSplashscreen.Show;

    while not frmSplashScreen.bSplashAnimation do
      Application.ProcessMessages;

    Application.Title := 'Message encrcypter';
    Application.CreateForm(TfrmCipher, frmCipher);

    frmSplashscreen.Hide;
    frmCipher.Show;
  finally
    frmSplashscreen.Free;
  end;
  Application.Run;
end.
