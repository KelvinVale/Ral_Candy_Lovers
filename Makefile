IFS = ./jelly_bean_if.sv

PKGS = ./jelly_bean_pkg.sv

RTL = 	./jelly_bean_taster.sv


RUN_ARGS_COMMON = -access +r -input ./shm.tcl \
		  +uvm_set_config_int=*,recording_detail,1 -coverage all -covoverwrite

sim: clean
	#@g++ -g -fPIC -Wall -std=c++0x ./modelo/refmod_c.cpp -shared -o test.so
	xrun -64bit -uvm $(PKGS) $(IFS) $(RTL) top.sv -sv_lib test.so \
		+UVM_TESTNAME=jelly_bean_base_test -covtest jelly_bean_base_test $(RUN_ARGS_COMMON)

clean:
	@rm -rf INCA_libs waves.shm cov_work/ *.history *.log *.key mdv.log imc.log imc.key ncvlog_*.err *.trn *.dsn .simvision/ xcelium.d simv.daidir *.so *.o *.err

waves:
	simvision waves.shm &