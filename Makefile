
CC=g++
CFLAGS=-O2
LDFLAGS=

hpm_counters: hpm_counters.cxx Makefile
	$(CC) $(CFLAGS) -o $@ $@.cxx
	objdump --disassemble-all $@ > $@.dump

# likely won't work, as we're compiled using glibc
run: hpm_counters
	spike pk ./hpm_counters

clean:
	rm -f hpm_counters *.o *.dump

.PHONY: run clean
