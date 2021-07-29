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

let schema (people : Person.t list) :
    Dream.request Graphql_lwt.Schema.schema =
  Graphql_lwt.Schema.(
    schema
      [ io_field "person"
          ~typ:(non_null (list (non_null person)))
          ~args:Arg.[arg "after" ~typ:int; arg "first" ~typ:int]
          ~resolve:(fun _info () after first ->
            let after = CCOpt.get_or ~default:0 after in
            let first =
              CCOpt.get_or ~default:(CCList.length people) first
            in
            people
            |> CCList.drop after
            |> CCList.take first
            |> Lwt_result.return) ])

let default_query = "{person {id, name, origin}}"
