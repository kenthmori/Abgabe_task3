comp=g++
par_opt=-O0

.PHONY: dynamic static main_dynamic main_static

all: dynamic static main_dynamic main_static

dynamic: libwelcome.o libwelcome.so

static: libwelcome.o libwelcome.a

main_dynamic: main_dyn.x

main_static: main_stat.x


libwelcome.o: welcome.c
	$(comp)  $(par_opt) -c -fPIC -o libwelcome.o welcome.c

libwelcome.so: libwelcome.o
	$(comp) $(par_opt) -shared -o libwelcome.so libwelcome.o

libwelcome.a: libwelcome.o
	ar rcs libwelcome.a libwelcome.o

main_stat.x: main.o libwelcome.a
	$(comp) $(par_opt) -L. -o main_stat.x main.o -l:./libwelcome.a


main_dyn.x: main.o libwelcome.so
	$(comp) $(par_opt) -L. -o main_dyn.x main.o -l:./libwelcome.so


main.o: main.c
	$(comp) $(par_opt) -c -o main.o main.c

#all: libwelcome.so libwelcome.a main_stat.x main_dyn.x
#
#libwelcome.so: welcome.c libwelcome.o
#	$(comp) $(par_opt) -c -fPIC -o libwelcome.o welcome.c
#	$(comp) $(par_opt) -shared -o libwelcome.so libwelcome.o
#
#libwelcome.a: welcome.c welcome.o
#	$(comp) $(par_opt) -c -fPIC -o welcome.o welcome.c
#	ar rcs libwelcome.a welcome.o
#
#main_stat.x: libwelcome.a main.c
#	$(comp) $(par_opt) -c -o main.o main.c
#	$(comp) $(par_opt) -L. -o main_stat.x main.o -l:./libwelcome.a
#	
#main_dyn.x: libwelcome.so main.c
#	$(comp) $(par_opt) -c -o main.o main.c
#	$(comp) $(par_opt) -L. -o main_dyn.x main.o -l:./libwelcome.so
#
clean:
	rm -f *.x *.a *.so *.o
