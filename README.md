# Konteeksamen PGR301
## Kandidatnr: 1001

## Del 1 - Prinsipper

* Kontinuerlig integrasjon - hva mener vi med dette, og hvorfor er dette viktig?

Kontinuerlig integrasjon (CI) er prosessen ved kontinuerlig og automatisk bygging, testing og integrering av endringer i kode i et delt repository så ofte som mulig. Dette bidrar til å sikre at ny kode er kompatibel med den eksisterende kodebasen og hjelper til med å oppdage og fikse integrasjonsproblemer/bugs tidlig i utviklingsprosessen. Ved å oppdage problemer tidlig er det lettere å fikse dem, og kvaliteten på koden som skrives forbedres. Et større utviklingsteam kan samarbeide om denne prosessen ved å sikre at alle kodeendringer blir pushet til det delte repositoriet ofte og at tester automatiseres og kjøres hver gang en kodeendring blir pushet. Dette bidrar til å opprettholde en kodebase av høy kvalitet og minimere risikoen for at problemer oppstår under integrasjonsprosessen.



* Kontinuerlige leveranser - hva mener vi med dette og hvorfor er det viktig?

Kontinuerlig levering (CD) er prosessen ved å automatisk pushe kodeendringer til produksjon eller andre lignende miljøer så snart de går gjennom integrasjonsprosessen uten feil. Dette inkluderer automatisert testing og distribusjon, som reduserer risikoen for å introdusere nye problemer i produksjonsmiljøet. Ved å automatisere distribusjonsprosessen kan større team distribuere kodeendringer oftere, noe som fører til en raskere tid til markedet og redusert risiko for distribusjonsfeil. Et større utviklingsteam kan samarbeide om denne prosessen ved å sikre at distribusjonen av ny kode er automatisert og testet, og at endringer automatisk distribueres til produksjon eller andre lignende miljøer så snart de er klare og fungerer med resten av kodebasen uten feil.


* Forklar hvorfor det er enklere å få denne innsikten når man adopterer DevOps, i forhold til Vannfall og et skille mellom drift- og utviklingsteam.

DevOps legger vekt på samarbeid og kommunikasjon mellom ulike team, inkludert utvikling, drift og testing, gjennom hele utviklingen av prosjektet. Dette bidrar til å sikre at problemer oppdages og løses tidlig, og reduserer risikoen for feil i produksjonen. I motsetning til dette skiller Vannfall kodere fra andre team og foretrekker en lineær, sekvensiell prosess. Dette kan gjøre det vanskeligere å oppdage og fikse problemer tidlig og kan føre til lengre utviklingsperioder. I DevOps jobber teamene sammen for å sikre at kode leveres raskt og med høy kvalitet, noe som gjør det enklere å samle innsikt om både de tekniske og de forretningsmessige aspektene ved applikasjonen.

* Forklar hvordan du kan implementere en løsning basert på tjenester i Amazon Webservices for å få denne oversikten. Hva må du konfigurere i AWS, og hva må du gjøre i applikasjonen?

AWS tilbyr flere tjenester for overvåking og analyse av applikasjoner. For å få innsikt i en applikasjon kan man bruke AWS CloudWatch til å overvåke applikasjonens ytelse, inkludert responstid, feilfrekvens, CPU-bruk og minnebruk. CloudWatch kan også varsle personer basert på regler man setter opp, som igjen hjelper teamet å få varsling snarest om noe krever deres oppmerksomhet. For å bruke CloudWatch, må teamet konfigurere tjenesten for å samle inn data fra applikasjonen deres, noe som krever å legge til kode i applikasjonen for å samle inn og rapportere det. I tillegg kan man bruke AWS X-Ray til å spore forespørsler gjennom applikasjonen og identifisere i applikasjonen ytelsen er mangelfull. For å bruke X-Ray, må man inkludere X-Ray SDK i applikasjonen sin og konfigurere X-Ray daemon til å motta data fra applikasjonen. Totalt sett tilbyr AWS flere gode verktøy som kan hjelpe team med å samle verdifull innsikt om både de tekniske og forretningsmessige aspektene ved applikasjonen deres, noe som gjør det enklere å overvåke og forbedre applikasjonens ytelse og bruk.


## Del 2 - oppg2

Beskriv med ord eller skjermbilder hvordan man kan konfigurere GitHub på en slik måte at 

 Det ikke er mulig å merge en Pull Request inn i main branch, uten at koden kompilerer og enhetstester er kjørt uten feil.

- Gå til settings på repositoriet du ønsker å gjøre dette på
- Velg "Branches" i menyen på venstre side
- Under "Branch protection rules", trykk på "Add rule"
- Under "Branch name pattern", skriv inn "main"
- Kryss av boksen for "Require status checks to pass before merging"
- Under "Status checks found in the last week for this repository" velg den testen du ønsker kjørt (f.eks. "Java CI with Maven")
- Kryss av boksen for "Require branches to be up to date before merging"
- Trykk på "Create" for å lagre og du er ferdig

Minst en annen person i teamet har godkjent endringen

Jeg kunne ikke finne spesifikt hvor man setter opp andre personer som også må godkjenne, men her er noe lignende:

- Følg steg over inn til "Branches"
- Nå trykk "edit" på regelen du nettopp har laget
- Kryss av "Require conversation resolution before merging". Dette gjør at alle kommentarer på requesten må være resolved før den kan merges inn i branchen som er beskyttet.


## Del 3 docker - oppg2

For å bygge et Docker image fra Dockerfile skriver man `docker build -t bakemyday:latest .` i samme mappe man har Dockerfilen.

Beskriv hva sensor må gjøre for å få workflowen til å fungere i sin egen GitHub-konto:

Docker hub token:
- Logg inn på din Docker Hub bruker 
- Trykk på brukernavnet ditt, og velg "Account settings"
- Trykk på "Security"
- Under "access tokens" trykk på "new access token"
- Gi den nye token et navn og gi full tilgang
- Trykk på "Create" for å lage ny token
- Kopier ned denne token

Ny github action workflow
- Lag en ny fil i samme mappe som maven workflow (.github/workflows/build-and-push.yml)
- Kopier koden fra min fil

Filen jeg har laget har secrets. Sette opp secrets:
- Trykk på settings inne på repositoriet ditt
- Så trykk på secrets
- Lag to nye repository secrets - "DOCKER_USERNAME" og "DOCKER_PASSWORD"
- DOCKER_USERNAME skal være ditt brukernavn på Docker Hub
- DOCKER_PASSWORD skal være access token vi hentet tidligere

Med innstillingene fra min fil, mer spesifikt under "on", så vil denne action kjøre hver gang noen pusher til repositoriet.

Jeg fikk ikke til at denne action linker riktig med Docker Hub da jeg ikke fant riktige versjoner for java version eller maven version som Docker Hub aksepterer.
