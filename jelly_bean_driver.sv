class jelly_bean_driver extends uvm_driver#( jelly_bean_transaction );
   `uvm_component_utils( jelly_bean_driver )

   virtual jelly_bean_if jb_if;

   function new( string name, uvm_component parent );
      super.new( name, parent );
   endfunction: new

   function void build_phase( uvm_phase phase );
      super.build_phase( phase );
   endfunction: build_phase

   task main_phase( uvm_phase phase );
      jelly_bean_transaction jb_tx;

      forever begin
         @jb_if.clk;
         jb_if.command <= jelly_bean_types::NO_OP;
         jb_if.color   <= jelly_bean_types::NO_COLOR;
         jb_if.flavor  <= jelly_bean_types::NO_FLAVOR;
         
         seq_item_port.get_next_item( jb_tx );
         @jb_if.clk;
         jb_if.command <= jb_tx.command;
         if ( jb_tx.command == jelly_bean_types::WRITE ) begin
            jb_if.flavor       <= jb_tx.flavor;
            jb_if.color        <= jb_tx.color;
            jb_if.sugar_free   <= jb_tx.sugar_free;
            jb_if.sour         <= jb_tx.sour;
         end else if ( jb_tx.command == jelly_bean_types::READ ) begin
            @jb_if.clk;
	    jb_tx.taste = jelly_bean_types::taste_e'( jb_if.taste );
	 end
         seq_item_port.item_done();
      end
   endtask: main_phase
   
endclass: jelly_bean_driver