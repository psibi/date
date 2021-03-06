# Time Zones

## What is a Time Zone

-   A Time Zone is a Geographic Region.
    -   Follows the same local clock.
    -   Abides by the same set of timekeeping rules.
    -   Usually determined by Law.
-   A Time Zone is NOT an offset.
    -   Offsets are only a part of a time zone.
    -   More than one offset might apply, at different parts of the
        year.
-   Defines the configuration of local clocks.
    -   Covers all time within the region.
-   Has a common or legal name. Eg: IST
-   Has a standard offset from UTC.
-   Includes Daylight Saving Time Rules.
    -   Transition Date patterns.
    -   Transition Times
    -   Transition Amount (1 hour etc)
-   Includes History of Changes (like git!)
    -   DST Rules
    -   Offsets
    -   Alignments: that occur by each time zone transitioning by a
        fractional amount to line up with UTC. (Alignments are offset
        changes but done with the intention of aligning with UTC)
-   Time Zones are set by Governments.
    -   Expect Suprises and Oddities.
    -   Changes Occur Often
-   Reason for Time Zone Changes
    -   Trade/Commerce
    -   Religious Observations

## Time Zone Fallacies

The below mentioned points are false. Reasoning is explained on why they
are false:

-   Time zone is a numeric offset from UTC.
    -   Many time zones share offsets.
    -   Even though some time zones may carry the same offset at some
        point, the way they use that offset is very different. So a time
        zone is much more than simply being a numeric offset from UTC.
-   Time zone names and abbreviations are unique.
    -   Counterexample: IST
        -   Israel Stanard Time - UTC+02:00
        -   India Standard Time - UTC+05:300
        -   Irish Standard Time - UTC+01:00
-   Local people know their time zone and how to abbreviate it.
    -   Counterexample: Hawaii
        -   According to Government: HAST - Hawaii Aleutian Stanard Time
        -   According to People: HST - Hawaiian Stanard Time
-   An entire state follows the same rules for daylight saving times
    -   Counterexample: Part of Arizona
-   Outside of USA, if I know what country a person is in, I can
    determine their time zone.
    -   Counterexample: Brazil
-   Time zones will never change, so I only have to think about them
    when I first build my application.
    -   Recommendation:
        -   Do not assume UTC offset of future calender dates.
        -   Keep your Time Zone Data updated.
        -   Use a Time Zone Database.
-   There can only be two daylight saving time transitions in any given
    year. Counterexample: Egypt

## The IANA Time Zone Database

-   IANA: Internet Assigned Numbers Authority
-   Known by sereral names
    -   IANA
    -   Olson
    -   TZDB
    -   TZ
    -   ZoneInfo
-   Identifier Format: Area/Location
    -   Examples:
        -   America/New<sub>York</sub>
        -   America/Indiana/Knox
-   Historical accurancy at least since 1970.
-   Data in this database doesn't come from IANA, but it's community
    maintained. It's frequently updated.

## Microsoft Time Zone Database

-   Built in to Windows operating system.
-   Maintained by Microsoft, not a stanard body or community.
-   Zones are sometimes poorly defined.
-   Very limited historical data.
-   Strange Zone Identifiers.
-   Recommendation: Avoid this and use IANA database

## The Unicode CLDR

-   Not a time zone database.
-   Source of data for localized translations.
    -   Time Zone Names
    -   Dates, Times, Numbers, Currency and much more.
-   Contains "MetaZones"
    -   Groups of Time Zones that can span countries.
-   Contains Translations of Windows Zones to IANA Zones.

## Rails Time Zones

-   Ruby on Rails has it's own time zones.
-   Uses the same IANA time zone database.
-   Limited subset of 146 "meaningful" zones.
    -   Poorly defined criteria

## POSIX Time Zones

-   POSIX = Portable Operating System Interface
-   You'll see POSIX time zones in C/C++ applications.
-   Examples:
    -   PST8PDT: In Pacific Stanard time the offset is 8 and when
        daylight saving time occurs, we will call it as Pacific Daylight
        time.
    -   EST5EDT4,M3.2.0/02:00,M11.1.0/02:00
-   Cryptic, Error Prone
-   Limited to 2 transitions per year
-   Contains only current rules
-   Recommendation: Do not use. Treat as deprecated.
-   GNU C library contains many time zone functions that will work with
    IANA database.
-   Other alternatives: ICU4C
-   Do not use Boost time zone APIs.
