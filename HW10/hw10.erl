-module(hw10).
-export([sumFirst/1, nestedSum/1, removeNestedLists/1, cleanString/1, evaluate/2, toBinaryString/1, zip/2, tuplesToList/1]).
% Enrique Barragán González A01370878

% Sum of first n positive integers
sumFirst(0) -> 0;
sumFirst(N) -> sumFirst(N - 1) + N.

% Calculates the sum of the elements in a list (ignores nested lists).

nestedSum([]) -> 0;
nestedSum([H | T]) when is_list(H) -> hd(H) + nestedSum(tl(H)) + nestedSum(T);
nestedSum([H | T]) -> nestedSum(T) + H.

% Removes nested lists in the argument and returns all the elements as one single plain list.
removeNestedLists(X) -> removeNestedLists(X,[]).
removeNestedLists([],Acc) -> Acc;
removeNestedLists([[]|T],Acc) -> removeNestedLists(T, Acc);
removeNestedLists([[_|_]=H|T],Acc) -> removeNestedLists(T, removeNestedLists(H,Acc));
removeNestedLists([H|T],Acc) -> removeNestedLists(T,Acc++[H]).

% Cleans a string. Given a string, return recursively a 'cleaned' string where adjacent chars that are the same have been reduced to a single char. So "yyzzza" yields "yza".
cleanString([]) -> [];
cleanString([X]) -> [X];
cleanString([X | XS]) -> if 
  X == hd(XS) -> cleanString(XS);
  true -> [X] ++ cleanString(XS)
  end.

% Evaluation of polynomials
evaluate([], _) -> 0;
evaluate([A | AS], X) -> A*math:pow(X, (length(AS))) + (evaluate(AS, X)).

% Converts a number to a binary string.
toBinaryString(0) -> "0";
toBinaryString(1) -> "1";
toBinaryString(N) -> if
  N band 1 == 0 -> toBinaryString(N div 2) ++ "0";
  true -> toBinaryString((N - 1) div 2) ++ "1"
  end.

% Zipping two lists
zip([], _) -> [];
zip(_, []) -> [];
zip([HL1 | TL1], [HL2 | TL2]) -> [{HL1, HL2}] ++ zip(TL1, TL2).

% Lists of tuples
tuplesToList([]) -> [];
tuplesToList([{A, B} | T]) -> [A] ++ tuplesToList(T) ++ [B].
