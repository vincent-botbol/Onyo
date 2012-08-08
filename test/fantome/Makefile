COMP=js_of_ocaml -pretty
OCAMLC=ocamlfind ocamlc -package lwt -pp "camlp4o  /home/vince/js_of_ocaml-1.2/lib/syntax/pa_js.cmo" -I /home/vince/js_of_ocaml-1.2/lib -g
NAME=kind_test
OBJS=kind_test.cmo

all: $(NAME).js

$(NAME).js: $(NAME).byte
	$(COMP) -noruntime /home/vince/js_of_ocaml-1.2/runtime/runtime.js $(NAME).byte

$(NAME).byte: $(OBJS)
	$(OCAMLC) -linkpkg -o $@ js_of_ocaml.cma $^

%.cmo: %.ml ../lib/$(STDLIB)
	$(OCAMLC) $(DEBUG) -c $<

%.cmi: %.mli ../lib/$(STDLIB)
	$(OCAMLC) -c $<

clean:
	rm -f *~ *.cm[io] $(NAME).byte $(NAME).js
