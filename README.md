clhyent — A client for hyponome
-------------------------------------------------------------------------------
%%VERSION%%

clhyent is TODO

clhyent is distributed under the Apache-2.0 license.

Homepage: https://github.com/henrytill/clhyent  

## Installation

clhyent can be installed with `opam`:

    opam install clhyent

If you don't use `opam` consult the [`opam`](opam) file for build
instructions.

## Documentation

The documentation and API reference is generated from the source
interfaces. It can be consulted [online][doc] or via `odig doc
clhyent`.

[doc]: https://henrytill.github.io/clhyent/doc

## Sample programs

If you installed clhyent with `opam` sample programs are located in
the directory `opam var clhyent:doc`.

In the distribution sample programs and tests are located in the
[`test`](test) directory. They can be built and run
with:

    topkg build --tests true && topkg test 
