#include <sysdep.h>
#include <tls.h>

ENTRY (__getpid)
    mov r7, #SYS_getpid
    svc 0
    bx lr
END (__getpid)
