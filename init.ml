open Board.Board
open Board.Board.ToString

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
let ven = {
    name = "VEN";
    supply = true;
    homeland = Italy;
    climate = Coastal;
    held_by = ref Italy;
    occupied = ref false;
}
let apu = {
    name = "APU";
    supply = false;
    homeland = Italy;
    climate = Coastal;
    held_by = ref Italy;
    occupied = ref false;
}
let nap = {
    name = "NAP";
    supply = true;
    homeland = Italy;
    climate = Coastal;
    held_by = ref Italy;
    occupied = ref false;
}
let rom = {
    name = "ROM";
    supply = true;
    homeland = Italy;
    climate = Coastal;
    held_by = ref Italy;
    occupied = ref false;
}
let tus = {
    name = "TUS";
    supply = false;
    homeland = Italy;
    climate = Coastal;
    held_by = ref Italy;
    occupied = ref false;
}
let pie = {
    name = "PIE";
    supply = false;
    homeland = Italy;
    climate = Coastal;
    held_by = ref Italy;
    occupied = ref false;
}

(* NEUTRALS *)
let por = {
    name = "POR";
    supply = true;
    homeland = Neutral;
    climate = Coastal;
    held_by = ref Neutral;
    occupied = ref false;
}
let spa = {
    name = "SPA";
    supply = true;
    homeland = Neutral;
    climate = Coastal;
    held_by = ref Neutral;
    occupied = ref false;
}
let bel = {
    name = "BEL";
    supply = true;
    homeland = Neutral;
    climate = Coastal;
    held_by = ref Neutral;
    occupied = ref false;
}
let hol = {
    name = "HOL";
    supply = true;
    homeland = Neutral;
    climate = Coastal;
    held_by = ref Neutral;
    occupied = ref false;
}
let den = {
    name = "DEN";
    supply = true;
    homeland = Neutral;
    climate = Coastal;
    held_by = ref Neutral;
    occupied = ref false;
}
let swe = {
    name = "SWE";
    supply = true;
    homeland = Neutral;
    climate = Coastal;
    held_by = ref Neutral;
    occupied = ref false;
}
let now = {
    name = "NOw";
    supply = true;
    homeland = Neutral;
    climate = Coastal;
    held_by = ref Neutral;
    occupied = ref false;
}
let rum = {
    name = "RUM";
    supply = true;
    homeland = Neutral;
    climate = Coastal;
    held_by = ref Neutral;
    occupied = ref false;
}
let bul = {
    name = "BUL";
    supply = true;
    homeland = Neutral;
    climate = Coastal;
    held_by = ref Neutral;
    occupied = ref false;
}
let gre = {
    name = "GRE";
    supply = true;
    homeland = Neutral;
    climate = Coastal;
    held_by = ref Neutral;
    occupied = ref false;
}
let alb = {
    name = "ALB";
    supply = false;
    homeland = Neutral;
    climate = Coastal;
    held_by = ref Neutral;
    occupied = ref false;
}
let ser = {
    name = "SER";
    supply = true;
    homeland = Neutral;
    climate = Inland;
    held_by = ref Neutral;
    occupied = ref false;
}
let tun = {
    name = "TUN";
    supply = true;
    homeland = Neutral;
    climate = Coastal;
    held_by = ref Neutral;
    occupied = ref false;
}
let nor = {
    name = "NOR";
    supply = true;
    homeland = Neutral;
    climate = Coastal;
    held_by = ref Neutral;
    occupied = ref false;
}

