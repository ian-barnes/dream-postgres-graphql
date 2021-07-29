let person =
  let open Person in
  Graphql_lwt.Schema.(
    obj "person" ~fields:(fun _info ->
        [ field "id" ~typ:(non_null int)
            ~args:Arg.[]
            ~resolve:(fun _info person -> person.id)
        ; field "name" ~typ:(non_null string)
            ~args:Arg.[]
            ~resolve:(fun _info person -> person.name)
        ; field "origin" ~typ:string
            ~args:Arg.[]
            ~resolve:(fun _info person -> person.origin) ]))

let schema (request : Dream.request) : Dream.request Graphql_lwt.Schema.schema =
  Graphql_lwt.Schema.(
    schema
      [ io_field "person"
          ~typ:(non_null (list (non_null person)))
          ~args:Arg.[arg "after" ~typ:int; arg "first" ~typ:int]
          ~resolve:(fun _info () after first ->
            let%lwt people = Sql.fetch_people request ~after ~first in
            Lwt_result.return people) ])

let default_query = "{person(after=2,first=3) {id, name, origin}}"
