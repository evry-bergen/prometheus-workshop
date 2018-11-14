## Monitorering med Prometheus

[Prometheus](https://prometheus.io/) er et OSS system for monitorering av
tjenester og systemer. Opprinnelig utviklet av SoundCloud i 2012 og ble fra 2016
medlem av [Clound Native Computing Foundation](https://www.cncf.io/)

Prometheus skiller seg fra andre monitoreringssystemer med at den implementerer
en dimensjonal datamodell hvor tidsserier identifiseres med et navn og et sett
med key-value nøkkelpar. PromQL er spørrespråket som tillater å søke inn i
tidsserier og massere innsamlet data for presentasjon og alarmer.

Der Prometheus skiller seg mest er det rike økosystemet med integrasjoner.
Med over 200 client for ulike programmeringsspråk og rammeverker og snart 2000
integrasjoner med 3 parts programvare i tilegg til at mange nå kommer med
innebygget støtte for Prometheus metrics.

I denne presentasjonen vil vi gi en introduksjon til hvordan du kan samle inn
data fra maskiner og applikasjoner for så å komponere spørringer mot disse
dataene med prometheus sitt eget språk
[`PromQL`](https://prometheus.io/docs/prometheus/latest/querying/basics/) for å
genere grafer.
