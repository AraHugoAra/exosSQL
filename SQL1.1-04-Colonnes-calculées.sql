/* La liste des motos (nom, vendeur, quantité et marge) triés par marge décroissante */
/* RESULTAT ==> 13 lignes / 2003 Harley-Davidson Eagle Drag Bike */

SELECT productName, productVendor, quantityInStock, MSRP - buyPrice AS margin FROM products
	WHERE productLine LIKE "motorcycles"
    	ORDER BY margin DESC;

/* La liste des commandes (numéro, date de commande, date d'expédition, écart en jours entre les deux dates et statut) qui sont en cours de traitement ou qui ont été expédiées et ont un écart de plus de 10j triés par écart décroissant puis par date de commande */
/* RESULTAT ==> 33 lignes / 10165 */

SELECT orderNumber, orderDate, shippedDate, DATEDIFF(shippedDate, orderDate) AS datesGap, status FROM `orders` 
	WHERE DATEDIFF(shippedDate, orderDate) > 10 AND status LIKE "Shipped" OR status LIKE "in process"
    	ORDER BY datesGap DESC, orderDate;

/*La liste des produits (nom et valeur du stock à la vente) des années 1960 */
/* RESULTAT ==> 16 lignes / 1969 Harley Davidson Ultimate Chopper */

SELECT productName, quantityInStock * MSRP AS stockValue FROM `products`
WHERE productName LIKE "196_%";