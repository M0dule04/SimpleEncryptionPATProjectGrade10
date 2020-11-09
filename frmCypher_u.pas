unit frmCypher_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtDlgs, ShellAPI, shlObj,
  Vcl.ComCtrls,Math, Vcl.Menus, Vcl.Buttons, Vcl.OleCtrls, SHDocVw, Vcl.ExtCtrls, Clipbrd,
  Vcl.Mask, Vcl.WinXCtrls;

type
  TfrmCipher = class(TForm)
    OTFDEncrypt: TOpenTextFileDialog;
    RedtDisplay: TRichEdit;
    rbDecrypt: TRadioButton;
    rbEncrypt: TRadioButton;
    STFDSave: TSaveTextFileDialog;
    BBtnHelp: TBitBtn;
    BtnBrowse: TButton;
    BtnCipher: TButton;
    btnSave: TButton;
    lblSave: TLabel;
    MedtKeycode: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    BbtnCopy: TBitBtn;
    BBtnClear: TBitBtn;
    lblLastUsedCode: TLabel;
    TSTheme: TToggleSwitch;
    mmCypher: TMainMenu;
    mmFile: TMenuItem;
    mmHelp: TMenuItem;
    mmBrowse: TMenuItem;
    mmSave: TMenuItem;
    mmSaveas: TMenuItem;
    mmDocumentation: TMenuItem;
    mmCipher1: TMenuItem;
    mmEncrypt: TMenuItem;
    mmDecrypt: TMenuItem;
    btnRandom: TBitBtn;
    cbAnimations: TCheckBox;
    redInvisible: TRichEdit;
    lblLoadedFile: TLabel;

 // ****** Custom Procedures ********
    procedure TextFileRead;
    procedure DecryptedStringEncrypt;
    procedure SeedCalculation;
    procedure EncryptedStringDecrypt;
    procedure TextFileWrite(FileName : string);
    procedure delay(TickTime: Integer);
    procedure TextAnimations(InputText : string);
    procedure BtnBrowseClick(Sender: TObject);
    procedure BtnCipherClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
 //******************************************

    procedure rbEncryptClick(Sender: TObject);
    procedure rbDecryptClick(Sender: TObject);
    procedure BBtnHelpClick(Sender: TObject);
    procedure MedtKeycodeChange(Sender: TObject);
    procedure BbtnCopyClick(Sender: TObject);
    procedure Change(Sender: TObject);
    procedure BBtnClearClick(Sender: TObject);
    procedure TSThemeClick(Sender: TObject);
    procedure mmBrowseClick(Sender: TObject);
    procedure mmSaveasClick(Sender: TObject);
    procedure mmDocumentationClick(Sender: TObject);
    procedure mmEncryptClick(Sender: TObject);
    procedure mmDecryptClick(Sender: TObject);
    procedure mmSaveClick(Sender: TObject);
    procedure ThemeClick(Sender: TObject);
    procedure OnShow(Sender: TObject);
    procedure btnRandomClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbAnimationsClick(Sender: TObject);

  private
    { Private declarations }
    iModifier : integer;
    sSavedFile : string;
    sBrowsedFile : string;
    bEncrypted : boolean;
    bSkipAnimation : boolean;

  public
    { Public declarations }
  end;

var
  frmCipher: TfrmCipher;

implementation


{$R *.dfm}
//****************************************************************************************************************************************************************************
procedure TfrmCipher.BBtnHelpClick(Sender: TObject);
var
SEDirectory : array[0..100] of WideChar;
sFileDirectory : string;

begin
  bSkipAnimation := True;

  sFileDirectory := GetCurrentDir + '\Documentation\Documentation.html'; // gets .exe directory

  if not FileExists(sFileDirectory) then // checks for file existance
  begin
    showmessage('Please make sure that the Documentation is installed');
    exit;
  end;

  StringtoWideChar(sFileDirectory,SEDirectory,(length(sFileDirectory) + 1)); // converts string to widechar

  ShellExecute(handle,'open',SEDirectory,nil,nil,SW_SHOWNORMAL); // opens File at file handle
end;

//************************************************************************************************************************************************
procedure TfrmCipher.btnRandomClick(Sender: TObject);
var
  I, iRandomOrd : Integer;
  sRandomKey : string;

begin
  bSkipAnimation := True;

  for I := 1 to 10 do
  begin
    Randomize;
    iRandomOrd := Random(90) + 33; // alt + 33-122
    sRandomKey := sRandomKey + chr(iRandomOrd); //genarates random characters
  end;

  MedtKeycode.Text := sRandomKey;
  Medtkeycode.SetFocus;

end;
//******************************************************************************************************************************************

