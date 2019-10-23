class sugar_free_jelly_bean_transaction extends jelly_bean_transaction;
   `uvm_object_utils( sugar_free_jelly_bean_transaction )

   constraint sugar_free_con {
      sugar_free == 1;
   }

   function new( string name = "" );
      super.new( name );
   endfunction: new
endclass: sugar_free_jelly_bean_transaction