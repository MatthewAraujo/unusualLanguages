let read_file filename =
  let in_channel = open_in filename in
  try
    let rec read_lines acc =
      try
        let line = input_line in_channel in
        read_lines (line :: acc)
      with
        End_of_file -> List.rev acc
    in
    let lines = read_lines [] in
    close_in in_channel;
    lines
  with
    _ -> failwith "Error reading file";;


let lines = read_file "input.txt" in
List.iter print_endline lines;