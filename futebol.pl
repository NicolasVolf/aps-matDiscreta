% Times 
time(sao_paulo).
time(atletico_pr).

% Jogadores 
% joga_no(Jogador, Time).
joga_no(rogerio_ceni, sao_paulo).
joga_no(lugano, sao_paulo).
joga_no(diego_tardelli, atletico_pr).
joga_no(lima, atletico_pr).

% Posições 
% joga_na_posicao(Jogador, Posicao).
joga_na_posicao(rogerio_ceni, goleiro).
joga_na_posicao(lugano, zagueiro).
joga_na_posicao(diego_tardelli, atacante).
joga_na_posicao(lima, atacante).

% Partidas 
% disputaram(Time1, Time2, Partida).
disputaram(atletico_pr, sao_paulo, jogo_ida).
disputaram(sao_paulo, atletico_pr, jogo_volta).

% Resultados 
% venceu(Time, Partida).
venceu(sao_paulo, jogo_volta).

% empataram(Time1, Time2, Partida).
empataram(atletico_pr, sao_paulo, jogo_ida).

% marcou_gol(Jogador, Partida).
marcou_gol(lima, jogo_ida).
marcou_gol(diego_tardelli, jogo_volta). 
marcou_gol(rogerio_ceni, jogo_volta). 


% Regras de Incompatibilidade (Fórmulas 3, 4, 6) 
% O que não pode acontecer
posicao_incompativel(goleiro, atacante).
posicao_incompativel(atacante, goleiro).
posicao_incompativel(goleiro, zagueiro).
posicao_incompativel(zagueiro, goleiro).
posicao_incompativel(atacante, zagueiro).
posicao_incompativel(zagueiro, atacante).

oponente(sao_paulo, atletico_pr).
oponente(atletico_pr, sao_paulo).

% Regra 4 (Autor do Gol - Fórmula 7) 
% Caso 1: O jogador joga no Time1
autor_do_gol_valido(Jogador, Partida) :-
    marcou_gol(Jogador, Partida),    
    disputaram(Time1, _, Partida), 
    joga_no(Jogador, Time1).  

% Caso 2 (OU): O jogador joga no Time2
autor_do_gol_valido(Jogador, Partida) :-
    marcou_gol(Jogador, Partida),   
    disputaram(_, Time2, Partida), 
    joga_no(Jogador, Time2).     


% Regra 5 (Vitória Válida - Fórmula 9) 

vitoria_valida(TimeVencedor, Partida) :-
    venceu(TimeVencedor, Partida),        
    disputaram(TimeVencedor, _, Partida). 

vitoria_valida(TimeVencedor, Partida) :-
    venceu(TimeVencedor, Partida),     
    disputaram(_, TimeVencedor, Partida).

% Regra 6 (Empate Válido - Fórmula 8) 
empate_valido(Partida) :-
    empataram(Time1, Time2, Partida),
    disputaram(Time1, Time2, Partida).

empate_valido(Partida) :-
    empataram(Time1, Time2, Partida),
    disputaram(Time2, Time1, Partida). 