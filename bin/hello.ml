let template who =
  let open Tyxml.Html in
  html (head (title (txt "Hello")) []) (body [h1 [txt ("Hello " ^ who)]])
  |> Format.asprintf "%a" (pp ())

let hello who = Dream.html (template who)

let () =
  Dream.run
  @@ Dream.logger
  @@ Dream.router
       [ Dream.get "/hello" (fun _ -> hello "world")
       ; Dream.get "/hello/:who" (fun request ->
             hello (Dream.param "who" request)) ]
  @@ Dream.not_found
