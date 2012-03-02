unit kwitansi;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,strUtils, Buttons;


function rupiah(txtAngka:string):string;

implementation

function rupiah(txtangka:string):string;
var bilangan      : string;
    num           : integer;
    i,j           : integer;
    jmldigit      : integer;
    kwitansi      : string;



const ratusan : array[0..9] of string = ('','seratus','dua ratus','tiga ratus','empat ratus',
                                        'lima ratus','enam ratus','tujuh ratus','delapan ratus',
                                        'sembilan ratus');
      belasan : array[0..9] of string = ('','sebelas','dua belas','tiga belas','empat belas',
                                         'lima belas','enam belas','tujuh belas','delapan belas','sembilan belas');
      puluhan : array[0..9] of string = ('','sepuluh','dua puluh','tiga puluh','empat puluh',
                                         'lima puluh','enam puluh','tujuh puluh','delapan puluh',
                                         'sembilan puluh');
      satuan  : array[0..9] of string = ('','satu','dua','tiga','empat','lima','enam',
                                         'tujuh','delapan','sembilan');
     ribuan  : array[0..9] of string = ('ribu','satu ribu','dua ribu','tiga ribu','empat ribu','lima ribu',
                                        'enam ribu','tujuh ribu','delapan ribu','sembilan ribu');
     jutaan  : array[0..9] of string = ('juta','satu juta','dua juta','tiga juta','empat juta','lima juta',
                                        'enam juta','tujuh juta','delapan juta','sembilan juta');
begin

    num      := strToInt(txtangka);
    jmldigit := length(txtangka);

j:=1;
for i:=1 to jmldigit do
begin

case jmldigit of
0 : bilangan:='';
1 : begin
    num:=strToInt(AnsiMidStr(txtAngka,j,1));
     case num of
     0 : bilangan:=satuan[0];
     1 : bilangan:=satuan[1];
     2 : bilangan:=satuan[2];
     3 : bilangan:=satuan[3];
     4 : bilangan:=satuan[4];
     5 : bilangan:=satuan[5];
     6 : bilangan:=satuan[6];
     7 : bilangan:=satuan[7];
     8 : bilangan:=satuan[8];
     9 : bilangan:=satuan[9];
     end;

     end;

2 :  begin
     num:=strToInt(AnsiMidStr(txtAngka,j,2));
     if (num<=10) or (num>=20) then
     begin
     num:=strToInt(AnsiMidStr(txtAngka,j,1));
     case num of
     0 : bilangan:=puluhan[0];
     1 : bilangan:=puluhan[1];
     2 : bilangan:=puluhan[2];
     3 : bilangan:=puluhan[3];
     4 : bilangan:=puluhan[4];
     5 : bilangan:=puluhan[5];
     6 : bilangan:=puluhan[6];
     7 : bilangan:=puluhan[7];
     8 : bilangan:=puluhan[8];
     9 : bilangan:=puluhan[9];
     end; // end case num

     end else
         begin
            num:=strToInt(AnsiMidStr(txtAngka,j,2));
               case num of
                0 : bilangan:=belasan[0];
                11 : bilangan:=belasan[1];
                12 : bilangan:=belasan[2];
                13 : bilangan:=belasan[3];
                14 : bilangan:=belasan[4];
                15 : bilangan:=belasan[5];
                16 : bilangan:=belasan[6];
                17 : bilangan:=belasan[7];
                18 : bilangan:=belasan[8];
                19 : bilangan:=belasan[9];
               end;

              j:=j+1;
              jmldigit:=jmldigit-1;
         end;

   end;

3 : begin

    num:=strToInt(AnsiMidStr(txtAngka,j,1));
     case num of
     0 : bilangan:=ratusan[0];
     1 : bilangan:=ratusan[1];
     2 : bilangan:=ratusan[2];
     3 : bilangan:=ratusan[3];
     4 : bilangan:=ratusan[4];
     5 : bilangan:=ratusan[5];
     6 : bilangan:=ratusan[6];
     7 : bilangan:=ratusan[7];
     8 : bilangan:=ratusan[8];
     9 : bilangan:=ratusan[9];
     end;

     end;

4 : begin
    num:=strToInt(AnsiMidStr(txtAngka,j,1));

     case num of
     0 :  if (length(txtAngka)=7) and  ((AnsiMidStr(txtAngka,2,6)='000000') or ((AnsiMidStr(txtAngka,2,3)='000'))) then
          begin
          bilangan:='';
          end else
          if (length(txtAngka)=8) and  ((AnsiMidStr(txtAngka,3,6)='000000') or ((AnsiMidStr(txtAngka,3,3)='000'))) then
          begin
           bilangan:='';
          end else 
          bilangan:=ribuan[0];
     1 :
          if (AnsiMidStr(txtAngka,j-2,3)<> '001') and (AnsiMidStr(txtAngka,j-1,1)<> '1') then
          begin
            bilangan:= ribuan[1];
          end
          else
          begin bilangan:='seribu'; end;
     2 : bilangan:=ribuan[2];
     3 : bilangan:=ribuan[3];
     4 : bilangan:=ribuan[4];
     5 : bilangan:=ribuan[5];
     6 : bilangan:=ribuan[6];
     7 : bilangan:=ribuan[7];
     8 : bilangan:=ribuan[8];
     9 : bilangan:=ribuan[9];
     end;

    end;

   // end; // end if leftstr
