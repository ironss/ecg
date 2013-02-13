

data/sim: archive/sim.tar.gz
	tar -C data -xzf archive/sim.tar.gz
	touch data/sim
	
clean:
	rm -rf data/sim
