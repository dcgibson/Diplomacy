open Board.Board
open Board.Board.ToString
open Init;;

(** Prints starting message, and gets country for player.
 * TODO:
     * Random implementation **)
let start_message () : country =
    print_string "~Diplomacy!\n";
    print_string "Choose a country, or type random\n";
    print_string "Choices: England\n";

    let user_country = read_line () in
    if user_country = "England" then England
    else if user_country = "France" then France
    else if user_country = "Germany" then Germany
    else if user_country = "Russia" then Russia
    else if user_country = "Austria" then AH
    else if user_country = "Turkey" then Turkey
    else if user_country = "Italy" then Italy
    else failwith "Not a valid country" ;;

let c = start_message () in
print_string (string_of_country c)
     
