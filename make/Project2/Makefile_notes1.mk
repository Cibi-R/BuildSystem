# Empty Targets
# 1. Phony targets are always out of date, so they always execute and they always cause their dependent to be remade.
# 2. But suppose we have some command, with no output file, that needs to be performed only occasionally and we don’t want our 
#    dependents updated? For this, we can make a rule whose target is an empty file (sometimes referred to as a cookie)
# prog: size prog.o
# 	$(CC) $(LDFLAGS) -o $@ $^
# size: prog.o
#	size $^
#	touch size
# 3. size target is executed whenever the  prog.o is updated.
# 4. 