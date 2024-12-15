CC=gcc
AS=as
LD=ld

CFLAGS=-g
LFLAGS=-no-pie

OUT=prog

all: prog

# Compile and link, creating executable.
$(OUT): *.s
	$(CC) $(CFLAGS) $(LFLAGS) $^ -o $@

# Only compile, no linking, creating .o files.
#objects: *.s *.c
objects: *.s
	$(CC) -c $(CFLAGS) $(LFLAGS) $^


clean:
	rm -f *.o
	rm -f *.out
	rm -f $(OUT)
