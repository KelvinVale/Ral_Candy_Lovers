class jelly_bean_taste_reg extends uvm_reg;
   `uvm_object_utils( jelly_bean_taste_reg )

   rand uvm_reg_field taste;

   function new( string name = "jelly_bean_taste_reg" );
      super.new( .name( name ), .n_bits( 2 ), .has_coverage( UVM_NO_COVERAGE ) );
   endfunction: new


   virtual function void build();
      taste = uvm_reg_field::type_id::create( "taste" );
      taste.configure( .parent                 ( this ), 
                       .size                   ( 2    ), 
                       .lsb_pos                ( 0    ), 
                       .access                 ( "RO" ), 
                       .volatile               ( 1    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 1    ) );
   endfunction: build
endclass: jelly_bean_taste_reg