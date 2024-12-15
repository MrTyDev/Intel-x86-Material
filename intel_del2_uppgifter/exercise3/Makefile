CC=gcc
AS=as
LD=ld

CFLAGS= -g
LFLAGS=-no-pie

OUT=prog
#OBJ=counter_c.o counter_S.o

all: prog

# Compile and link, creating executable.
$(OUT): *.s *.c
	$(CC) $(CFLAGS) $(LFLAGS) $^ -o $@

# Only compile, no linking, creating .o files.
objects: *.s *.c
	$(CC) -c $(CFLAGS) $(LFLAGS) $^

#submission: *.S *.c Makefile
#	tar czf submission.tgz *.S *.c Makefile

clean:
	rm -f *.o
	rm -f *.out
	rm -f $(OUT)
#		rm -f $(OBJ)
#		rm -f $(OUT)
