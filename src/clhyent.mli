(*---------------------------------------------------------------------------
   Copyright (c) 2017 Henry Till. All rights reserved.
   Distributed under the Apache-2.0 license, see terms at the end of the file.
   %%NAME%% %%VERSION%%
  ---------------------------------------------------------------------------*)

(** A client for hyponome

    {e %%VERSION%% — {{:%%PKG_HOMEPAGE%% }homepage}} *)

(** {1 Clhyent} *)

val cstruct_to_bytes : Cstruct.t -> Bytes.t

val bytes_to_file_chunk : Bytes.t -> File_chunk_types.file_chunk

val write_file_chunk : File_chunk_types.file_chunk -> string -> unit

val read_file_chunk : string -> File_chunk_types.file_chunk

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
