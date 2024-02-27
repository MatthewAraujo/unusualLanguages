-module(main).
-export([start/0]).

start() ->
    Array = get_user_input([], 1),
    SecondLargest = find_second_largest(Array),
    io:format("O segundo maior elemento é: ~w~n", [SecondLargest]).

get_user_input(Array, N) when N =< 10 ->
    io:format("Digite o ~Bº elemento: ", [N]),
    Value = read_number(),
    case lists:member(Value, Array) of
        true ->
            io:format("Valor repetido. Por favor, escolha outro.~n"),
            get_user_input(Array, N);
        false ->
            get_user_input([Value | Array], N + 1)
    end;
get_user_input(Array, _) ->
    Array.

read_number() ->
    {ok, [Number], _} = io:fread("","~d"),
    Number.

find_second_largest(Array) ->
    SortedArray = lists:sort(Array),
    lists:last(lists:init(SortedArray)).
