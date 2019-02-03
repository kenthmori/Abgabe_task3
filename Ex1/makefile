comp=g++

all: libwelcome.so libwelcome.a main_stat.x main_dyn.x

libwelcome.so: welcome.c
	$(comp) -c -fPIC -o libwelcome.o welcome.c
	$(comp) -shared -o libwelcome.so libwelcome.o

libwelcome.a: welcome.c
	$(comp) -c -fPIC -o welcome.o welcome.c
	ar rcs libwelcome.a welcome.o

main_stat.x: libwelcome.a main.c
	$(comp) -c -o main.o main.c
	$(comp) -L. -o main_stat.x main.o -l:libwelcome.a
	
main_dyn.x: libwelcome.so main.c
	$(comp) -c -o main.o main.c
	$(comp) -L. -o main_dyn.x main.o -l:libwelcome.so

clean:
	rm -f *.x *.a *.so *.o
