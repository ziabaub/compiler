unit Arr;

interface
  uses typ,tag ;
  type
     arrs = class(typs)
     private

     public
       ofs : typs ;
       size ,sizeofsize: integer ;
       constructor createArr(Ssize : integer ; Oofs : typs);
     end;

  var
  ar : arrs;
implementation
    constructor arrs.createArr(Ssize : integer ; Oofs : typs);
    begin
       inherited CreateTyp('[]',tarray_type,Ssize*Oofs.width);
       ofs:=Oofs;
       size:=Ssize;
      // if (Oofs is arrs)then
      // begin
        //  if (Oofs is arrs)then
        //     size:= size*(((Oofs) as arrs).size)
         // else
          //    qitem :=createarrs.createarr(sizeofsize)

      // end;
      end;
end.
