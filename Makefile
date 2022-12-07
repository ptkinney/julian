CFLAGS	      = -g -fomit-frame-pointer -march=native -pedantic -std=gnu11 -Wall
CFLAGS	      = -O3 -fomit-frame-pointer -march=native -pedantic -std=gnu11 -Wall

DEST	      = /usr/local/bin

EXTHDRS	      =

HDRS	      =

LD	      = $(CC)

LDFLAGS	      = -g
LDFLAGS	      =

LIBS	      =

LIBT	      = -lptk -lm

MODE          = 0755

MAKEFILE      = Makefile

OBJS	      = main.o

PRINT	      = pr

PROGRAM       = julian

SHELL	      = /bin/sh

SRCS	      = main.c

SYSHDRS	      = /usr/include/alloca.h \
		/usr/include/bits/byteswap.h \
		/usr/include/bits/endian.h \
		/usr/include/bits/floatn-common.h \
		/usr/include/bits/floatn.h \
		/usr/include/bits/getopt_core.h \
		/usr/include/bits/getopt_posix.h \
		/usr/include/bits/libc-header-start.h \
		/usr/include/bits/long-double.h \
		/usr/include/bits/pthreadtypes-arch.h \
		/usr/include/bits/pthreadtypes.h \
		/usr/include/bits/select.h \
		/usr/include/bits/select2.h \
		/usr/include/bits/stdint-intn.h \
		/usr/include/bits/stdio-ldbl.h \
		/usr/include/bits/stdio.h \
		/usr/include/bits/stdio2.h \
		/usr/include/bits/stdio_lim.h \
		/usr/include/bits/stdlib-bsearch.h \
		/usr/include/bits/stdlib-float.h \
		/usr/include/bits/stdlib-ldbl.h \
		/usr/include/bits/stdlib.h \
		/usr/include/bits/sys_errlist.h \
		/usr/include/bits/thread-shared-types.h \
		/usr/include/bits/time64.h \
		/usr/include/bits/timesize.h \
		/usr/include/bits/types.h \
		/usr/include/bits/types/FILE.h \
		/usr/include/bits/types/__FILE.h \
		/usr/include/bits/types/__fpos64_t.h \
		/usr/include/bits/types/__fpos_t.h \
		/usr/include/bits/types/__locale_t.h \
		/usr/include/bits/types/__mbstate_t.h \
		/usr/include/bits/types/__sigset_t.h \
		/usr/include/bits/types/clock_t.h \
		/usr/include/bits/types/clockid_t.h \
		/usr/include/bits/types/cookie_io_functions_t.h \
		/usr/include/bits/types/locale_t.h \
		/usr/include/bits/types/sigset_t.h \
		/usr/include/bits/types/struct_FILE.h \
		/usr/include/bits/types/struct_timespec.h \
		/usr/include/bits/types/struct_timeval.h \
		/usr/include/bits/types/time_t.h \
		/usr/include/bits/types/timer_t.h \
		/usr/include/bits/typesizes.h \
		/usr/include/bits/uintn-identity.h \
		/usr/include/bits/waitflags.h \
		/usr/include/bits/waitstatus.h \
		/usr/include/bits/wordsize.h \
		/usr/include/endian.h \
		/usr/include/features.h \
		/usr/include/gnu/stubs-32.h \
		/usr/include/gnu/stubs-64.h \
		/usr/include/gnu/stubs.h \
		/usr/include/stdc-predef.h \
		/usr/include/stdio.h \
		/usr/include/stdlib.h \
		/usr/include/sys/cdefs.h \
		/usr/include/sys/select.h \
		/usr/include/sys/types.h

all:		$(PROGRAM)

