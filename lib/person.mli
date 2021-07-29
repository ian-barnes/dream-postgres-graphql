type t =
  { id : int
  ; name : string
  ; origin : string option }

val of_caqti_tuple : int * (string * string option) -> t

val option_to_string : string option -> string
