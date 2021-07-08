windres ogg-winmm.rc.in -O coff -o ogg-winmm.rc.o
gcc -std=gnu99 -Wl,--enable-stdcall-fixup -Ilibs/include -O2 -shared -s -o ogg-winmm.dll ogg-winmm.c player.c stubs.c ogg-winmm.def ogg-winmm.rc.o -Llibs -lvorbisfile -lwinmm -static-libgcc
pause
