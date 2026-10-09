# Högskolan i Borås – Harvard (svenska)

*Svensk dokumentation (for English, please scroll down)*

## Inledning

Det här dokumentet beskriver Zotero-stilmallen **Högskolan i Borås – Harvard (svenska)**.

Stilmallen är en svensk författare–år-stil som följer [Högskolan i Borås Harvardguide](https://www.hb.se/biblioteket/skriva-och-referera/harvard/). Den har utvecklats med [University of Gothenburg – APA (Swedish legislations)](http://www.zotero.org/styles/university-of-gothenburg-apa-swedish-legislations) som utgångspunkt, men har anpassats till Högskolan i Borås anvisningar för Harvardreferenser.

Stilen använder svenska termer och förkortningar, till exempel **och**, **red.**, **uppl.**, **s.** och **u.å.** Den innehåller även särskild formatering för bland annat böcker, bokkapitel, tidskriftsartiklar, rapporter, webbsidor, uppsatser, konferensbidrag, standarder, patent, lagstiftning, sociala medier och audiovisuellt material.

## Installation

Stilmallen är i formatet `.csl` (Citation Style Language).

### Installera från en nedladdad fil

1. Ladda ner filen `hb-harvard.csl`.
2. Öppna Zotero.
3. Gå till **Redigera > Inställningar** i Windows eller **Zotero > Inställningar** i macOS.
4. Välj **Källhänvisa** och därefter **Stilar**.
5. Klicka på **+**.
6. Välj filen `hb-harvard.csl` och installera den.

Du kan också dubbelklicka på `.csl`-filen för att installera den i Zotero.

## Användning

När stilen är installerad väljer du **Högskolan i Borås – Harvard (svenska)** som referensstil i Zotero eller i Zotero-tillägget för ditt ordbehandlingsprogram.

Stilen skapar källhänvisningar i text enligt författare–år-systemet, till exempel:

> (Andersson 2024)

Med en sidangivelse:

> (Andersson 2024, s. 15)

Referenslistan sorteras alfabetiskt efter upphovsperson och därefter efter år och titel. Om årtal saknas används **u.å.** DOI visas i första hand. Om DOI saknas används URL och, när uppgiften finns i Zotero, åtkomstdatum i formatet `ÅÅÅÅ-MM-DD`.

## Registrering av uppgifter i Zotero

Resultatet styrs av vilken källtyp du väljer och vilka fält du fyller i. Kontrollera därför alltid den färdiga hänvisningen och referenslistan mot Högskolan i Borås Harvardguide.

### Tidskriftsartiklar med artikelnummer

Vissa vetenskapliga tidskriftsartiklar saknar sidintervall och identifieras i stället med ett artikelnummer. Detta gäller artiklar som inte har sidnummer och som inte ska märkas med **[Förhandspublicerad online]**.

Mata in följande:

* **Sidor:** lämnas tomt.
* **Extra:** ange artikelnumret.

Exempel:

```text
Extra: e104892
```

Artikelnumret skrivs då ut i referensen i stället för sidnummer.

### Förhandspublicerade artiklar

Om en artikel har publicerats online men ännu inte har tilldelats volym, nummer eller sidintervall anges detta i fältet **Extra**.

Mata in följande:

```text
Extra: Förhandspublicerad online
```

Texten skrivs då ut som **[Förhandspublicerad online]** i referensen.

### Lagstiftning

Använd källtypen **Författning**.

Fyll i följande fält:

* **Författningens namn:** författningens titel.
* **Författningssamling:** exempelvis `SFS`.
* **Författningsnummer:** exempelvis `2010:800`.

#### Exempel på källhänvisning och referens

> (SFS 2010:800)

> SFS 2010:800. *Skollag*.

Vid hänvisning till en särskild del kan du lägga till en lokalisator, exempelvis sida, kapitel eller paragraf, i Zoteros dialogruta för källhänvisningen.

### Sociala medier

För sociala medier används normalt källtypen **Blogginlägg** eller **Forum-/sociala medier-inlägg**.

Mata in följande i en ny Zotero-post:

* **Författare:** person, organisation eller kontonamn.
* **Kort titel:** användarnamn, exempelvis `@hogskolaniboras`.
* **Titel:** inläggets titel eller text.
* **Publikation:** plattformens namn, exempelvis Instagram, Facebook, LinkedIn eller X.
* **Typ (Genre):** typ av inlägg, exempelvis *Instagraminlägg*, *Facebookinlägg* eller *LinkedIn-inlägg*.
* **Datum:** publiceringsdatum.
* **URL:** direktlänk till inlägget.

### Broschyrer

För broschyrer används normalt källtypen **Rapport**.

Mata in följande:

* **Typ (Genre):** `broschyr`.

Materialtypen skrivs då ut som **[broschyr]** i referensen.

### Pressmeddelanden

För pressmeddelanden används normalt källtypen **Rapport** eller **Webbsida**.

Mata in följande:

* **Typ (Genre):** `pressmeddelande`.

Materialtypen skrivs då ut som **[pressmeddelande]** i referensen.

### Standarder

Använd källtypen **Standard**. Standardens nummer används som identifikation i källhänvisningen när fältet är ifyllt. I referenslistan visas standardnummer, titel och upphovsperson utifrån de uppgifter som har registrerats i Zotero.

### Rapporter och webbsidor med förkortning

För rapporter och webbsidor kan fältet **Kort titel** användas som en förkortning. Vid den första källhänvisningen kan både upphovsperson och förkortning visas. I följande hänvisningar används förkortningen.

### Materialtyp

För vissa källtyper kan fältet **Format** eller motsvarande uppgift användas för att ange materialtyp, exempelvis `[video]`. Om inget format anges används fasta benämningar för vissa typer, exempelvis `[fotografi]` för fotografier och `[inspelad föreläsning]` för inspelade föreläsningar.

### Fältet Extra

Fältet **Extra** används i vissa fall för uppgifter som saknar egna Zotero-fält.

I denna stil används fältet för:

* artikelnummer för tidskriftsartiklar som saknar sidintervall
* texten `Förhandspublicerad online` för artiklar som ännu saknar fullständig publiceringsinformation

Använd endast fältet **Extra** när motsvarande information saknar ett särskilt Zotero-fält.

## Viktigt att kontrollera

* Kontrollera att rätt källtyp är vald.
* Kontrollera namn, årtal, titel, upplaga, sidnummer, DOI och URL.
* Lägg till åtkomstdatum när Harvardguiden kräver det.
* Kontrollera poster som importerats automatiskt. Metadata kan vara ofullständig eller hamna i fel fält.
* Jämför alltid den färdiga referensen med exemplen i Harvardguiden.

## Begränsningar

CSL-stilar bygger på Zoteros tillgängliga källtyper och fält. Alla källor kan därför inte registreras exakt på samma sätt som de presenteras i en referensguide. Vissa uppgifter kan behöva läggas in manuellt eller i ett närliggande Zotero-fält för att referensen ska återges korrekt.

Stilen är anpassad för svenska Harvardreferenser enligt Högskolan i Borås guide. Referenser till andra rättssystem eller andra lokala variationer av Harvard kan behöva justeras manuellt.

## Licens och upphov

Stilmallen är skapad av **Amanda Pettersson** och licensieras under [Creative Commons Attribution-ShareAlike 3.0](https://creativecommons.org/licenses/by-sa/3.0/).

---

# University of Borås – Harvard (Swedish)

*English documentation*

## Introduction

This document describes the Zotero style **University of Borås – Harvard (Swedish)**.

The style is a Swedish author–date style based on the [University of Borås Harvard guide](https://www.hb.se/biblioteket/skriva-och-referera/harvard/). It was developed using [University of Gothenburg – APA (Swedish legislations)](http://www.zotero.org/styles/university-of-gothenburg-apa-swedish-legislations) as a starting point and has been adapted to the University of Borås guidelines for Harvard referencing.

The style uses Swedish terms and abbreviations, including **och**, **red.**, **uppl.**, **s.** and **u.å.** It also contains specific formatting for books, book chapters, journal articles, reports, webpages, theses, conference papers, standards, patents, legislation, social media and audiovisual material.

## Installation

The style is provided as a `.csl` (Citation Style Language) file.

### Installing a downloaded file

1. Download `hb-harvard.csl`.
2. Open Zotero.
3. Go to **Edit > Settings** in Windows or **Zotero > Settings** in macOS.
4. Select **Cite**, followed by **Styles**.
5. Click the **+** button.
6. Select `hb-harvard.csl` and install it.

You can also install the style by double-clicking the `.csl` file.

## Usage

After installation, select **University of Borås – Harvard (Swedish)** as the citation style in Zotero or in the Zotero plugin for your word processor.

The style creates author–date citations, for example:

> (Andersson 2024)

With a page reference:

> (Andersson 2024, s. 15)

The bibliography is sorted alphabetically by creator, followed by year and title. If no date is available, the style uses the Swedish abbreviation **u.å.** A DOI is displayed when available. If there is no DOI, the URL is used together with an access date in `YYYY-MM-DD` format when that information is available in Zotero.

## Entering information in Zotero

The output depends on the selected item type and the fields completed in Zotero. Always check the final citation and bibliography against the University of Borås Harvard guide.

### Journal articles with article numbers

Some journal articles do not have a page range and are instead identified by an article number. This applies to articles without page numbers that should not be labelled **[Förhandspublicerad online]**.

Enter the following:

* **Pages:** leave this field empty.
* **Extra:** enter the article number.

Example:

```text
Extra: e104892
```

The article number is then displayed in place of page numbers.

### Advance online publications

If an article has been published online but has not yet been assigned a volume, issue or page range, enter the following in the **Extra** field:

```text
Extra: Förhandspublicerad online
```

The Swedish description **[Förhandspublicerad online]** is then displayed in the reference.

### Legislation

Use the item type **Statute**.

Complete the following fields:

* **Name of Act:** title of the legislation.
* **Code:** for example `SFS`.
* **Code Number:** for example `2010:800`.

#### Example citation and reference

> (SFS 2010:800)

> SFS 2010:800. *Skollag*.

To cite a specific section, add a locator, such as a page, chapter or section, in Zotero’s citation dialog.

### Social media

For social media, use the item type **Blog Post** or **Forum Post**.

Enter the following:

* **Author:** person, organisation or account name.
* **Short Title:** username, for example `@hogskolaniboras`.
* **Title:** title or text of the post.
* **Publication:** name of the platform, such as Instagram, Facebook, LinkedIn or X.
* **Type (Genre):** type of post, such as *Instagram post*, *Facebook post* or *LinkedIn post*.
* **Date:** publication date.
* **URL:** direct link to the post.

### Brochures

For brochures, normally use the item type **Report**.

Enter the following:

* **Type (Genre):** `broschyr`.

The material type is then displayed as **[broschyr]** in the reference.

### Press releases

For press releases, normally use the item type **Report** or **Web Page**.

Enter the following:

* **Type (Genre):** `pressmeddelande`.

The material type is then displayed as **[pressmeddelande]** in the reference.

### Standards

Use the item type **Standard**. When supplied, the standard number is used as the identifier in the in-text citation. The bibliography displays the standard number, title and creator based on the information entered in Zotero.

### Reports and webpages with abbreviations

For reports and webpages, the **Short Title** field can be used for an abbreviation. The first citation may display both the creator and the abbreviation. Subsequent citations use the abbreviation.

### Medium

For some item types, the **Format** field or corresponding metadata can be used to identify the type of material, for example `[video]`. If no format is entered, the style supplies fixed Swedish descriptions for certain item types, such as `[fotografi]` for photographs and `[inspelad föreläsning]` for recorded lectures.

### The Extra field

The **Extra** field is used for information that does not have a dedicated Zotero field.

In this style, it is used for:

* article numbers for journal articles without page ranges
* the text `Förhandspublicerad online` for articles that do not yet have complete publication details

Only use the **Extra** field when the information does not have a dedicated Zotero field.

## Important checks

* Make sure that the correct item type is selected.
* Check names, dates, titles, editions, page numbers, DOIs and URLs.
* Add an access date when required by the Harvard guide.
* Check automatically imported records, as metadata may be incomplete or placed in the wrong field.
* Always compare the final reference with the examples in the Harvard guide.

## Limitations

CSL styles depend on the item types and fields available in Zotero. Not every source can therefore be entered exactly as it appears in a referencing guide. Some details may need to be entered manually or placed in the closest corresponding Zotero field to produce the intended reference.

The style is designed for Swedish Harvard references according to the University of Borås guide. References to other legal systems or other local Harvard variants may require manual adjustment.

## Licence and credits

The style was created by **Amanda Pettersson** and is licensed under [Creative Commons Attribution-ShareAlike 3.0](https://creativecommons.org/licenses/by-sa/3.0/).
