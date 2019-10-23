class jelly_bean_reg_block extends uvm_reg_block;
   `uvm_object_utils( jelly_bean_reg_block )

   rand jelly_bean_recipe_reg jb_recipe_reg;
   rand jelly_bean_taste_reg  jb_taste_reg;
   uvm_reg_map                reg_map;

   function new( string name = "jelly_bean_reg_block" );
      super.new( .name( name ), .has_coverage( UVM_NO_COVERAGE ) );
   endfunction: new

   virtual function void build();
      jb_recipe_reg = jelly_bean_recipe_reg::type_id::create( "jb_recipe_reg" );
      jb_recipe_reg.configure( .blk_parent( this ) );
      jb_recipe_reg.build();

      jb_taste_reg = jelly_bean_taste_reg::type_id::create( "jb_taste_reg" );
      jb_taste_reg.configure( .blk_parent( this ) );
      jb_taste_reg.build();

      reg_map = create_map( .name( "reg_map" ), .base_addr( 8'h00 ), 
                            .n_bytes( 1 ), .endian( UVM_LITTLE_ENDIAN ) );
      reg_map.add_reg( .rg( jb_recipe_reg ), .offset( 8'h00 ), .rights( "WO" ) );
      reg_map.add_reg( .rg( jb_taste_reg  ), .offset( 8'h01 ), .rights( "RO" ) );
      lock_model(); // finalize the address mapping
   endfunction: build

endclass: jelly_bean_reg_block 