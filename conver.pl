%declaracion de librerias para la interfaz

:-use_module(library(pce)).
:-use_module(library(pce_style_item)).

% metodo principal para iniciar la interfaz grafica, declaracion de
% botones, labels, y la pocicion en pantalla.
inicio:-
	new(Menu, dialog('Proyecto INF-320 siquiatra', size(1000,800))),
	new(L,label(nombre,'CLASIFICACIÓN DE ANIMALES')),
	new(A,label(nombre,'GRUPO 2')),
	new(@texto,label(nombre,'Responde un breve cuestionario para su diagnostico')),
	new(@respl,label(nombre,'')),
	new(Salir,button('SALIR',and(message(Menu, destroy),message(Menu,free)))),
	new(@boton,button('realizar test',message(@prolog,botones))),


	send(Menu,append(L)),new(@btncarrera,button('Diagnostico?')),
	send(Menu,display,L,point(125,20)),
	send(Menu,display,A,point(80,360)),
	send(Menu,display,@boton,point(100,150)),
	send(Menu,display,@texto,point(20,100)),
	send(Menu,display,Salir,point(20,400)),
	send(Menu,display,@respl,point(20,130)),
	send(Menu,open_centered).

%caracterizticas del animal

fallas('ESPECIE COINCIDENTE: MAMIFERO
	CARACTERIZTICAS:
        - Tiene glandulas mamarias
	- Es de sangre caliente
	- Tiene labios para poder mamar
	- Tiene Pelaje
	- Tiene Dientes	
	') :- mamifero,!.

fallas('ESPECIE COINCIDENTE: AVE
	CARACTERIZTICAS:
        - Tiene plumas
	- Solo tiene 2 patas
	- Vuela
	- Tiene Pico
	') :- ave,!.


fallas('Ninguna especie coincidente').

% preguntas para dirigir a la enfermedad adecuada con su respectivo
% identificador de enfermedad

mamifero :- (
	pregunta('Tiene pelaje?'),
	pregunta('Tiene glandulas mamarias?')).

ave :- (
        pregunta('Puede volar?'),
	pregunta('Tiene plumas?')).



:-dynamic si/1,no/1.
preguntar(Problema):- new(Di,dialog('Diagnostico medico')),
     new(L2,label(texto,'Responde las siguientes preguntas')),
     new(La,label(prob,Problema)),
     new(B1,button(si,and(message(Di,return,si)))),
     new(B2,button(no,and(message(Di,return,no)))),

         send(Di,append(L2)),
	 send(Di,append(La)),
	 send(Di,append(B1)),
	 send(Di,append(B2)),

	 send(Di,default_button,si),
	 send(Di,open_centered),get(Di,confirm,Answer),
	 write(Answer),send(Di,destroy),
	 ((Answer==si)->assert(si(Problema));
	 assert(no(Problema)),fail).

% cada vez que se conteste una pregunta la pantalla se limpia para
% volver a preguntar

pregunta(S):-(si(S)->true; (no(S)->fail; preguntar(S))).
limpiar :- retract(si(_)),fail.
limpiar :- retract(no(_)),fail.
limpiar.

% proceso de eleccion de acuerdo al diagnostico basado en las preguntas
% anteriores

botones :- lim,
	send(@boton,free),
	send(@btncarrera,free),
	fallas(Falla),
	send(@texto,selection(' ')),
	send(@respl,selection(Falla)),
	new(@boton,button('inicia procedimiento mecanico',message(@prolog,botones))),
        send(Menu,display,@boton,point(40,50)),
        send(Menu,display,@btncarrera,point(20,50)),
limpiar.
lim :- send(@respl, selection('')).















