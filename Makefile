REV=$(shell sh -c 'date +"%Y.%m.%d"')

all: ogg-winmm.dll

ogg-winmm.rc.o: ogg-winmm.rc.in
	sed 's/__REV__/$(REV)/' ogg-winmm.rc.in | windres -O coff -o ogg-winmm.rc.o

ogg-winmm.dll: ogg-winmm.c ogg-winmm.rc.o ogg-winmm.def player.c stubs.c
	mingw32-gcc -std=gnu99 -Wl,--enable-stdcall-fixup -Ilibs/include -O2 -shared -s -o ogg-winmm.dll ogg-winmm.c player.c stubs.c ogg-winmm.def ogg-winmm.rc.o -Llibs -lvorbisfile -lwinmm -static-libgcc

clean:
	rm -f ogg-winmm.dll ogg-winmm.rc.o
