unit unFrmMasterDetail;

interface

uses
  Windows, Messages, Classes, SysUtils, Graphics, Controls, StdCtrls, Forms,
  Dialogs, DBCtrls, DB, DBGrids, DBTables, Grids, Mask, ExtCtrls;

type
  TfrmMasterDetail = class(TForm)
    Table2adKodeApotik: TStringField;
    Table2adKodeObat: TStringField;
    Table2adQty: TIntegerField;
    Table2adTotal: TIntegerField;
    Table1apKodeApotik: TStringField;
    Table1apTgl: TDateField;
    Table1apNoRegPasien: TStringField;
    ScrollBox: TScrollBox;
    Label1: TLabel;
    EditapKodeApotik: TDBEdit;
    Label2: TLabel;
    EditapTgl: TDBEdit;
    Label3: TLabel;
    EditapNoRegPasien: TDBEdit;
    DBGrid1: TDBGrid;
    DBNavigator: TDBNavigator;
    Panel1: TPanel;
    DataSource1: TDataSource;
    Panel2: TPanel;
    Panel3: TPanel;
    Table1: TTable;
    Table2: TTable;
    DataSource2: TDataSource;
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  frmMasterDetail: TfrmMasterDetail;

implementation

{$R *.DFM}

procedure TfrmMasterDetail.FormCreate(Sender: TObject);
begin
  Table1.Open;
  Table2.Open;
end;

end.