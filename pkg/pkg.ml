#!/usr/bin/env ocaml
#use "topfind"
#require "topkg"
open Topkg

let () =
  Pkg.describe "clhyent" @@ fun c ->
  Ok [ Pkg.mllib "src/clhyent.mllib";
       Pkg.test "test/test"; ]
