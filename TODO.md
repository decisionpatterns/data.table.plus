
## TODO
 
- [ ] Use mardown with roxygen

- [ ] `[set_]col_order` function instead of setcolfirst; should:
  - support partial list of columns 
  - allow placing at from or back
  - allow SE or NSE

     set_col_order( dt, "colz", colb, ... ) 

- [ ] Fix foverlaps 
      The problem with foverlaps is that it reverses the order of x and y. In
      DT, the normal join is a right-join ... i.e. everything in i of x[i, ...]
      For foverlaps, foverlap( x, y ... x is supposed to be the many small
      intervals table; 
      A smarter overlap should keep the convention straight.  
  
- Needed:
  - Left Join that 
  - determines keys smartly 
  - *prefixes* smartly (?) -- nameit 
  - retains all columns from left and right side 
  - default values 

- Maybe the stitching operation should be
  - Create keys or X's without Y 
  - Stitch ADDITIONAL DIMENSION X's using RIGHT JOINS 
  - Add weighs as INNER JOIN on the right hand side
  - Add Y('s?) as INNER JOIN on the right hand side 
  
## Completed
- [x] Think about how renameif relates to base.tools; moved to bt
