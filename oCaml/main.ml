(* Função para ler um número do usuário *)
let read_number () =
  print_string "Digite um número: ";
  read_int ();;

(* Função para encontrar o segundo maior número em uma lista *)
let rec segundo_maior numeros maior1 maior2 =
  match numeros with
  | [] -> maior2
  | head :: tail ->
    if head > maior1 then
      segundo_maior tail head maior1
    else if head > maior2 && head <> maior1 then
      segundo_maior tail maior1 head
    else
      segundo_maior tail maior1 maior2;;

(* Função principal que recebe números do usuário e imprime a lista *)
let rec main lista contador =
  if contador = 10 then
    begin
      print_endline "Programa encerrado. Lista final:";
      List.iter (fun x -> print_int x; print_string " ") (List.rev lista);
      print_newline ();

      (* Calcular e exibir o segundo maior número *)
      match lista with
      | [] | [_] -> print_endline "Não há segundo maior número na lista."
      | primeiro :: segundo :: restante ->
        let segundo_maior_numero = segundo_maior restante (min primeiro segundo) (max primeiro segundo) in
        print_endline ("O segundo maior número é: " ^ string_of_int segundo_maior_numero)
    end
  else
    let novo_numero = read_number () in
    if List.mem novo_numero lista then
      begin
       print_endline "Número já adicionado. Por favor, insira um número diferente.";
        main lista contador
      end
    else
      main (novo_numero :: lista) (contador + 1);;

(* Chamada inicial do programa *)
main [] 0;;
