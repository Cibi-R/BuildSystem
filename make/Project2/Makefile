# Managing Projects with GNU Make
# Chapter 2

#  Since the target of one rule can be referenced as a prerequisite in another rule, the set of targets and prerequisites form a
#  chain or graph of dependencies (short for “dependency graph”). Building and processing this dependency graph to update the requested
#  target is what make is all about
#  Since rules are so important in make, there are a number of different kinds of rules.
#  1. Explicit rule
#  2. Pattern rule 
#  3. Static Pattern rule
#  4. Suffix rule
#  5. Implicit rule (either pattern rules or suffix rules)  

main1 : main1.o
	gcc main1.o -o main1.exe
# $^ will be expanded to all prerequisites
# $@ will be expanded to target
.PHONY : main1.o # by making main.o as phony target the source is compiled everytime.
main1.o : main1.c 
	gcc -c $^ -o $@
.PHONY : clean
clean:
	rm -rf *.o *.exe 

# Explicit Rules
# 1. Most rules you will write are explicit rules that specify particular files as targets and prerequisites.
# 2. A rule can have more than one target. This means that each target has the same set of prerequisites as the others.
# 3. If the targets are out of date, the same set of actions will be performed to update each one.
#    vpath.o variable.o: make.h config.h getopt.h gettext.h dep.h
#
#    This line has the same effect as:
#    vpath.o: make.h config.h getopt.h gettext.h dep.h
#    variable.o: make.h config.h getopt.h gettext.h dep.h
#
# 4. A rule does not have to be defined “all at once.”  Each time make sees a target file it adds the target and prerequisites 
#    to the dependency graph. If a target has already been seen and exists in the graph, any additional prerequisites are appended 
#    to the target file entry in make’s dependency graph.
# 5. In more complex cases, the prerequisite list can be composed of files that are managed very differently
#    vpath.o: lexer.c
#    vpath.o: vpath.c
#    	$(COMPILE.c) $(RULE_FLAGS) $(OUTPUT_OPTION) $<
#    a. The first rule says that the vpath.o target must be updated whenever lexer.c is updated
#    b. The rule also works to ensure that a prerequisite is always updated before the target is updated.

# Wildcards
# 1. A makefile often contains long lists of files. To simplify this process make supports wildcards (also known as globbing).
# 2. It is important to be careful with wildcards, however. It is easy to misuse them as the
#    "*.o: constants.h" this expanded as ": constants.h" in a clean directory, note there is not target in the rule when it is expanded.
# 3. wildcard expansion is performed by make when the pattern appears as a target or prerequisite. However, when the 
#    pattern appears in a command, the expansion is performed by the subshell.
# 
# Phony Targets
# 1. Targets that do not represent files are known as phony targets. clean target in the above command is a phony target.
# 2. Normally, phony targets will always be executed because the commands associated with the rule do not create the target name.
# 3. It is important to note that make cannot distinguish between a file target and phony target. If by chance the name of a phony 
#    target exists as a file, make will associate the with the phony target name in its dependency graph and it would result in
#    inintented result when executing "make clean", make: `clean' is up to date. since there is file called "clean"
# 4. To avoid this problem, GNU make includes a special target, .PHONY, to tell make that a target is not a real file.
# 5. Any target can be declared phony by including it as a prerequisite of .PHONY
#
#  .PHONY: clean
#  clean:
#  rm -f *.o lexer.c
#
# 6. Now make will always execute the commands associated with clean even if a file named clean exists. 
# 7. In addition to marking a target as always out of date, specifying that a target is phony tells make that this file does
#    not follow the normal rules for making a target file from a source file. Therefore, make can optimize its normal rule
#    search to improve performance.
# 8. In-case if we want to create all targets every time we run the make use phony target.
#    .PHONY: all
#    all: bash bashbug
# 9. Phony targets are always out of date
# 
# Standard Phony targets
#
# all Perform all tasks to build the application
# install   -  Create an installation of the application from the compiled binaries
# clean     -  Delete the binary files generated from sources
# distclean -  Delete all the generated files that were not in the original source distribution
# TAGS      -  Create a tags table for use by editors
# info      -  Create GNU info files from their Texinfo sources
# check     -  Run any tests associated with this application
