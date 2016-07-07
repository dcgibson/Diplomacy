open Board.Board

(* Gives every AI's force hold orders *)
let hold_bot lst =
    let enter_holds ai =
        List.iter
            (fun fref ->
                (!fref).command := Hold;
                (!fref).command_state := Unresolved)
            ai.force_list
    in
    List.iter enter_holds lst
