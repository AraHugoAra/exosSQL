/* Le total des paiements effectués de chaque client (numéro, nom et pays) américain, allemand ou français de plus de 50000$ trié par pays puis par total des paiements décroissant */
/* RESULTAT ==> 38 lignes / 146 / 130305.35 */

SELECT customers.customerNumber, customerName, country, SUM(amount) AS totalCredit FROM `customers`
	JOIN payments ON customers.customerNumber = payments.customerNumber
    	WHERE country IN ("USA", "France", "Germany")
        GROUP BY payments.customerNumber
        	HAVING totalCredit > 50000
        		ORDER BY country, totalCredit DESC;

/* Le montant total de chaque commande (numéro et date) des clients New-Yorkais (nom) trié par nom du client puis par date de commande */
/* RESULTAT ==> 16 lignes / Classic Legends / 10115 / 21665.98 */

SELECT ROUND(SUM(orderdetails.priceEach * orderdetails.quantityOrdered), 2) AS totalAmount, orders.orderNumber, orders.orderDate, customerName FROM `customers`
	JOIN orders ON customers.customerNumber = orders.customerNumber
    JOIN orderdetails ON orderdetails.orderNumber = orders.orderNumber
    	WHERE city LIKE "nyc"
    	GROUP BY orders.orderNumber
        	ORDER BY customerName, orders.orderDate;