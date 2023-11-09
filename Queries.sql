--QUERY ONE
SELECT sub_name, sub_add, tdate, results
FROM Test, Subject
WHERE
	Test.subject_id = Subject.subject_id AND
	Subject.sub_add LIKE '%Aberdeen%';


--QUERY TWO
SELECT tdate, sub_name, vdate, busi_loc
FROM Subject, Phone, Business, Test, Visit, Subject_Phone
WHERE
	Test.results LIKE 'Positive' AND
	Test.subject_id = Subject.subject_id AND
	Subject.subject_id = Subject_Phone.subject_id AND
	Subject_Phone.phone_id = Phone.phone_id AND
	Phone.phone_id = Visit.phone_id AND
	Visit.busi_id = Business.busi_id AND
	Test.tdate > Visit.vdate ;

--QUERY THREE
SELECT busi_loc, vdate, COUNT(party_n) AS [Number of Parties], SUM(party_n) AS [Total Visitors]
FROM Visit, Business
WHERE
	Visit.busi_id = Business.busi_id
GROUP BY busi_loc, vdate
ORDER BY SUM(party_n) DESC;