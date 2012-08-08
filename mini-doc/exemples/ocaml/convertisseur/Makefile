COMP=js_of_ocaml -pretty
OCAMLC=ocamlfind ocamlc -package lwt -pp "camlp4o /home/vince/js_of_ocaml-1.2/lib/syntax/pa_js.cmo" -I /home/vince/js_of_ocaml-1.2/lib -g
NAME=App
OBJS=$(NAME).cmo

all: $(NAME).js

$(NAME).js: $(NAME).byte
	$(COMP) -noruntime /home/vince/js_of_ocaml-1.2/runtime/runtime.js $(NAME).byte

%.byte: %.cmo
	$(OCAMLC) -linkpkg -o $@ js_of_ocaml.cma $^

%.cmo: %.ml
	$(OCAMLC) $(DEBUG) -c $<

clean:
	rm -f *~ *.cm[io] $(NAME).byte