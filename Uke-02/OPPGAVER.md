# Oppgaver – Uke 2

## Oppgave 3 – Lag en app for å regne ut lønn

- Opprett et nytt view som heter `SalaryCalculatorView`
- Legg til en `Text` som skal være sentrert i midten av en `HStack`
- Legg så til en ny `HStack` med to knapper, en for «+» og en for «-»
- Lag en `@State`-variabel som holder antallet timer du har jobbet
- Knappene skal endre verdien med pluss én og minus én
- Lag en funksjon som regner ut den totale summen, basert på antall timer og en timeslønn
- Vis resultatet i bunnen av skjermen med en `Label`

## Oppgave 4 – Lag en portefølje

Vi begynner å få maaange views nå, og det er ikke så god plass i `TabView`-et vårt. Derfor skal dere nå lage en portefølje hvor vi kan liste alle oppgavene vi ikke vil ha synlig i `TabView`.

- Opprett et nytt view som heter `PortfolioView`
- Legg til en `Form`
- Legg til en `Section` med tittelen «Oppgaver»
- Legg til alle oppgavene du vil ha listet i CV-en som `NavigationLink`-er som peker til viewet vi laget, for eksempel Vaffeloppskrift, Skyss-billett eller Lønnskalkulator
- Legg til `PortfolioView` i `TabView` pakket inn i en `NavigationStack`
- Bruk gjerne et hjerte som symbol/ikon for taben
