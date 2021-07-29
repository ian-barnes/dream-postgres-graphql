let () =
  Dream.run
  @@ Dream.logger
  @@ Dream.sql_pool "postgres:///demo"
  @@ Dream.sql_sessions
  @@ Dream.origin_referer_check
  @@ Dream.router
       [ Dream.any "/graphql" (fun request ->
             let%lwt people = Lib.Sql.fetch_people request None None in
             request |> Dream.graphql Lwt.return (Lib.Api.schema people))
       ; Dream.get "/"
           (Dream.graphiql ~default_query:Lib.Api.default_query "/graphql")
       ; Dream.get "/view" (fun request ->
             let%lwt people = Lib.Sql.fetch_people request None None in
             Dream.html (Templates.Page.render people)) ]
  @@ Dream.not_found
