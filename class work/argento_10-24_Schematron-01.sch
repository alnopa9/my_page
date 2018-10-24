<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
    xmlns="http://purl.oclc.org/dsdl/schematron">
    <ns uri="http://www.tei-c.org/ns/1.0" prefix="tei"/>
    
    <pattern id="personElement">
        <rule context="tei:person">
            <assert test="contains(@xml:id,current()/descendant::tei:surname[1])" role="information">
                The xml:id attribute on person elements needs to start with the surname of the person.
            </assert>
        </rule>
    </pattern>
    <pattern id="capitalization">
        <rule context="tei:forename|tei:surname|tei:roleName|tei:placeName">
            <assert role="warn" test="matches(tei:forename|tei:surname|tei:roleName|tei:placeName,'^[A-Z]')">
                Check for capitalization errors: forename, surname, and placeName must begin with a capital letter
            </assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="@when">
            <assert  role="fatal" test="number(tei:person//tei:death[@when] ! tokenize(., '-')[1]) gt number(tei:person//tei:birth[@when] ! tokenize(., '-')[1])">
                The tei:death year value should be after the tei:birth value, making tei:death > tei:birth
            </assert>
            <report test="number(tei:birth[@when] ! tokenize(., '-')[1]) lt number(tei:death[@when] ! tokenize(., '-')[1])">
                ANother way of writing the previous rule, but with a report instead
            </report>
        </rule>
    </pattern>
</schema>