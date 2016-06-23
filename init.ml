open Board.Board

(** ENGLAND **)
let cly = {
    name = "CLY";
    supply = false;
    homeland = England;
    climate = Coastal;
    held_by = ref England;
    occupied = ref false;
}
let edi = {
    name = "EDI";
    supply = true;
    homeland = England;
    climate = Coastal;
    held_by = ref England;
    occupied = ref false;
}
let yor = {
    name = "YOR";
    supply = false;
    homeland = England;
    climate = Coastal;
    held_by = ref England;
    occupied = ref false;
}
let lon = {
    name = "LON";
    supply = true;
    homeland = England;
    climate = Coastal;
    held_by = ref England;
    occupied = ref false;
}
let wal = {
    name = "WAL";
    supply = false;
    homeland = England;
    climate = Coastal;
    held_by = ref England;
    occupied = ref false;
}
let lvp = {
    name = "LVP";
    supply = true;
    homeland = England;
    climate = Coastal;
    held_by = ref England;
    occupied = ref false;
};;



(** Generate force and add it to the board.
 * Also changes province occupied status. **)
let gen_force (prov : province) ?(fleet = false) (bd : board) =
    match prov.supply with
    | false -> raise NotSupplyCenter
    | true -> (
        let num = string_of_int (ctr ()) in
        let id = "force" ^ num in
        if (prov.climate = Coastal || fleet = true)
        then (Hashtbl.add bd.forces id {name = Fleet;
                                   belongs_to = prov.homeland;
                                   occupies = ref prov;
                                   hold_strength = ref 1;
                                   attack_strength = ref 0;
                                   command = ref Void;
                                   command_state = ref Unresolved;
        }; prov.occupied := true)
        else (Hashtbl.add bd.forces id {name = Army;
                                   belongs_to = prov.homeland;
                                   occupies = ref prov;
                                   hold_strength = ref 1;
                                   attack_strength = ref 0;
                                   command = ref Void;
                                   command_state = ref Unresolved;
        }; prov.occupied := true)
    );;


let init_board () = 
    {provs = [cly; edi; yor; lon; wal; lvp;];
     forces = Hashtbl.create 30;
     adjacents = [(cly, edi); (cly, yor); (edi, yor); (lon, yor);
                  (lon, wal); (wal, yor); (lvp, wal); (cly, lvp);];
    };;

(** Currently only initialized armies, not fleets **)
let init_forces (bd : board) =
    (** Filter all the provinces that are supply centers **)
    let lst = List.filter (fun x -> x.supply = true) bd.provs in
    List.iter (fun x -> gen_force x ~fleet:false bd) lst
