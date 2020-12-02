% Base de datos
% Mamiferos:
animal(perro).
animal(gato).
animal(murcielago).
animal(llama).
animal(canguro).
animal(mono).

% Peces
animal(trucha).
animal(pejerrey).
animal(ispi).
animal(pirania).

% reptiles
animal(lagarto).
animal(iguana).
animal(vibora).
animal(tortuga).

% aves
animal(condor).
animal(aguila).
animal(paloma).
animal(avestruz).


cuatro_patas(perro).
cuatro_patas(gato).
cuatro_patas(llama).
cuatro_patas(canguro).
cuatro_patas(mono).
cuatro_patas(lagarto).
cuatro_patas(iguana).
cuatro_patas(tortuga).

dos_patas(condor).
dos_patas(aguila).
dos_patas(avestruz).
dos_patas(paloma).
dos_patas(murcielago).

cero_patas(trucha).
cero_patas(pejerrey).
cero_patas(ispi).
cero_patas(pirania).

cobertura_pelo(perro).
cobertura_pelo(gato).
cobertura_pelo(llama).
cobertura_pelo(murcielago).
cobertura_pelo(canguro).
cobertura_pelo(mono).

cobertura_escamas(trucha).
cobertura_escamas(pejerrey).
cobertura_escamas(ispi).
cobertura_escamas(pirania).

cobertura_escamas(lagarto).
cobertura_escamas(iguana).
cobertura_escamas(vibora).
cobertura_escamas(tortuga).

cobertura_plumas(condor).
cobertura_plumas(aguila).
cobertura_plumas(avestruz).
cobertura_plumas(paloma).

vive_tierra(perro).
vive_tierra(gato).
vive_tierra(llama).
vive_tierra(murcielago).
vive_tierra(canguro).
vive_tierra(mono).

vive_tierra(lagarto).
vive_tierra(iguana).
vive_tierra(vibora).
vive_tierra(tortuga).

oviparo(condor).
oviparo(aguila).
oviparo(avestruz).
oviparo(paloma).

oviparo(trucha).
oviparo(pejerrey).
oviparo(ispi).
oviparo(pirania).

oviparo(lagarto).
oviparo(iguana).
oviparo(vibora).
oviparo(tortuga).


no_oviparo(perro).
no_oviparo(gato).
no_oviparo(llama).
no_oviparo(murcielago).
no_oviparo(canguro).
no_oviparo(mono).

mamiferos(perro).
mamiferos(gato).
mamiferos(murcielago).
mamiferos(llama).
mamiferos(canguro).
mamiferos(mono).

pez(trucha).
pez(pejerrey).
pez(ispi).
pez(pirania).

reptil(lagarto).
reptil(tortuga).
reptil(vibora).
reptil(iguana).

ave(condor).
ave(aguila).
ave(avestruz).
ave(paloma).

branquias(trucha).
branquias(pejerrey).
branquias(ispi).
branquias(pirania).

% reglas de producci�n
mamifero(X) :- animal(X), mamiferos(X). %es lo mismo que la lactancia

tiene_cuatro_patas(X) :- animal(X),
                         cuatro_patas(X).

dos_patas_patas(X) :- animal(X), dos_patas(X).

respira_por_branquias(X) :- animal(X), branquias(X).
tiene_pelo(X) :- animal(X), cobertura_pelo(X).

tiene_escamas(X) :- animal(X), cobertura_escamas(X).

tiene_plumas(X) :- animal(X), cobertura_plumas(X).

es_un_pez(X) :- animal(X), pez(X).

puede_nadar(X) :- animal(X), es_habitat_agua(X).

es_oviparo(X) :- animal(X), oviparo(X).

no_es_oviparo(X) :- animal(X), no_oviparo(X).

es_un_ave(X) :- animal(X), ave(X).

es_un_reptil(X) :- animal(X), reptil(X).

su_habitat_es_tierra(X) :- animal(X),
    vive_tierra(X).

camina_en_cuatro_patas(X) :- animal(X), cuatro_patas(X).

no_tiene_patas(X) :- animal(X), cero_patas(X).

