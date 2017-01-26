FC = gfortran
FFLAGS =
LFLAGS =

all : main

main : main.o
	$(FC) $(LFLAGS) $^ $(LIBS) -o $@

%.o : %.f90
	$(FC) $(FFLAGS) -c $< -o $@

.PHONY: clean
clean :
	rm -rf main main.o
