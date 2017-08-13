#!/usr/bin/env ocaml
#use "topfind"
#require "topkg"
#require "rresult"
open Topkg

let rec fold_until f p z = function
  | [] ->
      z
  | x :: xs ->
      let curr = f z x in
      if p curr then
        curr
      else
        fold_until f p curr xs

let generate_from_protos c =
  let open Fpath in
  (* let build_dir = Conf.build_dir c // "src" in *)
  let build_dir = "src_generated" in
  let generate_from file =
    Cmd.(v "ocaml-protoc"
         % "-binary"
         % "-ml_out" % build_dir
         % "-I" % "protobuf"
         % file)
  in
  let files =
    [ "protobuf/file.proto"
    ; "protobuf/file_info.proto"
    ; "protobuf/file_chunk.proto"
    ]
  in
  OS.Cmd.run Cmd.(v "mkdir" % "-p" % build_dir) >>= fun _ ->
  fold_until
    (fun acc file -> OS.Cmd.run (generate_from file))
    Rresult.R.is_error
    (Ok ())
    files

let () =
  Pkg.describe "clhyent"
    ~licenses:[Pkg.std_file "LICENSE"]
    ~build:(Pkg.build ~pre:generate_from_protos ())
  @@ fun c -> Ok [ Pkg.mllib ~api:["Clhyent"] "src/clhyent.mllib"
                 ; Pkg.test "test/test"
                 ]
