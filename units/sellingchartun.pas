unit sellingchartun;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, TeEngine,
  Series, ExtCtrls, TeeProcs, Chart, DbChart;

type
  Tsellingchartfrm = class(TForm)
    jualchartdset: TZQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  sellingchartfrm: Tsellingchartfrm;

implementation

{$R *.dfm}

end.