procedure TfrmCipher.BBtnClearClick(Sender: TObject);
begin
  bSkipAnimation := True;
  RedtDisplay.clear;
  bbtnCopy.Enabled := true;

  lblsave.Caption := '';
  lblLoadedFile.Caption := '';
  lblLastUsedCode.Caption := '';

  OTFDEncrypt.FileName := '';
  STFDSave.FileName := '';
end;
//*********************************************************************************************************************************************

procedure TfrmCipher.BbtnCopyClick(Sender: TObject);
begin
  bSkipAnimation := True;

  Clipboard.AsText := RedtDisplay.text; // copies text to clipboard
  lblSave.caption := 'Text copied to clipboard ☺';
  BbtnCopy.enabled := false;
end;
//*************************************************************************************************************************************************

procedure TfrmCipher.BtnBrowseClick(Sender: TObject);
var
  position : integer;
  sLoadedFile : string;

begin
  if not OTFDEncrypt.Execute then // executes the opentextfiledialog and checks that the user didn't press cancel
    exit;

  bSkipAnimation := True;

  TextFileRead; // calls textFileRead procedure

  BtnSave.enabled := true;
  lblSave.caption := '';

  sBrowsedFile := OTFDEncrypt.FileName;
  sLoadedFile := OTFDEncrypt.FileName;

  position := AnsiPos('\',sLoadedFile);
  while not ( position = 0) do
    begin
      Delete(sLoadedFile,1,position);
      position := AnsiPos('\',sLoadedFile);
    end;

  lblLoadedFile.Caption := 'Loaded: ' + sLoadedFile;
end;
//***********************************************************************************************************************************************************************
procedure TfrmCipher.BtnCipherClick(Sender: TObject);
begin
  bSkipAnimation := True;

  if rbDecrypt.checked = false  and rbEncrypt.checked = true then
      begin
        SeedCalculation; //calculates seed value
        DecryptedStringEncrypt; // encrypts the text
        bEncrypted := true; // used later in the file saving algorithm
     end
       else if rbEncrypt.checked = false and rbDecrypt.checked = true then
       begin
        SeedCalculation; //calculates seed value
        EncryptedStringDecrypt; // encrypts the text
        bEncrypted := false; // used later in the file saving algorithm
       end;
end;
//****************************************************************************************************************************************************************************

procedure TfrmCipher.btnSaveClick(Sender: TObject);
begin
  bSkipAnimation := True;
//saves redt text to textfile
  if not STFDSave.Execute then
    exit; // exits procedure when user clicks 'cancel' in dialog

  TextfileWrite(STFDSave.FileName); //writes to text file and uses the dialog.filename as argument
  sSavedFile := STFDSave.Filename;
end;
procedure TfrmCipher.cbAnimationsClick(Sender: TObject);
begin

end;

//****************************************************************************************************************************************************************************

procedure TfrmCipher.Change(Sender: TObject);
begin
  BbtnCopy.Enabled := true;
  btnSave.Enabled := true;
  lblSave.caption := '';
end;
//****************************************************************************************************************************************************************************

procedure TfrmCipher.mmDecryptClick(Sender: TObject);
begin
rbDecrypt.checked := true;
  if BtnCipher.enabled = true then
    BtnCipherClick(Self)
      else
        exit;
end;
//****************************************************************************************************************************************************************************

procedure TfrmCipher.DecryptedStringEncrypt;
var
iLength,I,Irand: integer;
sEncryptedtext,sInputText : string;

begin
    sInputText :=  RedtDisplay.text;

  if iModifier  >= 10 then iRand := 1 else iRand := 0;//calculate wheter iRand should be positive or negative

  iLength := length(sInputText);// determine length of string

  // encryption algorithm
  if iRand = 1 then
    begin
       for I := 1 to iLength do
          sEncryptedtext:= sEncryptedtext + chr(ord(sInputText[I])+ iModifier);
     end
        else if Irand = 0 then
                begin
                  for I := 1 to iLength do
                    sEncryptedtext := sEncryptedtext + chr(ord(sInputText[I])- iModifier);
                end;
  //output
  TextAnimations(sEncryptedtext); // animates the wirting of text to the richedit
  // clearing private values
  sInputtext := '';
  iModifier := 0;
end;
//****************************************************************************************************************************************************************************

procedure TfrmCipher.TextAnimations(InputText: string);
var
  I: Integer;
  sOutput : string;
begin
  bSkipAnimation := false;

 if cbAnimations.checked = true then // checks initialy if the animations checkbox is checked
  begin
    for I := 1 to length(Inputtext) do
      begin
      if (cbAnimations.Checked = true) and (bSkipAnimation = false) then // checks constantly when animating if the checkbox is still checked
        begin
          Delay(50);
          sOutput := sOutput + InputText[I];
          redtDisplay.Text := sOutput;
        end
          else
          begin
            redtDisplay.Text := Inputtext; // completes entire string when animation is canceled
          end;
      end;
  end
    else
      begin
        redtDisplay.Text := Inputtext; //if animation is not enabled then complete entire string
      end;
end;
//****************************************************************************************************************************************************************************

procedure TfrmCipher.TextFileRead;
var
  F : textFile;
  sMessage, sOrdinal,sCharacter,sOutput : string;
  iPos,I,ilength,iCharAmount : integer;

begin
  RedtDisplay.lines.clear;
  RedInVisible.lines.clear;

  if NOT FileExists(OTFDEncrypt.FileName) then
        begin
          exit;
        end;

  AssignFile(F,OTFDEncrypt.FileName);

  Reset(F);

  while NOT eof(F) do
        begin
          Readln(F,sMessage); // read the textfile line for line

          iLength := length(sMessage); // determine the length of line

        if (Frac(iLength)/8 = 0) and (sMessage[iLength] = '#') and (sMessage[iLength - 1] = '#') then // checks if the file was originally an encrypted text and was saved by the program
          begin

            iCharAmount := length(sMessage) Div 8; //calulates how many actual characters there is

            for I := 1 to iCharAmount do
              begin
                sCharacter := Copy(sMessage,1,8); // copies the first actual char

                delete(sMessage,1,8); //deletes it from file

                iPos := Pos('#',sCharacter); //determines the length of the number

                sOrdinal := Copy(sCharacter,1,iPos-1); //copies the number from sCharacter

                sOutput := sOutput + chr(strtoint(sOrdinal)); // converts the number into a character and adds it to the output
              end;

            RedInvisible.text := sOutput; // outputs to a invisible richedit for the animation
          end
            else
              begin
               RedInvisible.Lines.Add(sMessage); // outputs to a invisible richedit for the animation
              end;
        end;

  TextAnimations(RedInvisible.text); // gets text from the invisible Richedit

  try
    closeFile(F);
      except
        closeFile(F);
  end;
  

end;
//****************************************************************************************************************************************************************************

procedure TfrmCipher.TextFileWrite(FileName : string);
var
  F : Textfile;
  FS : TFileStream;
  I,I2,I3,iOrdinalLength : integer;
  sordinalText,sText,sExtention : string;

begin

  if not FileExists(FileName) then // if the user entered a unique filename
    begin
      for I3 := length(FileName)-4 to length(FileName) do
        sExtention := sExtention + fileName[I3]; //gets the extension name

      if not (sExtention = '.txt') then       // checks if user entered a .txt extention
        FileName := FileName + '.txt';        // adds txt extention

     FS := TFileStream.Create(FileName,fmCreate); //creates file with filestream
     FreeANDNil(FS);                              // frees up memory from filestream
    end;

  AssignFile(F,FileName);

  try                             //Makes sure to rewrite file to prevent a I/O error
  Rewrite(F);
    except
      Rewrite(F);
  end;

  sText := RedtDisplay.text;

  if bEncrypted then //if the string was encrypted (line 160)
    begin
      for I := 1 to length(sText) do
        begin
          sordinalText := inttostr(ord(sText[I])); //gets numeric value from characters

          iOrdinalLength := length(sOrdinalText); // determines length of the OrdinalText

          for I2 := 0 to (7 - iOrdinalLength) do //runs dependent on how many digits the OrdinalText was
            begin
              sOrdinalText :=  sOrdinalText   + '#'; // adds # until the number legth of the string is 8
            end;

          Write(F, sOrdinalText);
        end;
    end
      else
        begin
         Write(F, sText);
        end;

  try                              //Makes sure to Close file to prevent a I/O error
  CloseFile(F);
   except
    CloseFile(F);
  end;

  btnSave.enabled := false;
  lblSave.caption := 'File successfully saved ☺';
end;
//****************************************************************************************************************************************************************************



procedure TfrmCipher.ThemeClick(Sender: TObject);
begin
if TSTheme.state = tssOn then
  TSTheme.state := tssOff
    else
      TsTheme.state := tssOn;
end;
//****************************************************************************************************************************************************************************

procedure TfrmCipher.TSThemeClick(Sender: TObject);
begin
 if TSTheme.state = tssOff then
 begin
 // changes theme
  frmCipher.Color := $FFFFFF;
  RedtDisplay.Color := $00E1E1E1;

  RedtDisplay.Font.Color := clBlack;
  lblSave.Font.color := clBlack;

 end else if TSTheme.state = tssOn then
      begin
       // changes theme
        frmCipher.Color := $00B9B4AC;
        RedtDisplay.Color := $00756E63;

         RedtDisplay.Font.Color := clLime;
         lblSave.Font.color := clLime;

      end;
end;
//****************************************************************************************************************************************************************************

procedure TfrmCipher.mmEncryptClick(Sender: TObject);
begin
  rbEncrypt.checked := true;
  if BtnCipher.enabled = true then
    BtnCipherClick(Self)
      else
        exit;
end;
//****************************************************************************************************************************************************************************

procedure TfrmCipher.EncryptedStringDecrypt;
var
ilength,I,Irand: integer;
sDecryptedText, sInputText : string;

begin

  sInputtext := RedtDisplay.text;

  ilength := length(sInputText);

if iModifier  >= 10 then iRand := 1 else iRand := 0;//calculate wheter iRand should be positive or negative

if iRand = 1 then
  begin
    for I := 1 to ilength do
      sDecryptedText := sDecryptedText + chr(ord(sInputtext[I]) - iModifier); //decrypts text
  end
  else if iRand = 0 then
           begin
              for I := 1 to ilength do
                 sDecryptedText := sDecryptedText + chr(ord(sInputtext[I]) + iModifier); //decrypts text
           end;
//output
  TextAnimations(sDecryptedText);

end;
//****************************************************************************************************************************************************************************

procedure TfrmCipher.FormCreate(Sender: TObject);
begin
  OTFDEncrypt.InitialDir := GetCurrentDir; //sets the initial directory for the opendialog to the programs .exe directory
  STFDSave.InitialDir := GetCurrentDir; //sets the initial directory for the savedialog to the programs .exe directory
end;
//****************************************************************************************************************************************************************************


procedure TfrmCipher.MedtKeycodeChange(Sender: TObject);
begin
if length(MedtKeycode.text) = 10 then
   BtnCipher.enabled := true
   else
    BtnCipher.enabled := false;
end;
//****************************************************************************************************************************************************************************

procedure TfrmCipher.mmBrowseClick(Sender: TObject);
begin
  BtnBrowseClick(Self);
end;
//****************************************************************************************************************************************************************************

procedure TfrmCipher.mmDocumentationClick(Sender: TObject);
begin
  BBtnHelpClick(Self);
end;
//****************************************************************************************************************************************************************************

procedure TfrmCipher.mmSaveasClick(Sender: TObject);
begin
  btnSaveClick(Self);
end;
//****************************************************************************************************************************************************************************

procedure TfrmCipher.mmSaveClick(Sender: TObject);
begin
  try
    if (not (sSavedFile = '')) and (sBrowsedFile = sSavedFile) then
      TextFileWrite(sSavedFile)
        else
          btnSaveclick(Self);

      except on E: Exception do
        exit;
  end;

end;
//****************************************************************************************************************************************************************************

procedure TfrmCipher.OnShow(Sender: TObject);
begin
  bEncrypted := false;
end;
//****************************************************************************************************************************************************************************

procedure TfrmCipher.rbDecryptClick(Sender: TObject);
begin
 btnCipher.caption := '&Decrypt';
 bSkipAnimation := True;
end;
//****************************************************************************************************************************************************************************

procedure TfrmCipher.rbEncryptClick(Sender: TObject);
begin
  btnCipher.caption := '&Encrypt';
  bSkipAnimation := True;
end;
//****************************************************************************************************************************************************************************

procedure TfrmCipher.SeedCalculation;
var
  Icount, iSeed: integer;
  sKey,sKeycode : string;

begin
  sKey := MedtKeycode.text;
  lblLastUsedCode.caption := skey;

// checks length of keycode
if Length(sKey) >10 then
  begin
    showMessage('ERROR 02: Sorry the keycode is too long.');
    exit;
  end
    else if  Length(sKey) <10 then
          begin
            showmessage('ERROR 03: Sorry the keycode is too short');
            exit;
          end
            else
              begin
                sKeycode := skey;

                //seed algorithm
                iSeed := 0;

                for Icount := 1 to 10 do
                  begin
                    iSeed := iSeed + ord(sKeycode[Icount]); // counts up the ordinals of the characters of the string
                  end;

                iModifier := Round(iSeed / 100);
              end;

  MedtKeycode.clear;
  MedtKeycode.setFocus;
end;
//****************************************************************************************************************************************************************************

procedure TfrmCipher.Delay(TickTime : Integer); // creates delay
var
  Past : LongInt;

begin
  Past := GetTickCount; // gets the current tick count
    repeat
      application.ProcessMessages; // tells the OS that the program is stil responding;
    Until (GetTickCount - NativeUInt(Past)) >= LongInt(TickTime);
end;
//****************************************************************************************************************************************************************************

end.
