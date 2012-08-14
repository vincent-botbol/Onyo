COMP=js_of_ocaml -pretty
OCAMLC=ocamlfind ocamlc -package lwt -pp "camlp4o  /home/vince/js_of_ocaml-1.2/lib/syntax/pa_js.cmo" -I /home/vince/js_of_ocaml-1.2/lib -g
NAME=stonehenge
OBJS=lib_enyo.cmo $(NAME).cmo 

all: $(NAME).js

%.js:%.byte
	$(COMP) -noruntime /home/vince/js_of_ocaml-1.2/runtime/runtime.js $<

%.byte: $(OBJS)
	$(OCAMLC) -linkpkg -o $@ js_of_ocaml.cma $^

%.cmo: %.ml
	$(OCAMLC) $(DEBUG) -c $<

%.cmi: %.mli
	$(OCAMLC) -c $<

clean:
	rm -f *~ *.cm[io] $(NAME).byte $(NAME).js
