let is_digit digit =
  match digit with
  | '0' .. '9' -> true
  | _ -> false;;

let read_file filename =
  let in_channel = open_in filename in
  try
    let rec read_lines acc =
      try
        let line = input_line in_channel in
        let first_digit = List.find is_digit (List.init (String.length line) (String.get line)) in
        let last_digit = List.find is_digit (List.rev (List.init (String.length line) (String.get line))) in
        let combined_digit = String.make 1 first_digit ^ String.make 1 last_digit in
        read_lines (int_of_string combined_digit :: acc)
      with
        End_of_file -> List.rev acc
    in
    let lines_with_combined_digits = read_lines [] in
    close_in in_channel;
    lines_with_combined_digits
  with
    _ -> failwith "Error reading file";;

let lines_with_combined_digits = read_file "real_input.txt" in
let sum_of_combined_digits = List.fold_left (+) 0 lines_with_combined_digits in
print_endline ("Sum of combined digits: " ^ string_of_int sum_of_combined_digits);
