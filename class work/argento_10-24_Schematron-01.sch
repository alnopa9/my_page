<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
    xmlns="http://purl.oclc.org/dsdl/schematron">
    <ns uri="http://www.tei-c.org/ns/1.0" prefix="tei"/>
    
    <pattern id="personElement">
        <rule context="tei:person//tei:surname">
            <assert role="information" test="starts-with(@xml:id, tei:surname)">
                The xml:id attribute on person elements needs to start with the surname of the person
            </assert>
        </rule>
    </pattern>
    <pattern id="capitalization">
        <rule context="tei:person//descendant::*">
            <assert test="starts-with(tei:person//descendant::*, [A-Z])">
                Check for capitalization errors:\n forename, surname, and placeName must begin with a capital letter
            </assert>
        </rule>
    </pattern>
    <patern>
        <rule context="@when">
            <assert test="//(birth|death)//@when ! tokenize(., '-')[1]"> </assert>
        </rule>
    </patern>
</schema>