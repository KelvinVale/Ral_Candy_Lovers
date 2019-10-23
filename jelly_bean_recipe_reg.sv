class jelly_bean_recipe_reg extends uvm_reg;
   `uvm_object_utils( jelly_bean_recipe_reg )

   rand uvm_reg_field flavor;
   rand uvm_reg_field color;
   rand uvm_reg_field sugar_free;
   rand uvm_reg_field sour;

   constraint flavor_color_con {
      flavor.value != jelly_bean_types::NO_FLAVOR;
      flavor.value == jelly_bean_types::APPLE
                   -> color.value != jelly_bean_types::BLUE;
      flavor.value == jelly_bean_types::BLUEBERRY
                   -> color.value == jelly_bean_types::BLUE;
      flavor.value <= jelly_bean_types::CHOCOLATE;
   }

   function new( string name = "jelly_bean_recipe_reg" );
      super.new( .name( name ), .n_bits( 7 ), .has_coverage( UVM_NO_COVERAGE ) );
   endfunction: new

   virtual function void build();
      flavor = uvm_reg_field::type_id::create( "flavor" );
      flavor.configure( .parent                 ( this ), 
                        .size                   ( 3    ), 
                        .lsb_pos                ( 0    ), 
                        .access                 ( "WO" ), 
                        .volatile               ( 0    ),
                        .reset                  ( 0    ), 
                        .has_reset              ( 1    ), 
                        .is_rand                ( 1    ), 
                        .individually_accessible( 1    ) );

      color = uvm_reg_field::type_id::create( "color" );
      color.configure( .parent                 ( this ), 
                       .size                   ( 2    ), 
                       .lsb_pos                ( 3    ), 
                       .access                 ( "WO" ), 
                       .volatile               ( 0    ),
                       .reset                  ( 0    ), 
                       .has_reset              ( 1    ), 
                       .is_rand                ( 1    ), 
                       .individually_accessible( 1    ) );

      sugar_free = uvm_reg_field::type_id::create( "sugar_free" );
      sugar_free.configure( .parent                 ( this ), 
                            .size                   ( 1    ), 
                            .lsb_pos                ( 5    ), 
                            .access                 ( "WO" ), 
                            .volatile               ( 0    ),
                            .reset                  ( 0    ), 
                            .has_reset              ( 1    ), 
                            .is_rand                ( 1    ), 
                            .individually_accessible( 1    ) );

      sour = uvm_reg_field::type_id::create( "sour" );
      sour.configure( .parent                 ( this ), 
                      .size                   ( 1    ), 
                      .lsb_pos                ( 6    ), 
                      .access                 ( "WO" ), 
                      .volatile               ( 0    ),
                      .reset                  ( 0    ), 
                      .has_reset              ( 1    ), 
                      .is_rand                ( 1    ), 
                      .individually_accessible( 1    ) );
   endfunction: build
endclass: jelly_bean_recipe_reg