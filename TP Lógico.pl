serie(himym).
serie(futurama).
serie(got).
serie(starWars).
serie(onePiece).
serie(hoc).
serie(madMen).
serie(drHouse).

persona(juan).
persona(nico).
persona(maiu).
persona(gaston).
persona(aye).
persona(alf).

mira(juan, himym).
mira(juan, futurama).
mira(juan, got).

mira(nico, starWars).
mira(nico, got).

mira(maiu, starWars).
mira(maiu, onePiece).
mira(maiu, got).

mira(gaston, hoc).
%no ponemos a Alf por el Principio del Universo Cerrado

esPopular(got).
esPopular(hoc).
esPopular(starWars).


planeaVer(juan, hoc).
planeaVer(aye, got).
planeaVer(gaston, himym).

temporada(got, 3, 12).
temporada(got, 2, 10).
temporada(himym, 1, 23).
temporada(drHouse, 8, 16).
%medio raro, revisar bien esto de arriba

paso(futurama, 2, 3, muerte(seymourDiera)).
paso(starWars, 10, 9, muerte(emperor)).
paso(starWars, 1, 2, relacion(parentesco, anakin, rey)).
paso(starWars, 3, 2, relacion(parentesco, vader, luke)).
paso(himym, 1, 1, relacion(amorosa, ted, robin)).
paso(himym, 4, 3, relacion(amorosa, swarley, robin)).
paso(got, 4, 5, relacion(amistad, tyrion, dragon)).

leDijo(gaston, maiu, got, relacion(amistad, tyrion, dragon)).
leDijo(nico, maiu, starWars, relacion(parentesco, vader, luke)).
leDijo(nico, juan, got, muerte(tyrion)).
leDijo(aye, juan, got, relacion(amistad, tyrion, john)).
leDijo(aye, maiu, got, relacion(amistad, tyrion, john)).
leDijo(aye, gaston, got, relacion(amistad, tyrion, dragon)).

esSpoiler(Serie, QuePaso):-
  serie(Serie),
  paso(Serie, _, _, QuePaso).


leSpoileo(Persona1, Persona2, Serie):-
  persona(Persona1),
  persona(Persona2),
  planeaVer(Persona2, Serie),
  leDijo(Persona1, Persona2, Serie, _).

leSpoileo(Persona1, Persona2, Serie):-
  persona(Persona1),
  persona(Persona2),
  mira(Persona2, Serie),
  leDijo(Persona1, Persona2, Serie, _).


televidenteResponsable(Persona):-
  persona(Persona),
  mira(Persona, Serie),
  not(leSpoileo(Persona, _, Serie)).

esFuerte(relacion(parentesco,_,_)).
esFuerte(muerte(_)).
esFuerte(relacion(amorosa,_,_)).


vieneZafando(Persona, Serie):-
  persona(Persona),

  mira(Persona, Serie),
  not(leDijo(_, Persona, Serie, AlgoQuePaso)),
  esFuerte(AlgoQuePaso).

vieneZafando(Persona, Serie):-
  persona(Persona),

  planeaVer(Persona, Serie),
  not(leDijo(_, Persona, Serie,AlgoQuePaso)),
  esFuerte(AlgoQuePaso).

%FALTA VER QUE ONDA CON LO DE "TODAS LAS TEMPORADAS"
