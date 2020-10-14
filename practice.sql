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

-- 4.	Challenge Insert: Add a home address for customer with account number AW00000222. Address is 1 Churchill Square Edmonton AB A1A 1A1

BEGIN;

SELECT address.AddressID, address.AddressLine1, address.City, address.StateProvinceID, address.PostalCode, customeraddress.AddressTypeID
FROM address , customer, customeraddress
WHERE address.AddressID = customeraddress.AddressID AND customer.CustomerID = customeraddress.CustomerID 
AND customer.AccountNumber = 'AW00000222';

INSERT INTO address (AddressLine1, City, StateProvinceID, PostalCode)
  VALUES('1 Churchill Square', 'Edmonton', 1, 'A1A 1A1');

INSERT INTO customeraddress (AddressID, CustomerID, AddressTypeID) 
  VALUES(
    (SELECT AddressID FROM address WHERE AddressLine1 = '1 Churchill Square'),
    (SELECT CustomerID FROM customer WHERE AccountNumber = 'AW00000222'),
    (SELECT AddressTypeID FROM addresstype WHERE Name = 'Home')
    );

COMMIT;