#include <stdio.h>
#include "file1.h"
#include "file2.h"


int main(void)
{
    printf("hello from main function\n");

    file1_print();

    file2_print();
}