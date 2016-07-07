open Board.Board
open Board.Board.ToString
open Init;;

(** Prints starting message, and gets country for player.
 * TODO:
     * Random implementation **)

(* Maybe we should have a player list?
 * Have hold_bots and pass the list to
 * game_turn? *)

(* How are we going to build a dynamic AI?
 * It will need to be of type player.
 * Each turn it will need to give hold orders
 * to all the forces it has.
 * 
 * We'll have a function that takes either
 * a player or player list, depending, and then
 * gives hold orders. *)

(* This will just return the country that the player chose.
 * Later we'll need to initialize the other players, who
 * the AI program will be acting upon. *)
let init_user bd =
    print_string "~Diplomacy!\n";
    let init_country () =
        print_string "Choose a country, or type random\n";
        print_string "Choices: England, France, Germany, Russia, Austria, Turkey, Italy\n";
        let user_country = read_line () in
        match user_country with
        | "England" -> England
        | "France" -> France
        | "Germany" -> Germany
        | "Russia" -> Russia
        | "Austria" -> AH
        | "Turkey" -> Turkey
        | "Italy" -> Italy
        | "random" | "Random" ->
                Random.self_init ();
                let index = Random.int 7 in
                let countries = [England; France; Germany; AH; Turkey; Italy] in
                List.nth countries index
        | _ -> failwith "Not a valid country"
    in
    let user_country = init_country () in
    print_string ((string_of_country user_country) ^ "\n");
    {name = user_country;
     supply_centers = sc_ref_list bd user_country;
     force_list = fc_ref_list bd user_country;}

let rec game_turn (bd : board) =
    print_string "Options:\n";
    print_string "Print the board state (B)\n";
    print_string "Print your orders (O)\n";
    print_string "Enter orders (E)\n";

    let user_option = read_line () in
    match user_option with
    | "B" -> print_string (string_of_board bd); game_turn bd
    | _ -> ()

let start_game () =

    let game_board = init_forces init_board in
    let user = init_user game_board in

    let countries = [England; France; Germany; Russia; Turkey; AH; Italy] in
    let ai_countries = List.filter (fun x -> x != user.name) countries in
    true
;;

start_game ()





    


     
