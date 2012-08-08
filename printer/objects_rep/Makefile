COMP=ocamlc
TARGETS=\
struct_types\
gesture_event\
object\
component\
uicomponent\
control\
onyxToolbar\
onyxIcon\
onyxIconButton\
image\
group_item\
tool_decorator\
button\
onyxButton\
canvas\
input\
enyo_tree_objects

OBJS=$(addsuffix .cmo, $(TARGETS))
LIBTARGET=libobj.cma

all: $(OBJS)
	ocamlc -a $^ -o $(LIBTARGET)

%.cmo:%.ml
	$(COMP) -c $<

clean:
	rm -f *~ *.cm[ioa]