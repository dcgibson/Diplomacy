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
}

(** France **)
let bre = {
    name = "BRE";
    supply = true;
    homeland = France;
    climate = Coastal;
    held_by = ref France;
    occupied = ref false;
}
let pic = {
    name = "PIC";
    supply = false;
    homeland = France;
    climate = Coastal;
    held_by = ref France;
    occupied = ref false;
}
let bur = {
    name = "BUR";
    supply = false;
    homeland = France;
    climate = Inland;
    held_by = ref France;
    occupied = ref false;
}
let mar = {
    name = "MAR";
    supply = true;
    homeland = France;
    climate = Coastal;
    held_by = ref France;
    occupied = ref false;
}
let gas = {
    name = "GAS";
    supply = false;
    homeland = France;
    climate = Coastal;
    held_by = ref France;
    occupied = ref false;
}
let par = {
    name = "PAR";
    supply = true;
    homeland = France;
    climate = Inland;
    held_by = ref France;
    occupied = ref false;
}

(* Germany *)
let kie = {
    name = "KIE";
    supply = true;
    homeland = Germany;
    climate = Coastal;
    held_by = ref Germany;
    occupied = ref false;
}
let ber = {
    name = "BER";
    supply = true;
    homeland = Germany;
    climate = Coastal;
    held_by = ref Germany;
    occupied = ref false;
}
let pru = {
    name = "PRU";
    supply = false;
    homeland = Germany;
    climate = Coastal;
    held_by = ref Germany;
    occupied = ref false;
}
let sil = {
    name = "SIL";
    supply = false;
    homeland = Germany;
    climate = Inland;
    held_by = ref Germany;
    occupied = ref false;
}
let mun = {
    name = "MUN";
    supply = true;
    homeland = Germany;
    climate = Inland;
    held_by = ref Germany;
    occupied = ref false;
}
let ruh = {
    name = "RUH";
    supply = false;
    homeland = Germany;
    climate = Inland;
    held_by = ref Germany;
    occupied = ref false;
}

(* Russia *)
let fin = {
    name = "FIN";
    supply = false;
    homeland = Russia;
    climate = Coastal;
    held_by = ref Russia;
    occupied = ref false;
}
let stp = {
    name = "STP";
    supply = true;
    homeland = Russia;
    climate = Coastal;
    held_by = ref Russia;
    occupied = ref false;
}
let mos = {
    name = "MOS";
    supply = true;
    homeland = Russia;
    climate = Inland;
    held_by = ref Russia;
    occupied = ref false;
}
let sev = {
    name = "SEV";
    supply = true;
    homeland = Russia;
    climate = Coastal;
    held_by = ref Russia;
    occupied = ref false;
}
let ukr = {
    name = "UKR";
    supply = false;
    homeland = Russia;
    climate = Inland;
    held_by = ref Russia;
    occupied = ref false;
}
let war = {
    name = "WAR";
    supply = true;
    homeland = Russia;
    climate = Inland;
    held_by = ref Russia;
    occupied = ref false;
}
let lvn = {
    name = "LVN";
    supply = false;
    homeland = Russia;
    climate = Coastal;
    held_by = ref Russia;
    occupied = ref false;
}

(* Turkey *)
let arm = {
    name = "ARM";
    supply = false;
    homeland = Turkey;
    climate = Coastal;
    held_by = ref Turkey;
    occupied = ref false;
}
let syr = {
    name = "SYR";
    supply = false;
    homeland = Turkey;
    climate = Coastal;
    held_by = ref Turkey;
    occupied = ref false;
}
let smy = {
    name = "SMY";
    supply = true;
    homeland = Turkey;
    climate = Coastal;
    held_by = ref Turkey;
    occupied = ref false;
}
let con = {
    name = "CON";
    supply = true;
    homeland = Turkey;
    climate = Coastal;
    held_by = ref Turkey;
    occupied = ref false;
}
let ank = {
    name = "ANK";
    supply = true;
    homeland = Turkey;
    climate = Coastal;
    held_by = ref Turkey;
    occupied = ref false;
}

(* AH *)
let tyr = {
    name = "TYR";
    supply = false;
    homeland = AH;
    climate = Inland;
    held_by = ref AH;
    occupied = ref false;
}
let boh = {
    name = "BOH";
    supply = false;
    homeland = AH;
    climate = Inland;
    held_by = ref AH;
    occupied = ref false;
}
let gal = {
    name = "GAL";
    supply = false;
    homeland = AH;
    climate = Inland;
    held_by = ref AH;
    occupied = ref false;
}
let bud = {
    name = "BUD";
    supply = true;
    homeland = AH;
    climate = Inland;
    held_by = ref AH;
    occupied = ref false;
}
let tri = {
    name = "TRI";
    supply = true;
    homeland = AH;
    climate = Coastal;
    held_by = ref AH;
    occupied = ref false;
}
let vie = {
    name = "VIE";
    supply = true;
    homeland = AH;
    climate = Inland;
    held_by = ref AH;
    occupied = ref false;
}

(* Italy *)





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

(** Currently only initialized armies, not fleets.
 * TODO:
     * initialize fleets where appropriate **)
let init_forces (bd : board) =
    (** Filter all the provinces that are supply centers **)
    let lst = List.filter (fun x -> x.supply = true) bd.provs in
    List.iter (fun x -> gen_force x ~fleet:false bd) lst
