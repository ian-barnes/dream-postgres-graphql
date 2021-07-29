let () =
  Dream.run
  @@ Dream.logger
  @@ Dream.sql_pool "postgres:///demo"
  @@ Dream.sql_sessions
  @@ Dream.origin_referer_check
  @@ Dream.router
       [ Dream.any "/graphql" (fun request ->
             request |> Dream.graphql Lwt.return (Lib.Api.schema request))
       ; Dream.get "/"
           (Dream.graphiql ~default_query:Lib.Api.default_query "/graphql")
       ; Dream.get "/view" (fun request ->
             let after =
               Dream.query "after" request |> CCOpt.map int_of_string
             in
             let first =
               Dream.query "first" request |> CCOpt.map int_of_string
             in
             let%lwt people = Lib.Sql.fetch_people request ~after ~first in
             Dream.html (Templates.Page.render people)) ]
  @@ Dream.not_found
