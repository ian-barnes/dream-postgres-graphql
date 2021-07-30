let caqti_type_in =
  let open Caqti_type in
  let ( ** ) = tup2 in
  option int ** option int

let to_caqti_type_in (after : int option) (first : int option) :
    int option * int option =
  (after, first)

let caqti_type_out =
  let open Caqti_type in
  let ( ** ) = tup2 in
  int ** string ** option string

let basic_query =
  Caqti_request.collect caqti_type_in caqti_type_out
    {| SELECT id, name, origin 
       FROM people
       ORDER BY name
       OFFSET ? LIMIT ? |}

let filtered_query_null =
  Caqti_request.collect caqti_type_in caqti_type_out
    {| SELECT id, name, origin 
       FROM people
       WHERE origin IS NULL
       ORDER BY name
       OFFSET ? LIMIT ? |}

let filtered_query_not_null =
  Caqti_request.collect caqti_type_in caqti_type_out
    {| SELECT id, name, origin 
      FROM people
      WHERE origin IS NOT NULL
      ORDER BY name
      OFFSET ? LIMIT ? |}

let list_people
    (after : int option)
    (first : int option)
    (has_origin : bool option)
    (module Db : Caqti_lwt.CONNECTION) =
  let%lwt people_or_error =
    match has_origin with
    | None -> Db.collect_list basic_query (to_caqti_type_in after first)
    | Some true ->
      Db.collect_list filtered_query_not_null (to_caqti_type_in after first)
    | Some false ->
      Db.collect_list filtered_query_null (to_caqti_type_in after first)
  in
  Caqti_lwt.or_fail people_or_error

let fetch_people
    (request : Dream.request)
    ~(after : int option)
    ~(first : int option)
    ~(has_origin : bool option) : Person.t list Lwt.t =
  let open Lwt.Infix in
  Dream.sql request (list_people after first has_origin)
  >|= CCList.map Person.of_caqti_tuple
