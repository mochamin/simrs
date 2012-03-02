unit unFungsi;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids,ADODB, StdCtrls, ExtCtrls, ComCtrls, Buttons,
  DBCtrls, DB,strutils;

  function isiTarifDokter(kodeDokter : string;jenisTindakan : string;wkt:TTime):double;
  function cektarifkamar(kodekamar : string):integer;
  function autonumberKwitansi(noreg : string;jmlUang:double):string;

implementation
uses undm,unUtama;

function autonumberKwitansi(noreg : string;jmlUang:double):string;
var zerofill  : string;
    curNumber : integer;
    curNoReg  : string;
    thn,bln,tgl,dbbln,cutthn : string;
    nokwitansi : string;
begin

    tgl := LeftStr(dateToStr(date()),2);
    bln := AnsiMidStr(dateToStr(date()),4,2);  // ambil 2 digit bulan
    thn := RightStr(dateToStr(date()),2);

  with dm.dsetkwitansi do
  begin
    active:=false;
    commandType := cmdText;
    commandText := 'select * from takwitansi '+
    'order by kwid asc';
    active:=true;
    Last; // go to the last of the record

    dbbln := AnsiMidStr(fields.fieldByname('kwno').AsString,3,2);
    curNoReg := RightStr(fields.fieldByname('kwno').AsString,4); //ambil 6 digit dari No RM di database
    curNumber := strToInt(curNoReg)+1;


    case Length(intToStr(curNumber)) of
    1 : zeroFill := '000';
    2 : zerofill := '00';
    3 : zerofill := '0';
    4 : zeroFill := '';

    end;

    Append; // tambahkan record;
   if (dbbln<>bln)  then
   begin
      result := thn+bln+tgl+'0001'
   end else
       begin
        result := thn+bln+tgl+zeroFill+intToStr(curNumber);
       end;
    fieldByName('kwno').AsString     := result;
    fieldByName('kwpic').AsString    := isCurrentUser;
    fieldByName('kwtgl').AsString    := dateToStr(date());
    fieldByName('kwtglwkt').AsString := dateTimeToStr(now());
    fieldByName('kwnoreg').AsString  := noreg;
    fieldByName('kwrupiah').AsFloat  := jmlUang;
    post;
    updatebatch(arAll);

  end;

end;


function cektarifkamar(kodekamar : string):integer;
begin
  with dm.dSetKamar do
  begin
   active:=false;
   commandType := cmdText;
   commandText := 'select * from takamar '+
   'where kakode like (:kode) ';
   parameters.ParamByName('kode').Value := kodekamar;
   active:=true;

   if isEmpty=false then
   begin
    result := fieldByName('karate').AsInteger;
   end;
  end;
end;


function isiTarifDokter(kodeDokter : string;jenisTindakan : string;wkt:TTime):double;
begin

    with dm.dsetcektarifdokter do
    begin
    active:=false;
    commandType := cmdText;
    commandText := 'select * from tatarifdokter '+
    'where tdkodedokter like (:kode) '+
    'and tdjenisservice = (:jenisService) ';
    parameters.ParamByName('kode').Value := kodeDokter;
    parameters.ParamByName('jenisService').Value := jenisTindakan;
    active:=true;

    if isEmpty=false then
    begin

       first;
       while not eof do
       begin
        if (wkt >= (strToTime(fieldByname('tdwktawal').AsString))) and (wkt <= (strToTime(fieldByname('tdwktakhir').AsString))) then
        begin
            result := fieldByName('tdTarif').AsFloat;
            exit;
        end;
        next;
       end; // end of while not
    end;
    end;
end;

end.
