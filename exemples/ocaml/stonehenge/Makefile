COMP=js_of_ocaml -pretty
OCAMLC=ocamlfind ocamlc -package js_of_ocaml -package lwt -pp "camlp4o $(PATHJSOFOCAML)pa_js.cmo" -package lwt.react -I $(PATHJSOFOCAML) -g  -linkpkg
NAME=app
OBJS=$(NAME).cmo 
DEP=alphabeta.cmo stoneh.cmo
PATHJSOFOCAML=/usr/lib/ocaml/js_of_ocaml/
PATHLWT=/usr/lib/ocaml/lwt/

all: $(DEP) $(NAME).js

%.js:%.byte
	$(COMP) -noruntime $(PATHJSOFOCAML)runtime.js $<

%.byte: $(DEP) $(OBJS)
	$(OCAMLC) -o $@ js_of_ocaml.cma ../../../release/lib_enyo.cmo $^

%.cmo: %.ml
	$(OCAMLC) $(DEBUG) -I ../../../release -c $<

%.cmi: %.mli
	$(OCAMLC) -c $<

clean:
	rm -f *~ *.cm[io] $(NAME).byte $(NAME).js
