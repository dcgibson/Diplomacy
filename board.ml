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
    exception NotAdjacent
    type branch = Army | Fleet
    (** Mutually recursive types **)
    type state = Succeeds | Fails | Unresolved
    type movePath = province list 
    type order = Attack of movePath | Hold | Support of force |
                 Convoy of force * movePath | Void
    and
    force = {name : branch; 
             belongs_to : country;
             occupies : province ref;
             mutable hold_strength : int;
             mutable attack_strength : int;
             command : order ref;
             command_state : state}
    

    (** Provinces are (mostly) immutable, the tiles upon which the forces
        shall move and be created **)
    type board = {provs : province list;
                  forces : (force ref) list;
                  adjacents : (province * province) list;}
    type player = {name : country;
                  supply_centers : (province ref) list;
                  force_list : (force ref) list;}

    type phase = Move | Retreat
    type season = Spring of phase | Fall of phase | Adjustment

    let is_adjacent (bd : board) (p1 : province) (p2 : province) : bool =
      let rec adj_search lst n1 n2 =
        match lst with
        | [] -> false
        | (h1, h2) :: t -> if (h1 = n1 && h2 = n2) || (h1 = n2 && h2 = n1)
                           then true
                           else adj_search t n1 n2
        in
        adj_search bd.adjacents p1 p2

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
            let rec string_of_forces (lst : (force ref) list) : string =
                match lst with
                | [] -> ""
                | h::t -> (string_of_force !h) ^ "\n" ^ string_of_forces t
            in
            "Provinces:\n" ^ (string_of_provs bd.provs) ^
            "Forces:\n" ^ (string_of_forces bd.forces)

    end

    let init_board =
        

end



