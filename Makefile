RELEASE_FOLDER=release
PATHEXE=printer
PATHJSOFOCAML=$(shell ocamlfind query js_of_ocaml)/
all:
	$(MAKE) -C $(PATHEXE) all
	mkdir -p $(RELEASE_FOLDER)
	$(PATHEXE)/printer > $(RELEASE_FOLDER)/lib_enyo.ml
	cd $(RELEASE_FOLDER) && ocamlfind ocamlc -package lwt -pp "camlp4o  $(PATHJSOFOCAML)pa_js.cmo" -I $(PATHJSOFOCAML) -g js_of_ocaml.cma -linkpkg -c lib_enyo.ml 


clean:
	$(MAKE) -C $(PATHEXE) clean