(* Oceans *)
let barents = {
    name = "BARENTS";
    supply = false;
    homeland = Neutral;
    climate = Ocean;
    held_by = ref Neutral;
    occupied = ref false;
}
let norwegian = {
    name = "NORWEGIAN";
    supply = false;
    homeland = Neutral;
    climate = Ocean;
    held_by = ref Neutral;
    occupied = ref false;
}
let north = {
    name = "NORTH";
    supply = false;
    homeland = Neutral;
    climate = Ocean;
    held_by = ref Neutral;
    occupied = ref false;
}
let helgoland = {
    name = "HELGOLAND";
    supply = false;
    homeland = Neutral;
    climate = Ocean;
    held_by = ref Neutral;
    occupied = ref false;
}
let skagerrak = {
    name = "SKAGERRAK";
    supply = false;
    homeland = Neutral;
    climate = Ocean;
    held_by = ref Neutral;
    occupied = ref false;
}
let baltic = {
    name = "BALTIC";
    supply = false;
    homeland = Neutral;
    climate = Ocean;
    held_by = ref Neutral;
    occupied = ref false;
}
let bothnia = {
    name = "BOTHNIA";
    supply = false;
    homeland = Neutral;
    climate = Ocean;
    held_by = ref Neutral;
    occupied = ref false;
}
let nao = {
    name = "NORTH ATLANTIC";
    supply = false;
    homeland = Neutral;
    climate = Ocean;
    held_by = ref Neutral;
    occupied = ref false;
}
let irish = {
    name = "IRISH";
    supply = false;
    homeland = Neutral;
    climate = Ocean;
    held_by = ref Neutral;
    occupied = ref false;
}
let english = {
    name = "ENGLISH";
    supply = false;
    homeland = Neutral;
    climate = Ocean;
    held_by = ref Neutral;
    occupied = ref false;
}
let mao = {
    name = "MID ATLANTIC";
    supply = false;
    homeland = Neutral;
    climate = Ocean;
    held_by = ref Neutral;
    occupied = ref false;
}
let wmd = {
    name = "WEST MED";
    supply = false;
    homeland = Neutral;
    climate = Ocean;
    held_by = ref Neutral;
    occupied = ref false;
}
let lyon = {
    name = "LYON";
    supply = false;
    homeland = Neutral;
    climate = Ocean;
    held_by = ref Neutral;
    occupied = ref false;
}
let tyrrhenian = {
    name = "TYRRHENIAN";
    supply = false;
    homeland = Neutral;
    climate = Ocean;
    held_by = ref Neutral;
    occupied = ref false;
}
let ionian = {
    name = "IONIAN";
    supply = false;
    homeland = Neutral;
    climate = Ocean;
    held_by = ref Neutral;
    occupied = ref false;
}
let aegean = {
    name = "AEGEAN";
    supply = false;
    homeland = Neutral;
    climate = Ocean;
    held_by = ref Neutral;
    occupied = ref false;
}
let emd = {
    name = "EAST MED";
    supply = false;
    homeland = Neutral;
    climate = Ocean;
    held_by = ref Neutral;
    occupied = ref false;
}
let adriatic = {
    name = "ADRIATIC";
    supply = false;
    homeland = Neutral;
    climate = Ocean;
    held_by = ref Neutral;
    occupied = ref false;
}
let black = {
    name = "BLACK";
    supply = false;
    homeland = Neutral;
    climate = Ocean;
    held_by = ref Neutral;
    occupied = ref false;
}





(** Generate force and add it to the board.
 * Also changes province occupied status. **)
