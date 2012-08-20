RELEASE_FOLDER=release
PATHEXE=printer

all:
	$(MAKE) -C $(PATHEXE) all
	mkdir -p $(RELEASE_FOLDER)
	$(PATHEXE)/printer > $(RELEASE_FOLDER)/lib_enyo.ml
	@echo "[Library]"
	cd $(RELEASE_FOLDER) && ocamlfind ocamlc -package lwt -pp "camlp4o  /home/vince/js_of_ocaml-1.2/lib/syntax/pa_js.cmo" -I /home/vince/js_of_ocaml-1.2/lib -g js_of_ocaml.cma -linkpkg -o lib_enyo.cma -a lib_enyo.ml 


clean:
	$(MAKE) -C $(PATHEXE) clean