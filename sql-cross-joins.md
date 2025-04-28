```sql
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
```

| culoare | marime | stil |
| :--- | :--- | :--- |
| Rosu | S | Casual |
| Rosu | M | Casual |
| Rosu | S | Sport |
| Rosu | M | Sport |
| Rosu | S | Elegant |
| Rosu | M | Elegant |
| Verde | S | Casual |
| Verde | M | Casual |
| Verde | S | Sport |
| Verde | M | Sport |
| Verde | S | Elegant |
| Verde | M | Elegant |
| Albastru | S | Casual |
| Albastru | M | Casual |
| Albastru | S | Sport |
| Albastru | M | Sport |
| Albastru | S | Elegant |
| Albastru | M | Elegant |


