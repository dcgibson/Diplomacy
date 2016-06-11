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
                     (** Provinces will hold a list of the 
                         provinces they're adjacent to **)
                     adjacent : province list;}
    exception NotAdjacent
    type branch = Army | Fleet
    (** Mutually recursive types **)
    type state = Succeeds | Fails | Unresolved
    type order = Attack of province | Hold | Support of force | Convoy of force * province
    and
    force = {name : branch; 
             belongs_to : country;
             occupies : province ref;
             mutable hold_strength : int;
             mutable attack_strength : int;
             command : order option;
             command_state : state}
    

    (** Provinces are (mostly) immutable, the tiles upon which the forces
        shall move and be created **)
    type board = {provs : province list;
                  forces : (force ref) list;}
    type player = {name : country;
                  supply_centers : (province ref) list;
                  force_list : (force ref) list;}

    type phase = Move | Retreat
    type season = Spring of phase | Fall of phase | Adjustment

    let is_adjacent (p1 : province) (p2 : province) : bool =
        let rec lst_search lst name =
            match lst with
            | [] -> false
            | h::t -> if h = name then true else lst_search t name
        in
        lst_search p1.adjacent p2

    let attack (bd : board) (aggressor : force) (dest : province) =
        (** Check whether provinces are adjacent **)
        if is_adjacent !(aggressor.occupies) dest = false then raise NotAdjacent
        (** Check whether dest is unoccupied
            Will be changed later when support + judge are introduced **)
        else if !(dest.occupied) = true then None
        (** 1. Change the occupied status of both provinces
            2. Change the province force points at
                (WILL THIS BE REFLECTED IN GAME BOARD ?!?!?
                 I THINK SO **)
        else Some (!(aggressor.occupies).occupied := false;
              dest.occupied := true;
              aggressor.occupies := dest;)
        

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

end



