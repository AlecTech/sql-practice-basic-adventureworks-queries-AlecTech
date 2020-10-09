-- 1.	Query: What kind of credit card does Ms. Carla J. Adams own?

SELECT contact.ContactID, contactcreditcard.ContactID, creditcard.CreditCardID, creditcard.CardType
FROM contact, contactcreditcard, creditcard
WHERE contact.ContactID = contactcreditcard.ContactID AND contactcreditcard.CreditCardID = creditcard.CreditCardID
AND contact.FirstName = 'Carla' AND contact.LastName='Adams';

-- 2.	Query: Print all of the addresses for customer with account number AW00000222