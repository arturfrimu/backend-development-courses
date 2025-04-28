-- tabele de exemplu
CREATE TABLE culori  (culoare VARCHAR(10));
INSERT INTO culori  VALUES ('Rosu'),('Verde'),('Albastru');

CREATE TABLE marimi  (marime VARCHAR(5));
INSERT INTO marimi  VALUES ('S'),('M');

-- produs cartezian
SELECT c.culoare, m.marime
FROM culori AS c
         CROSS JOIN marimi AS m;

SELECT c.culoare, m.marime, s.stil
FROM culori c
         CROSS JOIN marimi m
         CROSS JOIN (
    VALUES ('Casual'),('Sport'),('Elegant')
) AS s(stil);

