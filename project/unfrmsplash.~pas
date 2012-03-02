unit unfrmsplash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg, StdCtrls;

type
  TfrmSplash = class(TForm)
    Timer1: TTimer;
    Image1: TImage;
    lblmessage: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure OpenSplash;
    procedure showProgress(vStr : string);
    procedure closeSplash;
  end;

var
  frmSplash: TfrmSplash;

function Splash : TfrmSplash;

implementation

{$R *.dfm}

function Splash: TfrmSplash;
begin
  if frmSplash = nil then begin
     frmSplash := TfrmSplash.Create(frmSplash);
  end;
  result := frmSplash   
end;

procedure TfrmSplash.OpenSplash;
begin
  borderStyle := bsnone;
  show;
  update;
end;

procedure TfrmSplash.closeSplash;
begin
  timer1.Enabled := true;
end;

procedure TfrmSplash.showProgress(vStr : string);
begin
  lblmessage.Caption := vStr;
  update;
end;


procedure TfrmSplash.FormCreate(Sender: TObject);
begin
 TransparentColorValue := image1.Canvas.Pixels[0,0];
end;

procedure TfrmSplash.Timer1Timer(Sender: TObject);
begin
  close;
  Release;
  frmSplash := nil;
end;

end.
