% Semana 9 estudiantes y trabajadores
estudiante(gdyr).
trabajador(pep).
ciudadano(X) :- estudiante(X) ; trabajador(X).
% Semana 10 par Impar
impar(X) :- 1 is X mod 2.
par(X) :- 0 is X mod 2.
%Semana 10 Factorial
factorial(X,Fact) :- X = 0, Fact is 1.
factorial(X,Fact) :- X1 is X-1, factorial(X1,Fact1),Fact is X*Fact1.
%Semana 10 es mayor 3
esMayor2(A,B,Mayor):- A>=B, Mayor is A ; A=<B, Mayor is B.

%Semana 10 es primo 
divisible(X, Y) :- 0 is X mod Y.

no_divisores(_, 1).
no_divisores(N, D) :-
    D > 1,
    \+ divisible(N, D),  
    D1 is D - 1,          
    no_divisores(N, D1).  

es_primo(2). 
es_primo(N) :-
    N > 2,
    N1 is N - 1,
    no_divisores(N, N1).  


%Semana 10 Alimento e imprime alimento 
alimento(vegetal,lechuga).
alimento(vegetal,tomate).
alimento(vegetal,pepino).
alimento(vegetal,papa).
alimento(grano,arroz).
alimento(grano,frijoles).
imprimeAlimentos(Grupo):-alimento(Grupo,Ali),write(Ali), nl, 1=:=2.
imprimeAlimentos(_).
contarAlimentos(Grupo,Res,Lista):-findall(Ali,alimento(Grupo,Ali),Lista),length(Lista,Res).

%Ciclo factorial semana 11
leer_numeros :-
    write('Escribe un número (0 para detenerse): '),
    read(N),            
    procesar_numero(N).

procesar_numero(0) :-
    write('Programa terminado.').
procesar_numero(N) :-
    N > 0,
    factorial(N, Fact),    
    write('Factorial de '), write(N), write(' es '), write(Fact), nl,  
    leer_numeros.      

%Manipular lista semana 11 
agregar_elementos :-agregar_elementos([], ListaFinal), write('Lista final: '), write(ListaFinal), nl.

agregar_elementos(Lista, ListaFinal) :- write('Ingrese un elemento (p para imprimir, s para detener): '), read(Elemento),
    ( Elemento = s -> ListaFinal = Lista, write('Programa terminado.'), nl
    ; Elemento = p -> write('Lista actual: '), write(Lista), nl, agregar_elementos(Lista, ListaFinal)
    ; agregar_elementos([Elemento|Lista], ListaFinal)).



%preferencias personas semana 11

menuInit:-
    nl,
    write('Bienvenido al programa de Canciones'),nl,
    write('1) Agregar Cancion a BC'),nl,
    write('2) Le gusta un genero'),nl,
    write('Seleccione una opcion'),nl,
    read(Opcion), verOpciones(Opcion), nl.
    
    
    
verOpciones(Opcion):-Opcion == 1, agregarEscucha, menuInit;
					Opcion == 2, write('Ingrese el nombre de la persona: '), read(Persona),
    							 write('Ingrese el género: '), read(Genero),
    							(legusta(Persona, Genero) -> write(Persona), write(' le gusta el género '), write(Genero), nl;
        						write(Persona), write(' no le gusta el género '), write(Genero), nl), menuInit;
    				Opcion == s, true.


:- dynamic escucha/3.
agregarEscucha :- write('persona:'),read(Persona),nl,
    write('canción:'), read(Cancion),nl,
    write('genero:'), read(Genero),nl, 
    assertz(escucha(Persona,Cancion,Genero)),
    write('Detalle agregado: '), write(escucha(Persona, Cancion, Genero)), nl.

legusta(Persona, Genero) :-
    escucha(Persona, _, Genero).

