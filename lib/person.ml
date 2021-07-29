type t =
  { id : int
  ; name : string
  ; origin : string option }

let of_caqti_tuple tuple =
  let (id, (name, origin)) = tuple in
  {id; name; origin}

let option_to_string = function
  | None -> "<None>"
  | Some s -> s
