unit unFrmViewKaryawan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls,ADODb, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TfrmViewKaryawan = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Bevel1: TBevel;
    Label2: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    txtCariNama: TEdit;
    BitBtn1: TBitBtn;
    GroupBox2: TGroupBox;
    gridViewKaryawan: TDBGrid;
    StatusBar1: TStatusBar;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtCariNamaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridViewKaryawanKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    procedure cariKaryawan;
  public
    { Public declarations }
    procedure refreshKaryawan;

  end;

var
  frmViewKaryawan: TfrmViewKaryawan;

implementation

uses unFrmAddKaryawan, unDm, unfrmEditKaryawan;

{$R *.dfm}

procedure TfrmViewKaryawan.refreshKaryawan;
begin
  with dm.dSetKaryawan do
  begin
   active := false;
   commandType := cmdText;
   commandText := 'SELECT * FROM takaryawan,tasalary '+
   'WHERE krKodeKaryawan LIKE slKodeKaryawan '+
   'AND slAktif LIKE (:status) '+
   'ORDER BY krNama';
   Parameters.ParamByName('status').Value := 'Yes';
   active := true;
  end; 
end;

procedure TfrmViewKaryawan.cariKaryawan;
begin
  with dm.dSetKaryawan do
  begin
     active := false;
     commandType := cmdText;
     commandText := 'SELECT * FROM takaryawan,tasalary '+
    'WHERE krKodeKaryawan LIKE slKodeKaryawan '+
    'AND slAktif LIKE ''Yes'' '+
    'AND krNama LIKE (:cariNama) '+
    'ORDER BY krNama';
     Parameters.ParamByName('cariNama').Value := '%'+txtCariNama.Text+'%';
     active := true;
  end;
end;

procedure TfrmViewKaryawan.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
  VK_F5 : frmAddKaryawan.ShowModal;
  VK_F6 : refreshKaryawan;
  end;
end;

procedure TfrmViewKaryawan.txtCariNamaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case key of
  VK_F5 : frmAddKaryawan.ShowModal;
  VK_RETURN : cariKaryawan;
  VK_DOWN : gridViewKaryawan.SetFocus;
  VK_F6 : refreshKaryawan;
  vk_f2 : frmEditKaryawan.Show;
  end;
end;

procedure TfrmViewKaryawan.gridViewKaryawanKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case key of
  VK_F5 : frmAddKaryawan.ShowModal;
  VK_F3 : txtCariNama.SetFocus;
  VK_F4 : gridViewKaryawan.SetFocus;
  VK_F6 : refreshKaryawan;
  VK_RETURN : frmViewKaryawan.Close;
  vk_f2 : frmEditKaryawan.Show;
  end;
end;

procedure TfrmViewKaryawan.BitBtn1Click(Sender: TObject);
begin
  txtCariNama.Clear;
end;

end.
