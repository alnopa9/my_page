<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
    xmlns="http://purl.oclc.org/dsdl/schematron">
    
    <pattern id="orders">
        <rule context="year[@term='2018']">
            <assert test="months[1]/@class => distinct-values() eq 'october'"> october should be the 1st month in the list</assert>
            <assert test="months[2]/@class => distinct-values() eq 'november'"> november should be the 2nd month in the list</assert>
            <assert test="months[3]/@class => distinct-values() eq 'december'"> december should be the 3rd month in the list</assert>
        </rule>
        <rule context="year[@term='2019']">
            <assert test="months[1]/@class => distinct-values() eq 'january'"> january should be the 1st month in the list</assert>
            <assert test="months[2]/@class => distinct-values() eq 'february'"> february should be the 2nd month in the list</assert>
            <assert test="months[3]/@class => distinct-values() eq 'march'"> march should be the 3rd month in the list</assert>
            <assert test="months[4]/@class => distinct-values() eq 'april'"> april should be the 4th month in the list</assert>
        </rule>
        <rule context="season[@type='reg']">
            <assert test="year[1]/@term => distinct-values() eq '2018'"> 2018 should the first year to appear in each team's season</assert>
            <assert test="year[2]/@term => distinct-values() eq '2019'"> 2019 should the second year to appear in each team's season</assert>
        </rule>
    </pattern>
    
    <pattern id="organization">
        <rule context="organization">
            <assert test="organization/@team => distinct-values() eq outcome/lower-case(win|lose)">
                The organization element must match either the win or lose elements
            </assert>
        </rule>
    </pattern>

    <pattern id="daysOfMonth">
        <rule context="months/*">
            <assert test="game/number(@isoDate ! tokenize(., '-')[3]) lt following::game/number(@isoDate ! tokenize(., '-')[3])">
                The previous date should be less than the following date
            </assert>
        </rule>
    </pattern>
    
</sch:schema>