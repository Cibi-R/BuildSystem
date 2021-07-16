

# Make program will read the make file and execute the first target it finds, If a target is included as a command-line argument,
# that target is updated if no command line arguments are given, then the first target in the file is used, called the "default goal"
# or "default rule" 

# Make is a set of rules used to build an application, A rule consists of three parts: the target, its prerequisites and command to
# execute
# target : prereq1 prereq2
#          commands

# Below we have two target main1 and main2
main1 : main1.o 
	gcc main1.c -o main1.exe
main1.o : main1.c 
	gcc -c main1.c -o main1.o
main2 : main2.o
	gcc main2.o -o main2.exe
main2.o : main2.c 
	gcc -c main2.c 
clean :
	rm -rf *.exe *.o

# 1. When a make is asked to evalute a rule, it begins by finding the files indicated by target and prerequisites
# 2. If any of the pre requisites has associated has an associated rule, make attempts to update those first. Next, the target 
#    file is considered.
# 3. If any prerequisite is newer than the target, the target is remade by executing the commands.
# 4. Each command line is passed to the shell and is executed in its own subshell. If any of the commands generates an error,
#    the building of the target is terminated and make exits.
# 5. One file is considered newer than another if it has been modified more recently.

# Dependency Checking
# 
# target : prereq1 prereq2 -lfl
#          commands
# 1. The make first chects the prerequisites of the default rule or the rule that passed through the command line argument
# 2. In the above example, the make first solves the prereq1 after completely resolving the prereq1 the make moves to prereq2
# 3. In -lfl, The -l option to gcc indicates a system library that must be linked into the application. The actual library name 
#    indicated by “fl” is libfl.a
# 4. When a prerequisite of the form -l<NAME> is seen, make searches for a file of the form libNAME.so; if no match is found,
#    it then searches for libNAME.a. Here make finds /usr/lib/libfl.a and proceeds with the final action, linking.
# 
# Invoking Make
# 1. The make description file is called makefile, Makefile, or GNUMakefile
# 2. We can pass multiple target at the same time. for above program we can give "make main1 main2" to compile both target at the
#    same time
# 3. If you specify a target that is not in the makefile and for which there is no implicit rule (discussed in Chapter 2), 
#    make will respond with "make: *** No rule to make target `non-existent-target'. Stop."
# 4. make has many command-line options. One of the most useful is --just-print (or -n) which tells make to display the commands
#    it would execute for a particular target without actually executing them. ex. make main1 main2 --just-print
# 5. It is also possible to set almost any makefile variable on the command line to override the default value or the value set in
#    the makefile
# 