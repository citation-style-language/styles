<?xml version="1.0" encoding="utf-8"?>
<style class="in-text" version="1.0" delimiter-precedes-et-al="never" delimiter-precedes-last="never" page-range-format="minimal" demote-non-dropping-particle="sort-only" default-locale="lt-LT" xmlns="http://purl.org/net/xbiblio/csl">
<!-- This style was edited with the Visual CSL Editor (http://editor.citationstyles.org/visualEditor/) -->
  <info>
    <title>LSMU Vancouver</title>
    <id>http://www.zotero.org/styles/lsmu-vancouver</id>
    <link href="http://www.zotero.org/styles/lsmu-vancouver" rel="self"/>
    <link href="http://www.zotero.org/styles/elsevier-vancouver" rel="template"/>
    <link href="http://www.zotero.org/styles/acta-materialia" rel="template"/>
    <link href="http://www.elsevier.com/journals/progress-in-materials-science/0079-6425/guide-for-authors#Refs" rel="documentation"/>
    <author>
      <name>Mindaugas Baranauskas</name>
      <email>embar@super.lt</email>
    </author>
    <category citation-format="numeric"/>
    <category field="generic-base"/>
    <summary>A style for some Elsevier journals, resembles Vancouver style</summary>
    <updated>2014-05-03T13:43:35+00:00</updated>
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
  <macro name="author">
    <names variable="author">
      <name initialize-with="" delimiter=", " name-as-sort-order="all" sort-separator=" "/>
      <label form="long" prefix=", "/>
      <substitute>
        <names variable="editor"/>
        <names variable="translator"/>
      </substitute>
    </names>
  </macro>
  <macro name="editor">
    <names variable="editor">
      <name initialize-with="" delimiter=", " name-as-sort-order="all" sort-separator=" "/>
      <label form="long" prefix=", " suffix="."/>
    </names>
  </macro>
  <macro name="year-date">
    <choose>
      <if variable="issued">
        <date variable="issued">
          <date-part name="year"/>
        </date>
      </if>
      <else>
        <text term="no date" form="short"/>
      </else>
    </choose>
  </macro>
  <macro name="publisher">
    <text variable="publisher-place" suffix=": " text-case="title"/>
    <text variable="publisher" suffix="; "/>
    <text macro="year-date"/>
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
        <text variable="edition"/>
      </else>
    </choose>
  </macro>
  <citation collapse="citation-number">
    <sort>
      <key variable="citation-number"/>
    </sort>
    <layout prefix="[" suffix="]" delimiter=",">
      <text variable="citation-number"/>
    </layout>
  </citation>
  <bibliography entry-spacing="0" second-field-align="flush" et-al-min="7" et-al-use-first="6">
    <sort>
      <key macro="author"/>
      <key macro="issued-sort" sort="ascending"/>
    </sort>
    <layout suffix=".">
      <text variable="citation-number" suffix="."/>
      <text macro="author" prefix=" " suffix=". "/>
      <choose>
        <if type="bill book graphic legal_case legislation motion_picture report song" match="any">
          <group delimiter=". ">
            <text variable="title"/>
            <text variable="volume" prefix="vol. "/>
            <text macro="edition"/>
            <text macro="publisher"/>
          </group>
        </if>
        <else-if type="chapter paper-conference" match="any">
          <group delimiter=", ">
            <group delimiter=". ">
              <text variable="title"/>
              <group>
                <text term="in" text-case="sentence" suffix=": "/>
                <text macro="editor"/>
              </group>
              <group delimiter=", ">
                <text variable="container-title" form="short"/>
                <text variable="volume" prefix="vol. "/>
              </group>
              <text macro="edition"/>
            </group>
            <text macro="publisher"/>
            <group delimiter=" ">
              <label variable="page" form="short" plural="never"/>
              <text variable="page"/>
            </group>
          </group>
        </else-if>
        <else-if type="patent">
          <group delimiter=", ">
            <group delimiter=". ">
              <text variable="title"/>
              <text variable="number"/>
            </group>
            <text macro="year-date"/>
          </group>
        </else-if>
        <else-if type="thesis">
          <group delimiter=". ">
            <text variable="title"/>
            <text variable="genre"/>
            <group delimiter=", ">
              <text variable="publisher"/>
              <text macro="year-date"/>
            </group>
          </group>
        </else-if>
        <else>
          <group delimiter=":">
            <group delimiter=" ">
              <group delimiter=". ">
                <text variable="title"/>
                <text variable="container-title" form="short" text-case="title" strip-periods="true" suffix="."/>
              </group>
              <group delimiter=";">
                <text macro="year-date"/>
                <text variable="volume"/>
              </group>
            </group>
            <text variable="page" form="short"/>
          </group>
        </else>
      </choose>
    </layout>
  </bibliography>
</style>
