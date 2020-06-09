## Version 0.4.2 (2020-06-09)
 - Remove `print.data.table`; this is now similar to data.table's own function.

## Version 0.4.1

 - Steal `data.table:::print.data.table()` 
   - Change `cat` to `message` for displaying keys
   - Add keys to bottom of `print` as well
   - Always display keys at bottom if options( data.table.print.keys )
 - Set defaults in zzz.R
   - options( datatable.print.keys=TRUE, datatable.print.class=TRUE )
 - Soft deprecate `setcolfirst` to use native `setcolorder` 
 
## Version 0.4.0 

 - Update .onAttach
 - Change dependency **na.actions** -> **na.tools**

## Version 0.3.2 

 - Add `setkeysfirst`
 - Rename nonkey -> nonkeys; keep nonkey as alias

## Version 0.3.1

- zzz.R: Add `.datatable.aware=TRUE` to work nicely with devtools.
  ref: [devtools192](https://github.com/hadley/devtools/issues/192)
