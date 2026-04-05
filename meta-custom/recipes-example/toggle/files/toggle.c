#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main() {
    system("echo 68 > /sys/class/gpio/export");
    system("echo out > /sys/class/gpio/gpio68/direction");

    for (int i = 0; i < 10; i++) {
        system("echo 1 > /sys/class/gpio/gpio68/value");
        sleep(1);
        system("echo 0 > /sys/class/gpio/gpio68/value");
        sleep(1);
    }

    system("echo 68 > /sys/class/gpio/unexport");
    return 0;
}
