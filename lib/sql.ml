let list_people
    (after : int option)
    (first : int option)
    (has_origin : bool option)
    (module Db : Caqti_lwt.CONNECTION) =
  let condition =
    match has_origin with
    | None -> None
    | Some true -> Some "origin IS NOT NULL"
    | Some false -> Some "origin IS NULL"
  in
  let query =
    let open Query in
    make "people"
    |> columns ["id"; "name"; "origin"]
    |> where condition
    |> order_by ["name"]
    |> offset after
    |> limit first
    |> to_query
  in
  let%lwt people_or_error =
    Db.collect_list
      (Caqti_request.collect Caqti_type.unit Person.caqti_type query)
      ()
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
