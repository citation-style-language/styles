<?xml version="1.0" encoding="utf-8"?>
<style xmlns="http://purl.org/net/xbiblio/csl" class="in-text" version="1.0" demote-non-dropping-particle="sort-only" default-locale="en-US">
  <info>
    <title>Ethnobiology and Conservation 2th Edition</title>
    <title-short>Ethnobiol Conserv</title-short>
    <id>http://www.zotero.org/styles/ethnobiology-and-conservation</id>
    <link href="http://www.zotero.org/styles/ethnobiology-and-conservation" rel="self"/>
    <link href="http://www.ethnobioconservation.com/index.php/ebc/pages/view/guidelines" rel="documentation"/>
    <author>
      <name>Wedson Medeiros</name>
      <uri>http://www.mendeley.com/profiles/wedson-medeiros/</uri>
    </author>
    <contributor>
      <name>Itamar Barbosa de Lima</name>
      <email>iblima@gmail.com</email>
	    <url>https://github.com/iblima/</url>
	    <uri>https://www.zotero.org/iblima/</uri>
    </contributor>
    <category citation-format="author-date"/>
    <category field="botany"/>
    <category field="zoology"/>
    <category field="biology"/>
    <eissn>2238-4782</eissn>
    <updated>2023-10-15T04:18:55+00:00</updated>
    <summary>The Ethnobiology and Conservation. Version 2 as per October-2023</summary>
    <rights license="http://creativecommons.org/licenses/by-sa/3.0/">This work is licensed under a Creative Commons Attribution-ShareAlike 3.0 License</rights>
  </info>
  <locale> xml: lang="en" </locale>
  <macro name="author">
    <names variable="author" suffix=" ">
      <name delimiter=", " name-as-sort-order="all" sort-separator=" " form="long" initialize-with=""/>
    </names>
  </macro>
  <macro name="editor">
    <names variable="editor" prefix="In: ">
      <name initialize-with="" name-as-sort-order="all" sort-separator=" "/>
      <label form="short" strip-periods="true" prefix=" (" suffix=")"/>
    </names>
  </macro>
  <macro name="year">
    <date variable="issued" prefix="(" suffix=") ">
      <date-part name="year"/>
    </date>
  </macro>
  <macro name="title">
    <text variable="title" suffix=". "/>
  </macro>
  <citation disambiguate-add-year-suffix="true" collapse="year" et-al-min="3" et-al-use-first="1">
    <sort>
      <key variable="author"/>
      <key macro="year"/>
    </sort>
    <layout delimiter="; " prefix="(" suffix=")">
      <group delimiter=" ">
        <names variable="author">
          <name and="text" delimiter=" " name-as-sort-order="all" sort-separator=", " form="short"/>
        </names>
        <date variable="issued">
          <date-part name="year" form="long"/>
        </date>
      </group>
    </layout>
  </citation>
  <macro name="access">
    <choose>
      <if type="article-newspaper" match="none">
        <choose>
          <if variable="DOI">
            <text value="doi: "/>
            <text variable="DOI"/>
          </if>
          <else-if variable="URL">
            <group delimiter=". ">
              <choose>
                <if type="webpage post post-weblog" match="any">
                  <date variable="issued" prefix="Published " form="text"/>
                </if>
              </choose>
              <group>
                <text term="accessed" text-case="capitalize-first" suffix=" "/>
                <date variable="accessed">
                  <date-part name="month" suffix=" "/>
                  <date-part name="day" suffix=", "/>
                  <date-part name="year"/>
                </date>
              </group>
              <text variable="URL"/>
            </group>
          </else-if>
        </choose>
      </if>
    </choose>
  </macro>
  <bibliography hanging-indent="true">
    <sort>
      <key macro="author"/>
      <key macro="year" sort="ascending"/>
      <key variable="volume"/>
    </sort>
    <layout>
      <text macro="author"/>
      <text macro="year"/>
      <text macro="title" font-weight="bold"/>
      <choose>
        <if type="thesis">
          <text variable="genre" suffix=", "/>
          <text variable="publisher" suffix=", "/>
          <text variable="publisher-place"/>
        </if>
        <else-if type="book">
          <text variable="edition" suffix=" ed. "/>
          <text variable="publisher" suffix=", "/>
          <text variable="publisher-place" suffix=" "/>
        </else-if>
        <else-if type="paper-conference">
          <text variable="event" prefix=" " suffix=" "/>
          <text variable="volume" suffix=":"/>
          <text variable="page"/>
        </else-if>
        <else-if type="chapter">
          <text macro="editor"/>
          <text variable="container-title" prefix=" " suffix=". "/>
          <text variable="edition" suffix=" ed. "/>
          <text variable="publisher" suffix=", "/>
          <text variable="publisher-place" suffix=", "/>
          <label strip-periods="false" suffix=" " variable="page" form="symbol"/>
          <text variable="page" suffix=" "/>
        </else-if>
        <else-if type="webpage">
          <text variable="URL" prefix="[" suffix="] "/>
          <date form="text" variable="accessed" prefix="Accessed "/>
        </else-if>
        <else-if type="article article-journal article-magazine article-newspaper" match="any">
          <text variable="container-title" font-style="italic" suffix=" "/>
          <text variable="volume" suffix=":"/>
          <text variable="page"/>
        </else-if>
        <else-if type="report" match="any">
          <text variable="publisher" suffix=", "/>
          <text variable="publisher-place" suffix=". "/>
          <text variable="URL" prefix="[" suffix="]. "/>
          <text variable="DOI" prefix="doi: "/>
        </else-if>
        <else>
          <group suffix=" ">
            <text variable="container-title" suffix=" " form="short"/>
            <text variable="volume" suffix=":"/>
            <text variable="page"/>
          </group>
        </else>
      </choose>
      <text prefix=" " macro="access"/>
    </layout>
  </bibliography>
</style>
