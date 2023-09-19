# Assignment 1: ESP Solar Power 🌞️

## Lernziele

Datentypen, Operatoren, Verzweigungen, Schleifen, Ein-/Ausgabe, Funktionen, Konstanten

## Spezifikation

- Alle Ausgaben erfolgen auf stdout
  - Keinerlei Ausgaben auf stderr
- Abgabe bis _spätestens_: 17.11.2022 um 14 Uhr (in Österreich gültige Zeit)
- Abzugebende Datei: `a1.c`

## Bewertung

Das Assignment wird [wie im TeachCenter beschrieben](https://tc.tugraz.at/main/mod/page/view.php?id=55761) bewertet. Mache dich auch mit dem [Beurteilungsschema](https://tc.tugraz.at/main/mod/page/view.php?id=55602) für die Übungen vertraut, insbesondere mit den Regeln zu [Plagiaten](https://tc.tugraz.at/main/mod/page/view.php?id=55602#Plagiate)!

> **Achtung:** Bitte befolge die Anweisungen zur Ausgabe _genau_, da die Test Cases selbst bei kleinen Fehlern (z.B. ein Leerzeichen
> zu wenig oder zu viel) fehlschlagen! Nutze auch das zur Verfügung gestellte Testsystem, welches wertvolle Hinweise auf Fehler in deinem Programm liefert.
> Verwende die in den Lernzielen aufgezählten Konzepte; ansonsten werden bei der Bewertung Punkte abgezogen!

> **Achtung:** Eine Abgabe bei A1 führt am Semesterende zu einer Beurteilung in der KU ESP. Wenn du keinen Commit zu A1 pusht, dann erhältst du keine Beurteilung für die KU – auch kein Nicht Genügend. Wenn du bei A1 einen Commit pusht, jedoch keine Beurteilung am Semesterende erhalten möchtest, dann ist das auch möglich. Pushe dazu _vor Ablauf der A1-Abgabefrist_ noch einen letzten Commit mit der Commit-Message `exit KU`.

---

## Aufgabenstellung

Es soll ein Programm geschrieben werden, welches den Break-Even-Point einer Photovoltaik-Anlage (PV-Anlage) für Privathaushalte abschätzt. Der Break-Even-Point ist der Zeitpunkt, an dem die Kosten der Anlage gleich groß sind wie die Erlöse. (Direkt nach dem Kauf einer PV-Anlage überwiegen zwar die Kosten, aber mit voranschreitender Zeit (bis zum Break-Even-Point) werden diese nach und nach durch die Erlöse ausgeglichen.)

Die verwendeten PV-Module haben eine Leistung von $`0.375\text{ kWp}`$ und kosten $`259.99\text{ €}`$.

Der Ablauf des Programmes wird nun Schritt für Schritt erklärt.

<details>
<summary>
Zusatzinfo: Was sind "kWp"?
</summary>
Die Abkürzung "kWp" steht für das Leistungsmaß Kilowatt-Peak. Damit wird die Höchstleistung, die eine Photovoltaikanlage bei definierten Bedingungen erbringen kann in Kilowatt (kW) angegeben. Für die Bestimmung dieser Leistung gibt es einen standardisierten Test. Auf diese Weise können die PV-Module von unterschiedlichen Herstellern miteinander vergleichen werden.
</details>

### Eingaben durch die\*den Benutzer\*in

#### Eingabe der Anzahl der Module

Im ersten Schritt wird die\*der Benutzer\*in zur Eingabe der verbauten PV-Module aufgefordert. Eine gültige Eingabe ist eine Ganzzahl ≥ 1 und ≤ 80. Die Eingabeaufforderung hat die folgende Form:

```
Number of solar modules: <number>
```

Dabei wird `<number>` durch den (mit Enter abgeschlossenen) User-Input ersetzt. Die spitzen Klammern sind _nicht_ Teil des User-Inputs. Die [Beispielausgaben](#beispielausgaben) verdeutlicht, wie die Ausgabe auszusehen hat.

Sollte die Eingabe nicht gültig sein, erscheint folgende Fehlermeldung:

```
Invalid input! The number of solar modules must be an integer greater than or equal to 1 and less than or equal to 80.\n
```

Die hier abgebildeten Zeichen `\` und `n` sind nicht als einzelne Zeichen auszugeben, sondern sind als Newline-Character (`\n`) zu verstehen. Auch bei den anderen Ausgaben, die in dieser Angabe beschrieben werden, bezeichnet `\n` den Newline-Character.

Nach der Fehlermeldung startet das Einlesen von vorne (so lange, bis die Eingabe gültig ist).

> **Tipp:** Bei den Test Cases zu diesem Assignment wird nur mit einzelnen Ganzzahlen als Eingabe getestet. Du musst dir also keine Gedanken darüber machen, wie das Programm mit anderen Eingaben (z.B. Buchstaben oder mehrere durch Leerzeichen getrennte Ganzzahlen) umgehen soll. Es kann allerdings vorkommen, dass in den Test Cases Ganzzahlen eingegeben werden, die außerhalb des gültigen Intervalls liegen.

<details>
<summary>
Info für Interessierte: Warum gehen wir von einer maximalen Anzahl von 80 aus? 
</summary>
Werden mehr als 80 PV-Module verbaut, muss eine zusätzliche Leitung zum nächsten Transformator gelegt werden. Das würde die Berechnungen verkomplizieren.
</details>

#### Eingabe der staatlichen Förderung

Aufgrund der Klimakrise fördert der Staat die Anschaffung von PV-Anlagen, da diese dabei helfen, CO<sub>2</sub> einzusparen. Die übernommenen Kosten zahlt der Staat innerhalb eines Jahres nach dem Kauf der PV-Anlage aus. Unser Programm fragt im nächsten Schritt nach der Höhe der staatlichen Subventionen (gemessen in Prozent der Anschaffungskosten).

```
Subsidy in % of the investment: <number>
```

Auch hier steht `<number>` für den (mit Enter abgeschlossenen) User-Input.

> **Tipp:** Um das Prozentzeichen `%` mit dem Format-String von `printf` auszugeben, benötigst du im Format-String _zwei_ aufeinanderfolgende Prozentzeichen (also `%%`), weil das Prozentzeichen im Format-String eine besondere Bedeutung hat.

Eine gültige Eingabe ist eine Ganzzahl ≥ 0 und ≤ 100. Falls eine ungültige Ganzzahl eingegeben wird, erscheint folgende Fehlermeldung:

```
Invalid input! The subsidy must be an integer greater than or equal to 0 and less than or equal to 100.\n
```

#### Eingabe der Ausrichtung der Module

Die produzierte Energie der PV-Module ist abhängig von der Montageausrichtung. Daher fragt das Programm danach:

```
Direction of the photovoltaic system:
1: SOUTH
2: SOUTH-EAST
3: EAST
4: SOUTH-WEST
5: WEST
Please enter the direction: <number>
```

Auch hier ist `<number>` ein Platzhalter für einen User-Input, welcher `1`, `2`, `3`, `4` oder `5` sein muss. Nach einer Falscheingabe wird die Eingabeaufforderung

```
Please enter the direction: <number>
```

so oft wiederholt, bis eine gültige Eingabe getätigt wurde.

Eine nicht optimal ausgerichtete Anlage (nicht nach Süden) vermindert den Ertrag der Anlage, wie aus der folgenden Tabelle hervorgeht.

| Ausrichtung | Ertrag in Prozent (bezogen auf optimale Ausrichtung) |
| ----------- | ---------------------------------------------------- |
| SOUTH       | 100                                                  |
| SOUTH-EAST  | 95                                                   |
| EAST        | 90                                                   |
| SOUTH-WEST  | 95                                                   |
| WEST        | 90                                                   |

#### Eingabe des Strompreises

Im nächsten Schritt wird die\*der Benutzer\*in zur Eingabe des Strompreises aufgefordert. Das ist der Preis, den man pro eingespeister kWh vom Energieversorgungsunternehmen erhält. Der Preis (in Cent) muss eine Ganzzahl zwischen 1 und 100 sein. Mit der folgenden Ausgabe bittet das Programm um die Eingabe des Strompreises:

```
Electricity rate in cents/kWh: <rate>
```

`<rate>` ist ein Platzhalter für den User-Input.

Sollte die Eingabe nicht gültig sein, erscheint folgende Fehlermeldung:

```
Invalid input! The electricity rate must be an integer which is at least 1 and must not exceed 100 cents/kWh.\n
```

Nach der Fehlermeldung startet das Einlesen von vorne (so lange, bis die Eingabe gültig ist).

### Ausgaben und Berechnungen

Nachdem alle wichtigen Informationen zur PV-Anlage eingegeben wurden, erfolgt die Ausgabe wichtiger Daten, die zum Teil zuvor eingegeben wurden und zum Teil berechnet werden. Alle Gleitkommazahlen sollen dabei im gesamten Programm auf **2 Nachkommastellen** genau angezeigt werden.

#### Ausgabe eingelesener Werte und der Leistung

Zunächst wird die Anzahl der Module samt Montagerichtung ausgegeben. Werden mehrere Module verbaut, so soll die Ausgabe

```
<n_modules> modules facing <direction>.\n
```

lauten, wobei `<n_modules>` die zuvor eingegebene Anzahl an Modulen bezeichnet und `<direction>` je nach eingegebener Ausrichtung durch `SOUTH`, `SOUTH-EAST`, `EAST`, `SOUTH-WEST` oder `WEST` ersetzt werden soll. Wird nur ein Modul verbaut, so soll die Ausgabe 

```
One module facing <direction>.\n
```

lauten.

Es folgt die Ausgabe der maximal erreichbaren Leistung bei optimaler Ausrichtung:

```
Achievable total power: <total power> kWp.\n
```

wobei `<total power>` ein Platzhalter für die maximal erreichbare Leistung bei einer Ausrichtung nach Süden ($`0.375 \cdot \texttt{<modules>}`$) ist.

Wenn die Anlage nicht nach Süden ausgerichtet ist, soll folgende Meldung erscheinen:

```
However, due to the suboptimal direction, only <achieved total power> kWp are achieved.\n
```

wobei `<achieved total power>` für die maximal erreichbare Leistung bei der gewählten Ausrichtung steht. Sie kann mit $`\texttt{<total power>} \cdot p`$ berechnet werden, wobei der zu verwendende Wert $`p \in \{0.9, 0.95, 1\}`$ obiger Tabelle zu entnehmen ist.


#### Ausgabe der zukünftigen Erlöse und noch zu tilgenden Kosten

##### Ertragsmodell und Berechnung der Erlöse

Zum Abschluss soll für jedes Jahr vor Erreichung des Break-Even-Points ausgegeben werden, welcher Teil der Kosten nach dem entsprechenden Jahr noch nicht durch Erlöse der PV-Anlage kompensiert wurde. Dazu muss zunächst berechnet werden, wie hoch die jährlichen Erlöse der PV-Anlage sind. Das erfordert wiederum Kenntnis über die Menge an elektrischer Energie, die aus Sonnenenergie gewonnen werden kann. Wie viel Sonnenenergie an einem Tag in elektrische Energie umgewandelt werden kann, hängt auch von der Anzahl der Sonnenstunden ab. Die Anzahl der Sonnenstunden ist aber nicht an jedem Tag gleich. Deshalb wird ein Modell genutzt, das den sogenannten spezifischen Ertrag (gemessen in kWh/kWp) über das Jahr hinweg angibt.

<details>
<summary>Info für Interessierte: Was ist der spezifische Ertrag?</summary>
Um die Erträge verschieden großer PV-Anlagen miteinander vergleichen zu können, wird der Ertrag der PV-Anlage (umgewandelte Sonnenenergie in elektrische Energie (kWh)) auf die Leistung der Anlage normiert. Der Ertrag über einen gewissen Zeitraum (bei uns Tage) wird durch die Leistung in kWp dividiert. Man erhält dann kWh pro kWp. Will man nun die Anlage um z. B. 2 kWp vergrößern, so multipliziert man den spezifischen Ertrag mit den 2 kWp und erhält so den zusätzlichen Ertrag.  
</details>

In unserem Modell (siehe aufklappbare Infobox unten für mehr Details) ergibt sich ein spezifischer Ertrag pro Jahr – wir nennen ihn $`y^{spez}`$ – in Höhe von $`905 \frac{\text{kWh}}{\text{kWp}}`$.

<details>
<summary>Info für Interessierte: Wie kann so ein Modell für den spezifischen Ertrag aussehen?</summary>
In diesem Modell ist z. B. der spezifische Ertrag im Sommer wesentlich höher als im Winter. Folgende Tabelle fasst das Modell zusammen. (Weiter unten werden wir erklären, wie aus dem spezifischen Ertrag der Ertrag und daraus die Erlöse berechnet werden können.)

| Name des Zeitintervalls | Jahreszeit              | Zeiteinheit $`t`$ [Tag] | Spez. Ertrag [kWh/kWp] pro Tag |
| ----------------------- | ----------------------- | ----------------------- | ------------------------------ |
| `Z1`                    | Winter                  | 0 - 60                  | 1                              |
| `Z2`                    | Frühling                | 60 - 150                | 2.5                            |
| `Z3`                    | Sommer                  | 150 - 240               | 4                              |
| `Z4`                    | Herbst                  | 240 - 330               | 2.5                            |
| `Z5`                    | Winter                  | 330 - 365               | 1                              |

Dabei kennzeichnet $`t=0`$ den Anfang des Jahres (1. Jänner um 0:00 Uhr). $`t=1`$ entspricht dem Ende des 1. Jänners (24:00 Uhr) und gleichzeitig auch den Beginn des 2. Jänners (0:00 Uhr) und so weiter. Schließlich bildet $`t=365`$ das Ende des Jahres (31. Dezember um 24:00 Uhr), welches gleichzeitig dem Beginn ($`t=0`$) des darauffolgenden Jahres entspricht. (Um die Berechnung zu vereinfachen, wird angenommen, dass ein Jahr immer **365 Tage** hat; es gibt also keine Schaltjahre.)

In anderen Worten: Die Zeit wird als eine Ganzzahl im Intervall $`t=0`$ bis $`t=365`$ angegeben. Damit sind 366 Werte für $`t`$ möglich. Es gibt allerdings nur 365 Tage, weil es 365 "Zwischenräume" zwischen diesen 366 Werten gibt.

Obige Tabelle beschreibt eine Funktion des spezifischen Ertrags. Diese Funktion ist abschnittweise konstant (z. B. beträgt sie zwischen der Zeit $`0`$ und $`60`$ durchgehend $`1`$.) Der Wert der Funktion zu jedem beliebigen Zeitpunkt gibt den spezifischen Ertrag für den entsprechenden Tag an. Um daraus den spezifischen Ertrag pro Jahr zu erhalten, müssen lediglich die spezifischen Erträge aller Tage addiert werden.

<details>
<summary>Info für Interessierte: Wie würde der spezifische Ertrag für das gesamte Jahr bei komplizierteren Ertragsmodellen berechnet werden?</summary>

Bei komplizierteren Modellen (wo sich z. B. der spezifische Ertrag auch innerhalb eines Tages ändert) müsste ein bestimmtes Integral berechnet werden, um den jährlichen spezifischen Ertrag zu berechnen. Auch bei unserem einfachen Ertragsmodell könnte man das bestimmte Integral berechnen, um den spezifischen Ertrag pro Jahr zu berechnen. Geometrisch betrachtet, ist das bestimmte Integral die "Fläche unter der Kurve" (Fläche, welche sich im festgelegten Zeitraum zwischen dem Nullpunkt und der Funktion befindet). Unsere Funktion des spezifischen Ertrags ist stufenförmig, das bedeutet wir können das bestimmte Integral mithilfe von Rechtecken für jedes Zeitintervall berechnen und diese dann addieren, um den gesamten spezifischen Ertrag pro Jahr zu erhalten. Die folgende Formel zeigt auf etwas kompliziertere Weise, dass bei unserer Funktion des spezifischen Ertrags lediglich alle spezifischen Erträge pro Tag zu addieren sind, um den Wert für das gesamte Jahr zu erhalten.


```math
\begin{equation}
\begin{split}
F = \int_0^{365} f(t) \, dt & =
\int_0^{60} 1 \frac{\text{kWh}}{\text{kWp}} \, dt
+
\int_{60}^{150} 2,5 \frac{\text{kWh}}{\text{kWp}} \, dt + \int_{150}^{240} 4 \frac{\text{kWh}}{\text{kWp}} \, dt
+
\int_{240}^{330} 2,5 \frac{\text{kWh}}{\text{kWp}} \, dt
+
\int_{330}^{365} 1 \frac{\text{kWh}}{\text{kWp}} \, dt \\ & =  60 \frac{\text{kWh}}{\text{kWp}} + 225 \frac{\text{kWh}}{\text{kWp}} + 360 \frac{\text{kWh}}{\text{kWp}} + 225 \frac{\text{kWh}}{\text{kWp}} + 35 \frac{\text{kWh}}{\text{kWp}} \\ & = 905 \frac{\text{kWh}}{\text{kWp}}
\end{split}
\end{equation}
```


</details>

Der gesamte spezifische Ertrag der ersten 60 Tage (Zeitintervall `Z1`) beträgt

```math
\begin{equation}
y^{spez}_{Z1} = 60 \text{d} \cdot 1 \frac{\text{kWh}}{\text{kWp} \cdot \text{d}} = 60 \frac{\text{kWh}}{\text{kWp}}
\text{,}
\end{equation}
```

wobei $`\text{d}`$ die Zeiteinheit _Tag_ bezeichnet. Analog dazu der gesamte spezifische Ertrag des Zeitintervalls `Z2`

```math
y^{spez}_{Z2} = (150-60) \text{d} \cdot 2,5 \frac{\text{kWh}}{\text{kWp} \cdot \text{d}} = 225 \frac{\text{kWh}}{\text{kWp}}
```

und so weiter. Wenn die spezifischen Ertäge der einzelnen Zeitintervalle zusammengezählt werden, erhalten wir

```math
\begin{equation}
y^{spez} = y^{spez}_{Z1} + y^{spez}_{Z2} + y^{spez}_{Z3} + y^{spez}_{Z4} + y^{spez}_{Z5}
\end{equation}
```

und damit den gesamten spezifischen Ertrag pro Jahr (gemessen in kWh/kWp).
</details>

Aus dem spezifischen Ertrag $`y^{spez}`$ einer Anlage erhalten wir durch Multiplikation mit der Leistung der Module (`<achieved total power>`) den Ertrag $`y`$ der Anlage (gemessen in kWh). Das heißt
```math
y = y^{spez} \cdot \texttt{<achieved total power>}
\text{.}
```

Mit dem Ertrag (gemessen in kWh) pro Jahr können die Erlöse (gemessen in Cent) pro Jahr mit

```math
\text{Erlöse pro Jahr} = y \cdot r
```

berechnet werden, wobei $`r`$ den Strompreis in Cent bezeichnet.

##### Ausgabe zu Kosten und jährlichen Erlösen.

Nachdem die jährlichen Erlöse berechnet wurden, werden sie zusammen mit den Kosten ausgegeben:

```
Investment of <costs> leads to earnings of <earnings> each year.\n
```

Dabei sind `<costs>` und `<earnings>` Platzhalter für die Anschaffungskosten der PV-Anlage bzw. die jährlichen Erlöse, die von der Anlage generiert werden.

##### Ausgaben zu den Jahren vor Erreichung des Break-Even-Points

Für jedes Jahr, in welchem der Break-Even-Point noch nicht erreicht wurde, soll ausgegeben werden, welcher Teil der Kosten bereits durch Erlöse kompensiert wurde. Diese Ausgabe hat die Form

```
After year <year>: <costs_to_compensate> still to compensate.\n
```

wobei `<year>` durch das jeweilige Jahr (1, 2, 3, …) und `<costs_to_compensate>` durch die noch offenen Kosten in € (mit zwei Nachkommastellen) zu ersetzen ist.

> **Beispiel:** Wenn die Kosten einer Anlage 259,99 € betragen und die Anlage 100 € im Jahr an Erlösen bringt und nicht gefördert wird, dann sollen die Ausgaben `After year 1: 159.99 still to compensate.\n` und `After year 2: 59.99 still to compensate.\n` erzeugt werden. (Für weitere Beispiele siehe [Beispielausgaben](#beispielausgaben).)

Wenn die PV-Anlage staatlich gefördert wird, dann soll die Förderung in der Ausgabe für das erste Jahr, in dem der Break-Even-Point noch nicht erreicht wurde, ebenfalls berücksichtigt werden. Dabei werden nicht nur die jährlichen Erlöse sondern auch die Förderung von den Kosten subtrahiert. In diesem Fall hat die Ausgabe für das erste Jahr die Form

```
After year 1: <costs_to_compensate> still to compensate. (<subsidy> paid by the government)\n
```

wobei `<costs_to_compensate>` durch die noch offenen Kosten in € und `<subsidy>` durch die erhaltene staatliche Förderung in € (mit je zwei Nachkommastellen) zu ersetzen sind.

##### Ausgabe zum Break-Even-Point

Zum Schluss erfolgt die Ausgabe, nach wie vielen Jahren der Break-Even-Point erreicht wurde. Falls dafür mehrere Jahre nötig sind, soll die Ausgabe

```
PV system amortized within <years> years.\n
```

erscheinen, wobei `<years>` durch das Jahr zu ersetzen ist, in dem der Break-Even-Point erreicht wurde. Wenn der Break-Even-Point bereits innerhalb eines Jahres erreicht wird, soll

```
PV system amortized within a year.\n
```

ausgegeben werden.


> **Beispiel:** Wenn die Kosten einer Anlage 259.99 € betragen und die Anlage 100 € im Jahr an Erlösen bringt, dann soll nach den Ausgaben im vorangegangenen Beispiel die Ausgabe `PV system amortized within 3 years.` erfolgen.


## Beispielausgaben

### Beispielausgabe 1

```
Number of solar modules: 0
Invalid input! The number of solar modules must be an integer greater than or equal to 1 and less than or equal to 80.
Number of solar modules: 345
Invalid input! The number of solar modules must be an integer greater than or equal to 1 and less than or equal to 80.
Number of solar modules: 5
Subsidy in % of the investment: 90
Direction of the photovoltaic system:
1: SOUTH
2: SOUTH-EAST
3: EAST
4: SOUTH-WEST
5: WEST
Please enter the direction: 9
Please enter the direction: 3
Electricity rate in cents/kWh: 20
5 modules facing EAST.
Achievable total power: 1.88 kWp.
However, due to the suboptimal direction, only 1.69 kWp are achieved.
Investment of 1299.95 leads to earnings of 305.44 each year.
PV system amortized within a year.

```


### Beispielausgabe 2

```
Number of solar modules: 2
Subsidy in % of the investment: 10
Direction of the photovoltaic system:
1: SOUTH
2: SOUTH-EAST
3: EAST
4: SOUTH-WEST
5: WEST
Please enter the direction: 1
Electricity rate in cents/kWh: 19
2 modules facing SOUTH.
Achievable total power: 0.75 kWp.
Investment of 519.98 leads to earnings of 128.96 each year.
After year 1: 339.02 still to compensate. (52.00 paid by the government)
After year 2: 210.06 still to compensate.
After year 3: 81.09 still to compensate.
PV system amortized within 4 years.

```

### Beispielausgabe 3

```
Number of solar modules: 1
Subsidy in % of the investment: -1
Invalid input! The subsidy must be an integer greater than or equal to 0 and less than or equal to 100.
Subsidy in % of the investment: 200
Invalid input! The subsidy must be an integer greater than or equal to 0 and less than or equal to 100.
Subsidy in % of the investment: 0
Direction of the photovoltaic system:
1: SOUTH
2: SOUTH-EAST
3: EAST
4: SOUTH-WEST
5: WEST
Please enter the direction: 4
Electricity rate in cents/kWh: 19
One module facing SOUTH-WEST.
Achievable total power: 0.38 kWp.
However, due to the suboptimal direction, only 0.36 kWp are achieved.
Investment of 259.99 leads to earnings of 61.26 each year.
After year 1: 198.73 still to compensate.
After year 2: 137.48 still to compensate.
After year 3: 76.22 still to compensate.
After year 4: 14.96 still to compensate.
PV system amortized within 5 years.

```

