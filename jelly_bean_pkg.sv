   `timescale 1ns/1ns
package jelly_bean_pkg;
   import uvm_pkg::*;

    `include "uvm_macros.svh"

    `include "jelly_bean_types.sv"
    `include "jelly_bean_transaction.sv"
    `include "sugar_free_jelly_bean_transaction.sv"
    `include "jelly_bean_recipe_reg.sv"
    `include "jelly_bean_taste_reg.sv"
    `include "jelly_bean_reg_block.sv"
    `include "jelly_bean_reg_adapter.sv"
    `include "jelly_bean_agent_config.sv"
    `include "jelly_bean_env_config.sv"
    `include "jelly_bean_sequence.sv"
    `include "jelly_bean_reg_sequence.sv"
    `include "jelly_bean_driver.sv"
    `include "jelly_bean_monitor.sv"
    `include "jelly_bean_agent.sv"
    `include "jelly_bean_fc_subscriber.sv"
    `include "jelly_bean_sb_subscriber.sv"
    `include "jelly_bean_scoreboard.sv"
    `include "jelly_bean_env.sv"
    `include "jelly_bean_base_test.sv"
    `include "jelly_bean_reg_test.sv"
    `include "jelly_bean_reg_hw_reset_test.sv"

endpackage: jelly_bean_pkg
