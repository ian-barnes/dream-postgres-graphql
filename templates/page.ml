open Tyxml.Html

let to_string (thing : Html_types.html elt) : string =
  Format.asprintf "%a" (pp ()) thing

let render (people : Lib.Person.t list) : string =
  html
    (head
       (title (txt "People!"))
       [link ~rel:[`Stylesheet] ~href:"/assets/main.css" ()])
    (body
       [ h1 [txt "People"]
       ; table
           (tr [th [txt "ID"]; th [txt "Name"]; th [txt "Origin"]]
           :: CCList.map Person.render people) ])
  |> to_string
