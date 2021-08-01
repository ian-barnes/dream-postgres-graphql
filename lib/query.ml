type t =
  { columns : string list
  ; table : string
  ; where : string option
  ; order : string list
  ; offset : int option
  ; limit : int option }

let make table =
  {columns = []; table; where = None; order = []; offset = None; limit = None}

let columns cols t = {t with columns = cols}

let where condition t = {t with where = condition}

let order_by columns t = {t with order = columns}

let limit n t = {t with limit = n}

let offset n t = {t with offset = n}

let to_query t =
  let columns =
    match t.columns with
    | [] -> "*"
    | _ -> CCString.concat ", " t.columns
  in
  let where =
    match t.where with
    | None -> ""
    | Some condition -> " WHERE " ^ condition
  in
  let order =
    match t.order with
    | [] -> ""
    | _ -> " ORDER BY " ^ CCString.concat ", " t.order
  in
  let offset =
    match t.offset with
    | None -> ""
    | Some offset -> " OFFSET " ^ string_of_int offset
  in
  let limit =
    match t.limit with
    | None -> ""
    | Some limit -> " LIMIT " ^ string_of_int limit
  in
  Printf.sprintf "SELECT %s FROM %s%s%s%s%s" columns t.table where order offset
    limit
