COMP=js_of_ocaml -pretty
OCAMLC=ocamlfind ocamlc -package lwt -pp "camlp4o  $(PATHJSOFOCAML)pa_js.cmo" -I $(PATHJSOFOCAML) -g
NAME=app
OBJS=$(NAME).cmo 
DEP=alphabeta.cmo stoneh.cmo
PATHJSOFOCAML=/usr/lib/ocaml/js_of_ocaml/

all: $(DEP) $(NAME).js

%.js:%.byte
	$(COMP) -noruntime $(PATHJSOFOCAML)runtime.js $<

%.byte: $(DEP) $(OBJS)
	$(OCAMLC) -linkpkg -o $@ js_of_ocaml.cma ../../../release/lib_enyo.cmo $^

%.cmo: %.ml
	$(OCAMLC) $(DEBUG) -I ../../../release -c $<

%.cmi: %.mli
	$(OCAMLC) -c $<

clean:
	rm -f *~ *.cm[io] $(NAME).byte $(NAME).js
