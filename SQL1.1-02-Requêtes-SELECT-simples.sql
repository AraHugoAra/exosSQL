/* La liste des bureaux (adresse et ville) triés par pays décroissant puis par état */


/* RESULTAT ==> 7 lignes / 100 Market Street */

SELECT City, addressLine1 FROM `offices`
ORDER BY country DESC, state;