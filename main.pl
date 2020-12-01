% Base de datos
animal(perro).
animal(delfin).
animal(murcielago).
animal(trucha).



% Cobertura
cuatro_patas(perro).
cuatro_patas(tiranosaurio-rex).
cuatro_patas(lagarto).
cuatro_patas(tortuga).

tiene_dos(aguila).
tiene_dos(pinguino).
tiene_dos(avestruz).

cobertura_pelo(perro).
cobertura_pelo(murcielago).
cobertura_pelo(ornitorrinco).
cobertura_escamas(trucha).
cobertura_escamas(serpiente).
cobertura_escamas(tortuga).
cobertura_plumas(aguila).
cobertura_plumas(avestruz).
cobertura_plumas(pinguino).

es_habitat_tierra(perro).
es_habitat_tierra(lagarto).
es_habitat_tierra(cocodrilo).
es_habitat_tierra(serpiente).


oviparo(trucha).
oviparo(anguila).
oviparo(lagarto).
oviparo(cocodrilo).
oviparo(serpiente).
oviparo(tortuga).
oviparo(aguila).
oviparo(avestruz).
oviparo(pinguino).

no_oviparo(perro).
no_oviparo(delfin).

mamiferos(perro).
mamiferos(delfin).
mamiferos(murcielago).
mamiferos(ornitorrinco).

pez(trucha).
pez(tiburon).
pez(tiburon).
pez(anguila).

reptil(lagarto).
reptil(tortuga).
reptil(serpiente).
reptil(cocodrilo).

ave(aguila).
ave(avestruz).
ave(pinguino).

tiene_cuatro(perro).
tiene_cuatro(lagarto).
tiene_cuatro(cocodrilo).
tiene_cuatro(tortuga).
tiene_cuatro(gato).

tiene_cero(delfin).
tiene_cero(trucha).
tiene_cero(arrenque).
tiene_cero(tiburon).
tiene_cero(anguila).
tiene_cero(serpiente).

ht(perro).
ht(delfin).
ht(murcielago).
ht(ornitorrinco).
ht(aguila).
ht(avestruz).
ht(pinguino).

branq(trucha).
branq(arrenque).
branq(tiburon).
branq(anguila).

% reglas
mamifero(X) :- animal(X), mamiferos(X). %es lo mismo que la lactancia

tiene_cuatro_patas(X) :- animal(X),
                         cuatro_patas(X).

tiene_dos_patas(X) :- animal(X), tiene_dos(X).

respira_por_branquias(X) :- animal(X), branq(X).
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
    es_habitat_tierra(X).

camina_en_cuatro_patas(X) :- animal(X), tiene_cuatro(X).

no_tiene_patas(X) :- animal(X), tiene_cero(X).

es_hemeotermico(X) :- animal(X), ht(X).