let gen_force (prov : province) ?(fleet = false) (bd : board) =
    match prov.supply with
    | false -> raise NotSupplyCenter
    | true -> (
        let num = string_of_int (ctr ()) in
        let id = "force" ^ num in
        if (prov.climate = Coastal && fleet = true)
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

(* Initialzie the game_board provinces *)
let init_board = 
    { provs = [
        (* England *) 
        cly; edi; yor; lon; wal; lvp;
        (* France *)
        bre; pic; bur; mar; gas; par;
        (* Germany *)
        kie; ber; pru; sil; mun; ruh;
        (* Russia *)
        fin; stp; mos; sev; ukr; war; lvn;
        (* Turkey *)
        arm; syr; smy; con; ank;
        (* Austria-Hungary *)
        tyr; boh; gal; bud; tri; vie;
        (* Italy *)
        ven; apu; nap; rom ; tus; pie;
        (* Neutrals *)
        por; spa; bel; hol; den; swe; now; rum; bul; gre; alb; ser; tun; nor;
        (* Oceans *)
        barents; norwegian; north; helgoland; skagerrak; baltic; bothnia; nao;
        irish; english; mao; wmd; lyon; tyrrhenian; ionian; aegean; emd;
        adriatic; black; 
        ];
      (* 56 'cause why not, #noshitsgiven *)
      forces = Hashtbl.create 56;
      (* Don't need mirrored tuples *)
      adjacents = [
          (* England *) 
          (cly, edi); (cly, yor); (cly, lvp); (cly, nao); (cly, norwegian);
          (edi, yor); (edi, norwegian); (edi, north);
          (lon, yor); (lon, north); (lon, english); (lon, wal);
          (wal, yor); (wal, lvp); (wal, english); (wal, irish); 
          (lvp, irish); (lvp, nao);
          (* France *)
          (bre, pic); (bre, par); (bre, gas); (bre, mao); (bre, english);
          (pic, bel); (pic, bur); (pic, par); (pic, english);
          (bur, bel); (bur, ruh); (bur, mun); (bur, mar); (bur, gas); (bur, par);
          (mar, pie); (mar, lyon); (mar, spa); (mar, gas);
          (gas, spa); (gas, mao); (gas, par);
          (* Germany *)
          (kie, den); (kie, baltic); (kie, ber); (kie, mun); (kie, ruh); (kie, hol); (kie, helgoland);
          (ber, baltic); (ber, pru); (ber, sil); (ber, mun);
          (pru, baltic); (pru, lvn); (pru, war); (pru, sil);
          (sil, war); (sil, gal); (sil, boh); (sil, mun);
          (mun, boh); (mun, tyr); (mun, ruh);
          (ruh, bel); (ruh, hol);
          (* Russia *)
          (fin, now); (fin, stp); (fin, bothnia); (fin, swe);
          (stp, now); (stp, barents); (stp, mos); (stp, lvn); (stp, bothnia);
          (mos, sev); (mos, ukr); (mos, war); (mos, lvn);
          (sev, arm); (sev, black); (sev, rum); (sev, ukr);
          (ukr, rum); (ukr, gal); (ukr, war);
          (war, gal); (war, lvn);
          (lvn, baltic); (lvn, bothnia);
          (* Turkey *)
          (arm, black); (arm, syr); (arm, smy); (arm, ank);
          (syr, smy); (syr, emd);
          (smy, emd); (smy, aegean); (smy, con); (smy, ank);
          (con, aegean); (con, bul); (con, black); (con, ank);
          (ank, black);
          (* Austria-Hungary *)
          (tyr, boh); (tyr, vie); (tyr, tri); (tyr, ven); (tyr, pie);
          (boh, gal); (boh, vie);
          (gal, rum); (gal, bud); (gal, vie);
          (bud, rum); (bud, ser); (bud, tri); (bud, vie);
          (tri, ser); (tri, alb); (tri, adriatic); (tri, ven); (tri, vie);
          (* Italy *)
          (ven, adriatic); (ven, apu); (ven, rom); (ven, tus); (ven, pie);
          (apu, adriatic); (apu, ionian); (apu, nap); (apu, rom);
          (nap, ionian); (nap, tyrrhenian); (nap, rom);
          (rom, tyrrhenian); (rom, tus);
          (tus, tyrrhenian); (tus, lyon); (tus, pie);
          (pie, lyon);
          (* Neutrals *)
          (por, mao); (por, spa);
          (spa, mao); (spa, wmd); (spa, lyon);
          (bel, hol); (bel, english); (bel, north);
          (hol, north); (hol, helgoland);
          (den, helgoland); (den, north); (den, skagerrak); (den, swe); (den, baltic);
          (swe, skagerrak); (swe, now); (swe, bothnia); (swe, baltic); 
          (now, skagerrak); (now, north); (now, norwegian); (now, barents);
          (rum, black); (rum, bul); (rum, ser);
          (bul, black); (bul, aegean); (bul, gre); (bul, ser);
          (gre, aegean); (gre, ionian); (gre, alb); (gre, ser);
          (alb, ionian); (alb, adriatic); (alb, ser);
          (tun, tyrrhenian); (tun, ionian); (tun, nor); (tun, wmd);
          (nor, wmd); (nor, mao);

          (* Oceans *)
          (barents, norwegian);
          (norwegian, north); (norwegian, nao);
          (north, english); (north, helgoland); (north, skagerrak);
          (skagerrak, baltic);
          (baltic, bothnia);
          (nao, irish); (nao, mao);
          (irish, mao); (irish, english);
          (mao, english); (mao, wmd);
          (wmd, lyon); (wmd, tyrrhenian);
          (tyrrhenian, lyon); (tyrrhenian, ionian);
          (ionian, adriatic); (ionian, aegean); (ionian, emd);
          (aegean, emd); (aegean, black);
          ];
    };;

(* Given the game board, add the forces to the forces field *)
let init_forces (bd : board) : board =
    (* Filter all the provinces that are supply centers. *)
    (* Also filters for provinces that aren't neutral. *)
    let lst = List.filter 
                (fun x -> x.supply = true && x.homeland != Neutral) 
                bd.provs 
    in
    List.iter (fun x -> 
        (* All the provs that need fleets *)
        if x = edi || x = lon || x = bre || x = kie || x = stp || x = sev ||
           x = ank || x = tri || x = nap
        (* Give 'em fleets! *)
        then gen_force x ~fleet:true bd
        (* Give 'em armies! *)
        else gen_force x ~fleet:false bd) lst;
    bd
;;


