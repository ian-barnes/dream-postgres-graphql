val fetch_people :
     Dream.request
  -> after:int option
  -> first:int option
  -> has_origin:bool option
  -> Person.t list Lwt.t
