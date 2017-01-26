################################################################################
FC = gfortran
FFLAGS =
LFLAGS =

all : main.x

main.x: main.o mymod.o
	$(FC) $(LFLAGS) $^ $(LIBS) -o $@

%.o   : %.f90 mymod.mod
	$(FC) $(FFLAGS) -c $< -o $@

%.mod : %.f90
	$(FC) $(FFLAGS) -c $< -o $(@:%.mod=%.o)
	@touch $@

.PHONY: clean
clean :
	rm -rf main.x main.o mymod.o mymod.mod
################################################################################
