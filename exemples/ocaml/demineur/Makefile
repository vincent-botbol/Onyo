COMP=js_of_ocaml -pretty
OCAMLC=ocamlfind ocamlc -package js_of_ocaml -pp "camlp4o $(PATHJSOFOCAML)pa_js.cmo" -I $(PATHJSOFOCAML) -linkpkg
NAME=app
OBJS=demineur.cmo $(NAME).cmo
DEP=
PATHJSOFOCAML=/usr/lib/ocaml/js_of_ocaml/
PATHLWT=/usr/lib/ocaml/lwt/

all: $(DEP) $(NAME).js

%.js:%.byte
	$(COMP) -noruntime $(PATHJSOFOCAML)runtime.js $<

%.byte: $(OBJS)
	$(OCAMLC) -o $@ js_of_ocaml.cma ../../../release/lib_enyo.cmo $^

demineur.cmo: demineur.ml
	ocamlc -c $<

%.cmo: %.ml
	$(OCAMLC) $(DEBUG) -I ../../../release -c $<

%.cmi: %.mli
	$(OCAMLC) -c $<

clean:
	rm -f *~ *.cm[io] $(NAME).byte $(NAME).js
