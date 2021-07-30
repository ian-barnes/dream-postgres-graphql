let template who =
  <html>
    <body>
      <h1>Hello <%s who %>!</h1>
    </body>
  </html>

let hello who = Dream.html (template who)

let () =
  Dream.run
  @@ Dream.logger
  @@ Dream.router [
    Dream.get "/hello" (fun _ -> hello "world")
    ; Dream.get "/hello/:who" (fun request -> hello (Dream.param "who" request))
  ]
  @@ Dream.not_found
