open Board.Board
open Board.Board.ToString
open Init;;

(** Prints starting message, and gets country for player.
 * TODO:
     * Random implementation **)
(* Maybe we should have a player list?
 * Have hold_bots and pass the list to
 * game_turn? *)
let initialize_players () =
    print_string "~Diplomacy!\n";
    print_string "Choose a country, or type random\n";
    print_string "Choices: England\n";
    let user_country = read_line () in
    match user_country with
    | "England" -> England
    | "France" -> France
    | "Germany" -> Germany
    | "Russia" -> Russia
    | "Austria" -> AH
    | "Turkey" -> Turkey
    | "Italy" -> Italy
    | _ -> failwith "Not a valid country"

let rec game_turn (bd : board) =
    print_string "Options:\n";
    print_string "Print the board state (B)\n";
    print_string "Print your orders (O)\n";
    print_string "Enter orders (E)\n";

    let user_option = read_line () in
    match user_option with
    | "B" -> print_string (string_of_board bd); game_turn bd

    


     
