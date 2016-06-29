all: board init engine

board: board.ml
	ocamlbuild board.native
init: init.ml
	ocamlbuild init.native
engine: engine.ml
	ocamlbuild engine.native

clean: 
	rm -rf _build *.native *.cmi *.cmo *.cmx *.o
