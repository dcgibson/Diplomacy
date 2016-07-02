module Board =
struct
    type country = England | France | Germany | Russia | Italy |
                   Turkey | AH | Neutral
    type climate = Inland | Coastal | Ocean
    type province = {name : string;
                     supply : bool; 
                     homeland : country;
                     climate : climate;
                     held_by : country ref;
                     occupied : bool ref;
                     }
    type branch = Army | Fleet
    type state = Succeeds | Fails | Unresolved
    type order = Attack of province list | Hold | Support of force |
                 Convoy of force * province list | Void
    and
    force = {name : branch; 
             belongs_to : country;
             occupies : province ref;
             hold_strength : int ref;
             attack_strength : int ref;
             command : order ref;
             command_state : state ref;}


    (** Provinces are (mostly) immutable, the tiles upon which the forces
        shall move and be created **)
    type board = {provs : province list;
                  forces : (string, force) Hashtbl.t;
                  adjacents : (province * province) list;}

    (** Have yet to do anything with type player.
     * Possibly important in replacing is_won. **)
    type player = {name : country;
                  supply_centers : (province ref) list;
                  force_list : (force ref) list;}

    type phase = Move | Retreat
    type season = Spring of phase | Fall of phase | Adjustment

    exception NotAdjacent
    exception NotSupplyCenter

    (** Ctr for force variable names **)
    let c = ref 0
    let ctr () : int =
        let v = !c in
        (c := v + 1 ; v) 

    (** Tests whether a province list is a valid path.
     * Basically whether each pair of provinces in the
     * list are a tuple in the game board's adjacent list. **)
    let rec is_adjacent (bd : board) (lst : province list) : bool =
        (** Searches the adjacency list of board for two names together **)
        let rec adj_search lst n1 n2 =
            match lst with
            | [] -> false
            | (h1, h2) :: t -> if (h1 = n1 && h2 = n2) || (h1 = n2 && h2 = n1)
                               then true
                               else adj_search t n1 n2
        in
        match lst with
        | [] -> true
        | _::[] -> true
        | h::m::t -> if (adj_search bd.adjacents h m) then (is_adjacent bd (m::t))  
                     else false
    
    
    (** Should inspect the order value for a province and test it's valid **)
    let valid_order (bd : board) (fc : force) : bool =
        match !(fc.command) with
        | Attack(move_path) -> is_adjacent bd move_path 
        | Support(other_force) -> is_adjacent bd [!(fc.occupies); !(other_force.occupies)]
        | Convoy(other_force, move_path) -> 
                (is_adjacent bd [!(fc.occupies); !(other_force.occupies)]) &&
                (is_adjacent bd ((!(fc.occupies))::move_path))
        | _ -> true
    
    
    
    (** This whole function may be unnecessary, if we compute the sum of each
     * country's SC at the end of the year, we test within that function, and if
     * SC >= 18, call the function to end the game. **)
    let is_won (bd : board) : country option =
        (** Mutable array to hold the # of SC's
         * E; F; G; R; AH; T; I **)
        let num_centers = [| 0; 0; 0; 0; 0; 0; 0 |] in
        (** Increment the respective array value based on
         * which country holds the supply center.
         * Also checks that province is SC **)
        let sc_incr prov arr =
            if prov.supply then (
                let p = !(prov.held_by) in
                if p = England then arr.(0) <- (arr.(0) + 1)
                else if p = France then arr.(1) <- (arr.(1) + 1)
                else if p = Germany then arr.(2) <- (arr.(2) + 1)
                else if p = Russia then arr.(3) <- (arr.(3) + 1)
                else if p = AH then arr.(4) <- (arr.(4) + 1)
                else if p = Turkey then arr.(5) <- (arr.(5) + 1)
                else if p = Italy then arr.(6) <- (arr.(6) + 1)
            )
            else ()
        in
        List.iter (fun x -> sc_incr x num_centers) bd.provs;
        (** Traverse num_centers, building bool list of winning countries.
         * Maybe use Array.fold_left? **)
        let win_gen (lst : bool list) (num : int) : bool list =
            (num >= 18) :: lst
        in
        (* This is the bool list containing truth values for whether
         * each country has won *)
        let win_lst = Array.fold_left win_gen [] num_centers in
        (* This function returns an int corresponding to the 
         * "index" of the winning country, i.e.:
             * 0 = England
             * 1 = France
             * 2 = Germany... *)
        let rec winner (lst : bool list) (sum : int) =
            match lst with
            | [] -> -1
            | h::t -> if h = true then sum else winner t (sum + 1)
        in
        let index = winner win_lst 0 in
        match index with
        | 0 -> Some England
        | 1 -> Some France
        | 2 -> Some Germany
        | 3 -> Some Russia
        | 4 -> Some AH
        | 5 -> Some Turkey
        | 6 -> Some Italy
        | _ -> None

    module ToString = 
    struct
        let string_of_country (x : country) : string =
            match x with
            | England -> "England"
            | France -> "France"
            | Germany -> "Germany"
            | Russia -> "Russia"
            | Turkey -> "Turkey"
            | AH -> "Austria-Hungary"
            | Italy -> "Italy"
            | Neutral -> "Neutral"

        let string_of_province (x : province) : string =
            x.name

        (** Army Pic (England) **)
        let string_of_force (x : force) : string =
            let string_of_branch (name : branch) : string =
                match name with
                | Army -> "Army"
                | Fleet -> "Fleet"
            in
            (string_of_branch x.name) ^ " " ^ 
            (string_of_province !(x.occupies)) ^ " (" ^
            (string_of_country x.belongs_to) ^ ")"

        let string_of_board (bd : board) : string =
            let rec string_of_provs (lst : province list) : string =
                match lst with
                | [] -> ""
                | h::t -> (string_of_province h) ^ "\n" ^ string_of_provs t
            in
            (** First creates list of forces from hashtbl,
             * then recursively loops through, converting forces
             * to strings **)
            let string_of_forces (tbl : (string, force) Hashtbl.t) =
                let lst = Hashtbl.fold (fun _ value l -> value :: l) tbl []
                in
                let rec helper (lst : force list) : string =
                    match lst with
                    | [] -> ""
                    | h::t -> (string_of_force h) ^ "\n" ^ helper t
                in
                helper lst
            in
            "Provinces:\n" ^ (string_of_provs bd.provs) ^
            "Forces:\n" ^ (string_of_forces bd.forces)

    end
end;;


