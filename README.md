# The Skool – analys av YH-ansökningar 2025

Analys av Myndigheten för yrkeshögskolans (MYH) beslut för ansökningsomgång 2025,
gjord för utbildningsanordnaren The Skool. Syftet är att hjälpa The Skool
att fatta datadrivna beslut om vilka utbildningar de ska söka.

Data: Resultat ansökningsomgång 2025, Tabell 3 (MYH) – 1 184 ansökningar
verktyg: PostgreSQL 16, Python (pandas, SQLAlchemy), Git



 Projektstruktur

```
the_skool_daniel_kiros/
├── data/resultat_2025.xlsx   # Rådata från MYH (endast Tabell 3)
├── keep_tabell3.py           # Tar bort alla flikar utom Tabell 3
├── load_data.py              # Laddar in datan i Postgres
├── uppgift_1.sql         # Grundläggande EDA
└── uppgift_3.sql         # Datadrivna frågor
└── images/               # Skärmdumpar
```


Uppgift 1 – Grundläggande EDA

Ansökningar per utbildningsområde
[Ansökningar per område](images/1a_ansokningar_per_omrade.png)

Ekonomi, Teknik och Data/IT är de områden som får flest ansökningar,
med över 200 ansökningar vardera.

Topp 5 län efter beviljade ansökningar
[Topp 5 län](images/1g_topp5_lan.png)

Stockholm och Västra Götaland delar förstaplatsen med 89 beviljade ansökningar.
103 beviljade ansökningar har "Flera kommuner" som län och exkluderades,
eftersom det inte framgår av Tabell 3 vilka län de gäller.

Utbildningar som innehåller "AI"
[AI-utbildningar](images/1i_ai_utbildningar.png)

48 utbildningar innehåller ordet AI. Jag använde `LIKE` (skiftlägeskänslig)
i stället för `ILIKE`, eftersom `ILIKE '%ai%'` gav 56 träffar inklusive felaktiga
som "Sustainable", "Supply Chain" och "Maintenance".

---

Uppgift 3 – Datadrivna beslut

Röd tråd: Var har The Skool bäst chans att få ansökningar beviljade?**

Fråga 1: Beviljandegrad per utbildningsområde
![Beviljandegrad](images/3_fraga1_beviljandegrad.png)

Data/IT har näst flest ansökningar men lägst beviljandegrad, 14 %.
Teknik och tillverkning samt Hälso- och sjukvård ligger runt 53 %.

Fråga 2: AI-utbildningar
[AI](images/3_fraga2_ai.png)

Bara 2 av 48 AI-utbildningar beviljades (4 %), jämfört med 40 % för övriga.

Fråga 3: Distans eller bunden (Data/IT)
[Studieform](images/3_fraga3_studieform.png)

Inom Data/IT beviljas bunden undervisning (16 %) mer än dubbelt så ofta
som distans (7 %).

Fråga 4: Privat eller offentlig anordnare
[Huvudmannatyp](images/3_fraga4_huvudman.png)

Kommunala anordnare beviljas oftare (58 %) än privata (35 %).

Fråga 5: Konkurrenter inom Data/IT
[Konkurrenter](images/3_fraga5_konkurrenter.png)

Nackademin fick 7 av 12 ansökningar beviljade, långt över snittet på 14 %.

---

Rekommendationer till The Skool

- Var försiktig med att söka renodlade AI-utbildningar – nästan alla avslogs 2025.
- Inom Data/IT: satsa hellre på bunden undervisning än distans.
- Överväg områden med hög beviljandegrad, t.ex. Teknik och tillverkning.
- Undersök vad som skiljer Nackademins beviljade utbildningar från andras.

---
 Användning av LLM

- felsökning av git och SQL-syntax
- förslag på SQL-frågor
