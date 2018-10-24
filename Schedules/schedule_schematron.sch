<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
    xmlns="http://purl.oclc.org/dsdl/schematron">
    <ns uri="http://www.argento_hockey.org/ns/1.0" prefix="schedule"/>
    
    <pattern id="orders">
        <rule context="months">
            <assert test="//year[@term='2018']//months[1][@class='october']"> october should be the 1st month in the list</assert>
            <assert test="//year[@term='2018']//months[2][@class='november']"> november should be the 2nd month in the list</assert>
            <assert test="//year[@term='2018']//months[3][@class='december']"> december should be the 3rd month in the list</assert>
            <assert test="//year[@term='2019']//months[1][@class='january']"> january should be the 1st month in the list</assert>
            <assert test="//year[@term='2019']//months[2][@class='february']"> february should be the 2nd month in the list</assert>
            <assert test="//year[@term='2019']//months[3][@class='march']"> march should be the 3rd month in the list</assert>
            <assert test="//year[@term='2019']//months[4][@class='april']"> april should be the 4th month in the list</assert>
        </rule>
        <rule context="years">
            <assert test="//year[1][@term='2018']"> year 2018 should come before 2019</assert>
            <report test="not(@term='2108')"> 2018 should be the only year to appear in the first position</report>
            <assert test="//year[2][@term='2019']"> year 2019 should come after 2018</assert>
        </rule>
    </pattern>
    <pattern id="daysOfMonth">
        <rule context="date">
            <assert test="number(date) le number('31')">The value of the date should not exceed 31</assert>
        </rule>
        <rule context="date">
            <assert test="number(//game/date) lt number(//following::game/date)">
                the following date should be greater than the previous one in the same month
            </assert>
        </rule>
    </pattern>
    
</sch:schema>