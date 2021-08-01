type t

(* = {
   columns : string list;
   table : string;
   where : string option;
   order : string list;
   offset : int option;
   limit : int option; } *)

val make : string -> t

val columns : string list -> t -> t

val where : string option -> t -> t

val order_by : string list -> t -> t

val limit : int option -> t -> t

val offset : int option -> t -> t

val to_query : t -> string
