



for num in ["42","33","225","190","169","164","6","7","48","172","3","34","75","105","14","15","81","141","108","154"]
   exec 'hi col_'.num.' ctermfg='.num
   exec 'syn match col_'.num.' "ctermfg='.num.':...." containedIn=ALL'

   call append(0, 'ctermfg='.num.':....')
endfor
