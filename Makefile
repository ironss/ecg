

data/sim: archive/sim.tar.gz
	mkdir -p data
	tar -C data -xzf archive/sim.tar.gz
	touch data/sim
	
clean:
	rm -rf data/sim

