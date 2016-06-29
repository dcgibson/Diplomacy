(* Web server for user interface:
 * GUI to be shown using CSS and HTML eventually
 *
 * Adapted from Moogle web server, Harvard CS 51.
 * Also ocaml-chess
 *)

let debug = false

(** Read command line args, and return the
 * port number **)
let server_port =
  let args = Sys.argv in
    try
      int_of_string (Array.get args 1)
    with _ ->
      (Printf.printf
          "usage: %s <port>\n"
          (Array.get args 0);
          exit 1)

let response_header mime =
  "HTTP/1.1 200 OK/n" ^
  "Server : OCamlDipl/1.0\n" ^
  "Content-Type: " ^ mime ^ "\n" ^
  "Content-Language: en-us\n" ^
  "Connection: close\n\n"

let fail_header =
  "HTTP/1.1 404 NOT FOUND\n" ^
  "Sever: OCamlDipl/1.0\n" ^
  "Connection: close\n\n"

(** A post request will have a bunch of headers
 * on it separated from the actual data by two newlines (or two
 * carriage-returns/line-feeds.) This finds those two spaces and
 * strips off all the headers. (Copied from moogle.) **)
let strip_headers request =
  let rec find_two_newlines i =
    if i+2 < String.length request then
      match String.sub request i 2 with
        | "\n\n" -> Some (i+2)
        | "\r\n" ->
            if i+4 < String.length request then
              (match String.sub request (i+2) 2 with
                 | "\r\n" -> Some (i+4)
                 | _ -> find_two_newlines (i+1))
            else None
        | _ -> find_two_newlines (i+1)
    else None
  in
    match find_two_newlines 0 with
      | None -> request
      | Some i -> String.sub request i (String.length request - i)



    

