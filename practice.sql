-- 1.	Query: What kind of credit card does Ms. Carla J. Adams own?

SELECT contact.ContactID, contactcreditcard.ContactID, creditcard.CreditCardID, creditcard.CardType
FROM contact, contactcreditcard, creditcard
WHERE contact.ContactID = contactcreditcard.ContactID AND contactcreditcard.CreditCardID = creditcard.CreditCardID
AND contact.FirstName = 'Carla' AND contact.LastName='Adams';

-- 2.	Query: Print all of the addresses for customer with account number AW00000222

SELECT address.AddressID, address.AddressLine1
FROM address , customer, customeraddress
WHERE address.AddressID = customeraddress.AddressID AND customer.CustomerID = customeraddress.CustomerID 
AND customer.AccountNumber = 'AW00000222';

-- 3.	Query: Print the city of the customer with customer ID number 40

SELECT customer.CustomerID, address.AddressID, address.City
FROM address , customer, customeraddress
WHERE customer.CustomerID = customeraddress.CustomerID AND customeraddress.AddressID = address.AddressID 
AND customer.CustomerID = 40;


