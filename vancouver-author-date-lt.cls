<?xml version="1.0" encoding="utf-8"?>
<style class="in-text" version="1.0" delimiter-precedes-et-al="never" delimiter-precedes-last="never" page-range-format="minimal" demote-non-dropping-particle="sort-only" default-locale="lt-LT" xmlns="http://purl.org/net/xbiblio/csl">
<!-- This style was edited with the Visual CSL Editor (http://editor.citationstyles.org/visualEditor/) -->
  <info>
    <title>Vancouver (author-date, Lithuanian)</title>
    <id>http://www.zotero.org/styles/vancouver-author-date-lt</id>
    <link href="http://www.zotero.org/styles/vancouver-author-date-lt" rel="self"/>
    <link href="http://www.zotero.org/styles/springer-vancouver-author-date" rel="template"/>
    <link href="http://www.zotero.org/styles/vancouver" rel="template"/>
    <link href="http://www.springer.com/cda/content/document/cda_downloaddocument/manuscript-guidelines-1.0.pdf" rel="documentation"/>
    <link href="http://www.springer.com/cda/content/document/cda_downloaddocument/Key_Style_Points_1.0.pdf" rel="documentation"/>
    <author>
      <name>Mindaugas Baranauskas</name>
      <email>embar@super.lt</email>
    </author>
    <category citation-format="author-date"/>
    <category field="generic-base"/>
    <summary>This style based on the NLM guidelines Citing Medicine is very similar to Vancouver and is used by a number of Springer publications.</summary>
    <updated>2014-05-03T13:23:30+00:00</updated>
    <rights license="http://creativecommons.org/licenses/by-sa/3.0/">This work is licensed under a Creative Commons Attribution-ShareAlike 3.0 License</rights>
  </info>
  <locale xml:lang="lt">
    <date form="text" delimiter=" ">
      <date-part name="year"/>
      <date-part name="month" form="long" prefix="m. " strip-periods="true"/>
      <date-part name="day" suffix=" d."/>
    </date>
    <terms>
      <term name="retrieved">adresas</term>
      <term name="from"/>
      <term name="cited">Žiūrėta:</term>
      <term name="et-al">ir kt.</term>
    </terms>
  </locale>
  <macro name="author-short-in-citation">
    <names variable="author">
      <name form="short" and="text" delimiter-precedes-et-al="never" delimiter-precedes-last="never"/>
      <substitute>
        <names variable="editor"/>
        <names variable="translator"/>
      </substitute>
    </names>
  </macro>
  <macro name="author-in-citation">
    <names variable="author">
      <name sort-separator=" " initialize-with="" name-as-sort-order="all" delimiter=", " delimiter-precedes-last="never"/>
      <substitute>
        <names variable="editor"/>
        <names variable="translator"/>
      </substitute>
    </names>
  </macro>
  <macro name="year-in-citation">
    <date variable="issued">
      <date-part name="year"/>
    </date>
  </macro>
  <macro name="issued-sort">
    <choose>
      <if type="article-journal bill book chapter graphic legal_case legislation motion_picture paper-conference report song" match="none">
        <date variable="issued">
          <date-part name="year"/>
          <date-part name="month"/>
          <date-part name="day"/>
        </date>
      </if>
      <else>
        <date variable="issued">
          <date-part name="year"/>
        </date>
      </else>
    </choose>
  </macro>
  <macro name="author">
    <names variable="author">
      <name delimiter-precedes-et-al="never" delimiter-precedes-last="never" initialize-with="" name-as-sort-order="all" sort-separator=" "/>
      <label form="long" prefix=", "/>
      <substitute>
        <names variable="editor"/>
      </substitute>
    </names>
  </macro>
  <macro name="editor">
    <group delimiter=": ">
      <choose>
        <if type="chapter paper-conference">
          <text term="in" text-case="capitalize-first"/>
        </if>
      </choose>
      <names variable="editor" suffix=".">
        <name sort-separator=" " initialize-with="" name-as-sort-order="all" delimiter=", " delimiter-precedes-last="never"/>
        <label form="long" prefix=", "/>
      </names>
    </group>
  </macro>
  <macro name="publisher">
    <group delimiter=": " suffix=";">
      <choose>
        <if type="thesis">
          <text variable="publisher-place" prefix="[" suffix="]"/>
        </if>
        <else>
          <text variable="publisher-place"/>
        </else>
      </choose>
      <text variable="publisher"/>
    </group>
  </macro>
  <macro name="access">
    <choose>
      <if variable="URL">
        <group delimiter=": ">
          <group delimiter=" ">
            <text term="retrieved" text-case="capitalize-first"/>
            <text term="from"/>
          </group>
          <text variable="URL"/>
        </group>
      </if>
    </choose>
  </macro>
  <macro name="accessed-date">
    <choose>
      <if variable="URL">
        <group prefix="[" suffix="] " delimiter=" ">
          <text term="cited"/>
          <date variable="accessed" form="text"/>
        </group>
      </if>
    </choose>
  </macro>
  <macro name="container-title">
    <choose>
      <if type="article-journal article-magazine chapter paper-conference article-newspaper" match="any">
        <group suffix="." delimiter=" ">
          <text variable="container-title" font-style="italic"/>
        </group>
        <text macro="edition" prefix=" "/>
      </if>
      <else-if type="bill legislation">
        <group delimiter=", ">
          <group delimiter=". ">
            <text variable="container-title" form="short"/>
            <group delimiter=" ">
              <text term="section" form="short" text-case="capitalize-first"/>
              <text variable="section"/>
            </group>
          </group>
          <text variable="number"/>
        </group>
      </else-if>
      <else>
        <text variable="container-title" suffix="." form="short"/>
      </else>
    </choose>
  </macro>
  <macro name="title">
    <text variable="title"/>
    <choose>
      <if type="article-journal article-magazine chapter paper-conference article-newspaper" match="none">
        <choose>
          <if variable="URL">
            <text term="internet" prefix=" [" suffix="]" text-case="capitalize-first"/>
          </if>
        </choose>
        <text macro="edition" prefix=". "/>
      </if>
    </choose>
    <choose>
      <if type="thesis">
        <text variable="genre" prefix=" [" suffix="]"/>
      </if>
    </choose>
  </macro>
  <macro name="edition">
    <choose>
      <if is-numeric="edition">
        <group delimiter=" ">
          <number variable="edition" form="ordinal"/>
          <text term="edition" form="short"/>
        </group>
      </if>
      <else>
        <text variable="edition" suffix="."/>
      </else>
    </choose>
  </macro>
  <macro name="date">
    <choose>
      <if type="article-journal article-magazine article-newspaper" match="any">
        <group suffix=";" delimiter=" ">
          <date variable="issued">
            <date-part name="year"/>
          </date>
        </group>
      </if>
      <else-if type="bill legislation">
        <group delimiter=", ">
          <date variable="issued" delimiter=" ">
            <date-part name="month" form="long" prefix="m. " strip-periods="true"/>
            <date-part name="day" suffix="d."/>
          </date>
          <date variable="issued">
            <date-part name="year"/>
          </date>
        </group>
      </else-if>
      <else-if type="report">
        <date variable="issued" delimiter=" ">
          <date-part name="year"/>
          <date-part name="month" form="short" prefix="m. " strip-periods="true"/>
        </date>
      </else-if>
      <else>
        <group suffix=".">
          <text macro="accessed-date" prefix=" "/>
          <date variable="issued">
            <date-part name="year"/>
          </date>
        </group>
      </else>
    </choose>
  </macro>
  <macro name="pages">
    <choose>
      <if type="article-journal article-magazine article-newspaper" match="any">
        <text variable="page" prefix=":"/>
      </if>
      <else>
        <group prefix=" " delimiter=" ">
          <label variable="page" form="short" plural="never"/>
          <text variable="page"/>
        </group>
      </else>
    </choose>
  </macro>
  <macro name="journal-location">
    <choose>
      <if type="article-journal article-magazine" match="any">
        <text variable="volume"/>
        <text variable="issue" prefix="(" suffix=")"/>
      </if>
    </choose>
  </macro>
  <macro name="report-details">
    <choose>
      <if type="report">
        <text variable="number" prefix="Report No.: "/>
      </if>
    </choose>
  </macro>
  <citation delimiter-precedes-et-al="never" delimiter-precedes-last="never" et-al-min="3" et-al-use-first="1" disambiguate-add-year-suffix="true">
    <sort>
      <key macro="author-in-citation"/>
      <key variable="issued" sort="descending"/>
    </sort>
    <layout prefix="(" suffix=")" delimiter="; ">
      <group delimiter=" ">
        <text macro="author-short-in-citation" suffix=","/>
        <text macro="year-in-citation"/>
      </group>
      <group delimiter=" ">
        <label variable="locator" prefix=", " form="short"/>
        <text variable="locator"/>
      </group>
    </layout>
  </citation>
  <bibliography delimiter-precedes-et-al="never" delimiter-precedes-last="never" et-al-min="7" et-al-use-first="6">
    <sort>
      <key macro="author-in-citation"/>
      <key macro="issued-sort" sort="ascending"/>
    </sort>
    <layout>
      <group delimiter=". " suffix=". ">
        <text macro="author"/>
        <text macro="title"/>
      </group>
      <group delimiter=" " suffix=". ">
        <text macro="editor"/>
        <text macro="container-title"/>
        <text macro="publisher"/>
        <group>
          <text macro="date"/>
          <text macro="journal-location"/>
          <text macro="pages"/>
        </group>
      </group>
      <text macro="report-details" suffix=". "/>
      <text macro="access"/>
    </layout>
  </bibliography>
</style>