$(PROGRAM):     $(OBJS) $(LIBS)
		$(LD) $(LDFLAGS) $(OBJS) $(LIBS) $(LIBT) -o temp.$@
		if [ -x /sbin/paxctl ]; then /sbin/paxctl -c  temp.$@; fi
		if [ -x /sbin/paxctl ]; then /sbin/paxctl -v  temp.$@; fi
		if [ -x /sbin/paxctl ]; then /sbin/paxctl -mr temp.$@; fi
		if [ -x /sbin/paxctl ]; then /sbin/paxctl -v  temp.$@; fi
		if [ -x /usr/sbin/paxctl-ng ]; then /usr/sbin/paxctl-ng -v temp.$@; fi
		if [ -x /usr/sbin/paxctl-ng ]; then /usr/sbin/paxctl-ng -F temp.$@; fi
		if [ -x /usr/sbin/paxctl-ng ]; then /usr/sbin/paxctl-ng -v temp.$@; fi
		mv temp.$@ $@

clean:;		rm -f $(OBJS) core

clobber:;	rm -f $(OBJS) $(PROGRAM) core tags

depend:;	@mkmf -f $(MAKEFILE)

echo:;		@echo $(HDRS) $(SRCS)

index:;		@ctags -wx $(HDRS) $(SRCS)

install:	$(PROGRAM)
		sudo install -m $(MODE) -s $(PROGRAM) $(DEST)

print:;		@$(PRINT) $(HDRS) $(SRCS)

tags:           $(HDRS) $(SRCS); @ctags $(HDRS) $(SRCS)
###
main.o: /usr/include/stdio.h /usr/include/bits/libc-header-start.h \
	/usr/include/features.h /usr/include/stdc-predef.h \
	/usr/include/sys/cdefs.h /usr/include/bits/wordsize.h \
	/usr/include/bits/long-double.h /usr/include/gnu/stubs.h \
	/usr/include/gnu/stubs-32.h /usr/include/gnu/stubs-64.h \
	/usr/include/bits/types.h /usr/include/bits/timesize.h \
	/usr/include/bits/typesizes.h /usr/include/bits/time64.h \
	/usr/include/bits/types/__fpos_t.h \
	/usr/include/bits/types/__mbstate_t.h \
	/usr/include/bits/types/__fpos64_t.h /usr/include/bits/types/__FILE.h \
	/usr/include/bits/types/FILE.h /usr/include/bits/types/struct_FILE.h \
	/usr/include/bits/types/cookie_io_functions_t.h \
	/usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
	/usr/include/bits/getopt_posix.h /usr/include/bits/getopt_core.h \
	/usr/include/bits/stdio.h /usr/include/bits/stdio2.h \
	/usr/include/bits/stdio-ldbl.h /usr/include/stdlib.h \
	/usr/include/bits/waitflags.h /usr/include/bits/waitstatus.h \
	/usr/include/bits/floatn.h /usr/include/bits/floatn-common.h \
	/usr/include/bits/types/locale_t.h \
	/usr/include/bits/types/__locale_t.h /usr/include/sys/types.h \
	/usr/include/bits/types/clock_t.h /usr/include/bits/types/clockid_t.h \
	/usr/include/bits/types/time_t.h /usr/include/bits/types/timer_t.h \
	/usr/include/bits/stdint-intn.h /usr/include/endian.h \
	/usr/include/bits/endian.h /usr/include/bits/byteswap.h \
	/usr/include/bits/uintn-identity.h /usr/include/sys/select.h \
	/usr/include/bits/select.h /usr/include/bits/types/sigset_t.h \
	/usr/include/bits/types/__sigset_t.h \
	/usr/include/bits/types/struct_timeval.h \
	/usr/include/bits/types/struct_timespec.h /usr/include/bits/select2.h \
	/usr/include/bits/pthreadtypes.h \
	/usr/include/bits/thread-shared-types.h \
	/usr/include/bits/pthreadtypes-arch.h /usr/include/alloca.h \
	/usr/include/bits/stdlib-bsearch.h /usr/include/bits/stdlib-float.h \
	/usr/include/bits/stdlib.h /usr/include/bits/stdlib-ldbl.h
