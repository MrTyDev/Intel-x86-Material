all: test_std run_test

test_std: test_STD.o lab3_lib.o
	x86_64-linux-gnu-gcc -o test_std test_STD.o lab3_lib.o

test_STD.o: test_STD.c
	x86_64-linux-gnu-gcc -c test_STD.c

lab3_lib.o: lab3_lib.s
	x86_64-linux-gnu-as -o lab3_lib.o lab3_lib.s

run_test: test_std
	./test_std

clean:
	rm -f test_std test_STD.o lab3_lib.o