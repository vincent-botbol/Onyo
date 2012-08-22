COMP=js_of_ocaml -pretty
OCAMLC=ocamlfind ocamlc -package lwt -pp "camlp4o $(PATH_JSOFOCAML)/pa_js.cmo" -I $(PATH_JSOFOCAML) -g
NAME=App
OBJS=lib_enyo.cmo $(NAME).cmo
PATH_JSOFOCAML=/usr/lib/ocaml/js_of_ocaml

all: $(NAME).js

App.js:App.byte
	$(COMP) -noruntime $(PATH_JSOFOCAML)/runtime.js $<

App.byte: $(OBJS)
	$(OCAMLC) -linkpkg -o $@ js_of_ocaml.cma $^

lib_enyo.cmo: lib_enyo.ml
	$(OCAMLC) $(DEBUG) -c $<

App.cmo: puissance4_onyo.ml
	$(OCAMLC) $(DEBUG) -c $< -o $@

%.cmi: %.mli
	$(OCAMLC) -c $<

clean:
	rm -f *~ *.cm[io] $(NAME).byte $(NAME).js
