open Tyxml.Html

let render (t : Lib.Person.t) : Html_types.tr elt =
  let open Lib.Person in
  tr
    [ td [txt (t.id |> string_of_int)]
    ; td [txt t.name]
    ; td [txt (option_to_string t.origin)] ]
