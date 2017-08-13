(*---------------------------------------------------------------------------
   Copyright (c) 2017 Henry Till. All rights reserved.
   Distributed under the Apache-2.0 license, see terms at the end of the file.
   %%NAME%% %%VERSION%%
  ---------------------------------------------------------------------------*)

let file_chunks_equal fc1 fc2 =
  let open File_chunk_types in
  Bytes.equal fc1.hash fc2.hash && Bytes.equal fc1.data fc2.data

let round_trip s =
  let bs = Bytes.of_string s in
  let open Clhyent in
  let fc = bytes_to_file_chunk bs in
  let file = Filename.temp_file "clhyent-" "-test" in
  write_file_chunk fc file;
  file_chunks_equal fc (read_file_chunk file)

let test =
  QCheck.Test.make ~count:50 ~name:"round trip" QCheck.string round_trip

let () =
  QCheck.Test.check_exn test

(*---------------------------------------------------------------------------
   Copyright 2017 Henry Till

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
  ---------------------------------------------------------------------------*)
