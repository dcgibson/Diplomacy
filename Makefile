all: board init engine brain

board: board.ml
	ocamlbuild board.native
init: init.ml
	ocamlbuild init.native
engine: engine.ml
	ocamlbuild engine.native

brain: brain.ml
	ocamlbuild brain.native

clean: 
	rm -rf _build *.native *.cmi *.cmo *.cmx *.o
