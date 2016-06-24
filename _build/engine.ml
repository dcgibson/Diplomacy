open Board.Board
open Board.Board.ToString
open Init;;

let game_board = init_board ();;
init_forces game_board;;

print_string "~Diplomacy!\n";
print_string (string_of_board game_board) ^ "\n";
print_string "Choose a country, or type random\n";
print_string "Choices: England\n";;

let user1_country = read_line () in
print_string user1_country;



