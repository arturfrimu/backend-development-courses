Youtube: Java_Beginner  
Title: Миграции с Flyway и LiquiBase. Основы управления БД  
Link: https://www.youtube.com/watch?v=GKTIxws7EkE  

---

Pe baza surselor furnizate, iată teoria despre **Flyway** și **Liquibase**, precum și conceptul general de migrare a bazelor de date, tradusă și sintetizată în limba română:

### Conceptul de Migrare a Bazei de Date
**Migrația** reprezintă o modificare versiunată a stării bazei de date, care se aplică într-o ordine **strictă, secvențială și reproductibilă**. Această abordare permite bazei de date să evolueze și să se îmbunătățească sub un control riguros, asigurând că dezvoltatorii nu pierd date și pot reproduce starea bazei pe orice mediu. Spre deosebire de gestionarea automată prin Hibernate (care doar încearcă să potrivească entitățile cu tabelele), migrațiile oferă un control explicit asupra fiecărei schimbări de schemă.

### Flyway
*   **Filozofie și Control:** Flyway este descris ca un instrument care oferă un control **simplu și strict**, bazat pe cod **SQL**. Toate modificările (artefactele de migrare) sunt fișiere SQL versiunate pe care motorul Flyway le execută în ordine.
*   **Gestionarea Erorilor (Rollback):** O caracteristică importantă este că Flyway **nu are funcție nativă de rollback** (anularea unei migrații prin comandă). Dacă o migrare eșuează sau conține o eroare logică, practica recomandată este să se creeze o **nouă migrație** care să corecteze eroarea, asigurând astfel continuitatea bazei de date.
*   **Integritate:** Flyway folosește un tabel de istoric (`flyway_schema_history`) unde stochează o sumă de control (**checksum**) pentru fiecare fișier; dacă un fișier de migrare deja aplicat este modificat ulterior chiar și cu un singur caracter, Flyway va raporta o eroare și nu va porni aplicația.

### Liquibase
*   **Management Declarativ:** Liquibase adoptă o filozofie de management **declarativ**, concentrându-se pe „ce” trebuie să facă baza de date, nu neapărat pe „cum” (prin SQL direct).
*   **Versatilitatea Formatelor:** Permite scrierea migrațiilor în diverse formate, cum ar fi **XML, YAML, JSON**, dar și SQL standard. Acest lucru permite ca aceeași migrație să fie portabilă între diferite tipuri de baze de date (de exemplu, de la PostgreSQL la Oracle sau MySQL), deoarece Liquibase traduce instrucțiunile în dialectul specific.
*   **Funcționalități Avansate:** Spre deosebire de Flyway, Liquibase **suportă rollback-uri**, permițând revenirea la o stare anterioară, deși această funcție trebuie folosită cu mare atenție pentru a nu șterge date importante.
*   **Complexitate:** Este considerat un instrument „mai greu” și mai complex, adesea utilizat în proiecte de tip **Enterprise** care au cerințe stricte de infrastructură și necesită abstractizare față de codul SQL nativ.

### Comparație și Recomandări
*   **Alegerea instrumentului:** Flyway este recomandat pentru **startup-uri sau proiecte mici**, unde simplitatea este prioritară, în timp ce Liquibase este preferat pentru sisteme complexe care pot interacționa cu multiple tipuri de baze de date.
*   **Responsabilitatea dezvoltatorului:** Indiferent de instrumentul ales, responsabilitatea finală revine dezvoltatorului, care trebuie să definească migrațiile pas cu pas pentru a menține consistența sistemului.
*   **Dezavantajul Hibernate:** Utilizarea setării `update` din Hibernate pentru a gestiona baza de date în producție este considerată o practică greșită, deoarece nu oferă control asupra datelor existente și poate duce la blocaje atunci când se adaugă constrângeri noi (ex: `NOT NULL` pe o tabelă care are deja date).