5 :  begin
     num:=strToInt(AnsiMidStr(txtAngka,j,2));

     if (num<=10) or (num>=20) then
     begin
     num:=strToInt(AnsiMidStr(txtAngka,j,1));
     case num of
     0 : bilangan:=puluhan[0];
     1 : bilangan:=puluhan[1];
     2 : bilangan:=puluhan[2];
     3 : bilangan:=puluhan[3];
     4 : bilangan:=puluhan[4];
     5 : bilangan:=puluhan[5];
     6 : bilangan:=puluhan[6];
     7 : bilangan:=puluhan[7];
     8 : bilangan:=puluhan[8];
     9 : bilangan:=puluhan[9];
     end; // end case num

     end else
         begin
               num:=strToInt(AnsiMidStr(txtAngka,j,2));
               case num of
                00 : bilangan:=belasan[0];
                11 : bilangan:=belasan[1]+' ribu';
                12 : bilangan:=belasan[2]+' ribu';
                13 : bilangan:=belasan[3]+' ribu';
                14 : bilangan:=belasan[4]+' ribu';
                15 : bilangan:=belasan[5]+' ribu';
                16 : bilangan:=belasan[6]+' ribu';
                17 : bilangan:=belasan[7]+' ribu';
                18 : bilangan:=belasan[8]+' ribu';
                19 : bilangan:=belasan[9]+' ribu';
               end;
               j:=j+1;
               jmldigit:=jmldigit-1;
           end;
    end; // end of num

6 : begin

      num:=strToInt(AnsiMidStr(txtAngka,j,1));
     case num of
     0 : bilangan:=ratusan[0];
     1 : bilangan:=ratusan[1];
     2 : bilangan:=ratusan[2];
     3 : bilangan:=ratusan[3];
     4 : bilangan:=ratusan[4];
     5 : bilangan:=ratusan[5];
     6 : bilangan:=ratusan[6];
     7 : bilangan:=ratusan[7];
     8 : bilangan:=ratusan[8];
     9 : bilangan:=ratusan[9];
     end;

   end;

7 : begin

    num:=strToInt(AnsiMidStr(txtAngka,j,1));
     case num of
     0 : bilangan:=jutaan[0];
     1 : bilangan:=jutaan[1];
     2 : bilangan:=jutaan[2];
     3 : bilangan:=jutaan[3];
     4 : bilangan:=jutaan[4];
     5 : bilangan:=jutaan[5];
     6 : bilangan:=jutaan[6];
     7 : bilangan:=jutaan[7];
     8 : bilangan:=jutaan[8];
     9 : bilangan:=jutaan[9];
     end;

     end;

8 : begin
     num:=strToInt(AnsiMidStr(txtAngka,j,2));

     if (num<=10) or (num>=20) then
     begin
     num:=strToInt(AnsiMidStr(txtAngka,j,1));

     case num of
      0 : bilangan:=puluhan[0];
     1 : bilangan:=puluhan[1];
     2 : bilangan:=puluhan[2];
     3 : bilangan:=puluhan[3];
     4 : bilangan:=puluhan[4];
     5 : bilangan:=puluhan[5];
     6 : bilangan:=puluhan[6];
     7 : bilangan:=puluhan[7];
     8 : bilangan:=puluhan[8];
     9 : bilangan:=puluhan[9];

     end;

     end else
         begin
               num:=strToInt(AnsiMidStr(txtAngka,j,2));
               case num of
                00 : bilangan:=belasan[0];
                11 : bilangan:=belasan[1]+' juta';
                12 : bilangan:=belasan[2]+' juta';
                13 : bilangan:=belasan[3]+' juta';
                14 : bilangan:=belasan[4]+' juta';
                15 : bilangan:=belasan[5]+' juta';
                16 : bilangan:=belasan[6]+' juta';
                17 : bilangan:=belasan[7]+' juta';
                18 : bilangan:=belasan[8]+' juta';
                19 : bilangan:=belasan[9]+' juta';
               end;
               j:=j+1;
               jmldigit:=jmldigit-1;
           end;

end;
end;
   j:=j+1;
   jmldigit:=jmldigit-1;
   kwitansi:=kwitansi+' '+bilangan;

end; // end for i

    result:='# '+Trim(kwitansi)+' rupiah #';

end;

end.
 