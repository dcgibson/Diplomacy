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
    
    (** Ctr for force variable names **)
    let c = ref 0
    let ctr () : int =
        let v = !c in
        (c := v + 1 ; v)

    (** Provinces are (mostly) immutable, the tiles upon which the forces
        shall move and be created **)
    type board = {provs : province list;
                  forces : (string, force) Hashtbl.t;
                  adjacents : (province * province) list;}
    type player = {name : country;
                  supply_centers : (province ref) list;
                  force_list : (force ref) list;}

    type phase = Move | Retreat
    type season = Spring of phase | Fall of phase | Adjustment

    exception NotAdjacent
    exception NotSupplyCenter
    
    (** Works with most recent change to type board **)
    let is_adjacent (bd : board) (p1 : province) (p2 : province) : bool =
      let rec adj_search lst n1 n2 =
        match lst with
        | [] -> false
        | (h1, h2) :: t -> if (h1 = n1 && h2 = n2) || (h1 = n2 && h2 = n1)
                           then true
                           else adj_search t n1 n2
        in
        adj_search bd.adjacents p1 p2
   
    (** Generate force and add it to the board **)
    let gen_force (prov : province) ?(fleet = false) (bd : board) =
        match prov.supply with
        | false -> raise NotSupplyCenter
        | true ->
            let num = string_of_int (ctr ()) in
            let id = "force" ^ num in
            if (prov.climate = Coastal || fleet = true)
            then Hashtbl.add bd.forces id {name = Fleet;
                                       belongs_to = prov.homeland;
                                       occupies = ref prov;
                                       hold_strength = ref 1;
                                       attack_strength = ref 0;
                                       command = ref Void;
                                       command_state = ref Unresolved;
                                       }
            else Hashtbl.add bd.forces id {name = Army;
                                       belongs_to = prov.homeland;
                                       occupies = ref prov;
                                       hold_strength = ref 1;
                                       attack_strength = ref 0;
                                       command = ref Void;
                                       command_state = ref Unresolved;
                                       }
    (** Should inspect the order value for a province and test it's valid **)
    let valid_order (bd : board) (fc : province) : bool =
        match !fc.command with
        | Attack() -> is_adjacent bd h m
        | Support(h::m::t)


    let init_board () =
        let cly = {
            name = "CLY";
            supply = false;
            homeland = England;
            climate = Coastal;
            held_by = ref England;
            occupied = ref false;
        } in
        let edi = {
            name = "EDI";
            supply = true;
            homeland = England;
            climate = Coastal;
            held_by = ref England;
            occupied = ref true;
        } in
        let yor = {
            name = "YOR";
            supply = false;
            homeland = England;
            climate = Coastal;
            held_by = ref England;
            occupied = ref false;
        } in        
        
        let game_board = {provs = [cly; edi; yor];
                      forces = Hashtbl.create 30;
                      adjacents = [(cly, edi); (cly, yor); (edi, yor)];
                     } in
        gen_force cly game_board;
        gen_force edi ~fleet:true game_board;
                               
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

