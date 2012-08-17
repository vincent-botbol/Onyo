COMP=ocamlc
TARGETS=labels valuesPrinter methodsPrinter attributesPrinter eventsPrinter constructorsPrinter objectTreePrinter eventsListPrinter modulePrinter printer
INCLUDE=-I objects_rep
LIB=libobj.cma
OBJS=$(addsuffix .cmo, $(TARGETS))
EXE=printer

all: objects_rep/$(LIB) $(EXE) 

objects_rep/$(LIB):
	$(MAKE) -C objects_rep

$(EXE): $(OBJS)
	$(COMP) -o $@ $(INCLUDE) $(LIB) $^

%.cmo:%.ml
	$(COMP) -c $(INCLUDE) $(LIB) $<

clean:
	rm -f *~ *.cm[io] $(EXE)
	$(MAKE) -C objects_rep clean