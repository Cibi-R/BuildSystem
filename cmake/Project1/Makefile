target : main.o
	gcc main.o -o out.exe
main.o : main.s
	gcc -c main.s -o main.o
main.s : main.i
	gcc -S main.i -o main.s
main.i : main.c
	gcc -E main.c -o main.i
clean :
	rm -rf *.exe *.o *.s *.i
