(*---------------------------------------------------------------------------
   Copyright (c) 2017 Henry Till. All rights reserved.
   Distributed under the Apache-2.0 license, see terms at the end of the file.
   %%NAME%% %%VERSION%%
  ---------------------------------------------------------------------------*)

let cstruct_to_bytes cs =
  let len = Cstruct.len cs in
  let ret = Bytes.create len in
  Cstruct.blit_to_bytes cs 0 ret 0 len;
  ret

let bytes_to_file_chunk bs =
  let hs = cstruct_to_bytes (Nocrypto.Hash.(digest `SHA1 (Cstruct.of_bytes bs))) in
  File_chunk_types.({ hash = hs; data = bs })

let write_file_chunk fc file =
  let encoder = Pbrt.Encoder.create () in
  File_chunk_pb.encode_file_chunk fc encoder;
  let out_channel = open_out file in
  output_bytes out_channel (Pbrt.Encoder.to_bytes encoder);
  close_out out_channel

let read_file_chunk file =
  let bytes =
    let ic = open_in file in
    let len = in_channel_length ic in
    let bytes = Bytes.create len in
    really_input ic bytes 0 len;
    close_in ic;
    bytes
  in
  File_chunk_pb.decode_file_chunk (Pbrt.Decoder.of_bytes bytes)

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
