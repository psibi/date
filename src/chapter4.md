# Date and Time Formats

## ISO 8601 "Extended" Format

-   YYYY-MM-DD
    -   Single digit number aren't allowed. So a number start with zero
        if it's a single digit number.
-   HH:MM:SS
    -   SS is optional.
    -   24 hour clock.
-   HH:MM:SS.ffffff
    -   Stanards doen't represent the number of decimal places.
    -   Can use comma instead of dot in decimal space.
-   HH:MM:SS.ffffffZ
    -   UTC
-   HH:MM:SS.ffffffZ\[+/-\]HH
-   HH:MM:SS.ffffffZ\[+/-\]HH:MM
-   YYYY-MM-DDTHH:MM:SS
    -   Use "T" to combine date and time.
-   YYYY-MM-DDTHH:MM:SS.ffffff
-   YYYY-MM-DDTHH:MM:SS.ffffffZ
-   YYYY-MM-DDTHH:MM:SS.ffffffZ\[+/-\]HH
-   YYYY-MM-DDTHH:MM:SS.ffffffZ\[+/-\]HH:MM

## ISO 8601 "Basic" Format

-   Same as extended format but with most of the separation characters
    removed.
-   YYYYMMDD
-   HHMMSS
-   HHMMSS.ffffff
-   HHMMSS.ffffffZ
-   HHMMSS.ffffffZ\[+/-\]HH
-   HHMMSS.ffffffZ\[+/-\]HHMM
-   YYYYMMDDTHHMMSS
-   YYYYMMDDTHHMMSSffffff
-   YYYYMMDDTHHMMSSffffffZ
-   YYYYMMDDTHHMMSSffffffZ\[+/-\]HH
-   YYYYMMDDTHHMMSSffffffZ\[+/-\]HHMM
-   Treat them as strings instead of integers.

## RFC 3339

-   Examples:
    -   2013-12-31T01:23:45.123Z (date and time at UTC)
    -   2013-12-31T01:23:45.123+05:30 (date and time with an offset)
-   Good way to think that RFC 3339 is a subset of ISO-8601 extended
    format.
-   This RFC is specifically for timestamps.
    -   Date and time are both required.
    -   Seconds are required, decimals are optional.
    -   UTC ("Z") or Offsets is required.
    -   All punctuation is required (`T`, `:`)
    -   Midnight is always `00:00:00~`
-   Allows for negative zero offset (-00:00)
    -   UTC is known, but implies an `Unknown Local Offset`

## RFC 822/1123

-   Originated in RFC 822 and modified in RFC 1123.
-   Examples:
    -   Tue, 31 Dec 2013 01:23:45 GMT
    -   Tue 31 Dec 2013 01:23:45 GMT+0530
    -   Tue 31 Dec 2013 01:23:45 EST (Not a good idea)
-   Used in HTTP headers.
-   Used by JavaScript, but being phased out.
-   Limitations:
    -   No fractional seconds.
    -   English Abbreviations only.
    -   Poor use of Time Zone Abbreviations.
    -   Extraneous Day of Week

## Unix Time

-   Integer Timestamp.
-   Seconds since Janaury 1st 1970 UTC
    -   Or in milliseconds.
-   Also known (erroneously) as Epoch time.
    -   The world Epoch just means the date that you are basing
        something on which in this case is Janaury 1st 1970 UTC.
-   Advantages: Simple numerical storage, Easy for mathematics.
-   Disadvantages: Not human readable, Does not account for time zones
    or leap seconds.
-   Recommendation: Good internal format, but don't expose externally.
-   For Rest services, use ISO 8601 Format.

## OLE Automation Dates

-   Object linking and Embedding.
-   Early stanard from Microsoft.
-   Used in Microsoft Office and COM.
-   Floating Point Number.
-   Whole and fractional standard days.
-   Ambiguous Epoch.
    -   Usually Dec 30th, 1899
    -   Sometimes Dec 31st, 1899
-   Unspecified reference (not necessarily UTC or local time). Left to
    the application.
-   Recommendations
    -   Limit usage to COM interop scenarios.

## Time Span Format

-   No standard
-   Similar to Time of Day, but for Elapsed time
-   HH:MM:SS.fffffff

## ISO 8601 Duration Formats

-   Uses
    -   Calender based periods
    -   Elapsed duration of time
    -   Computed Values
-   Examples:
    -   P3Y: Period of 3 years.
    -   P5M: 5 months
    -   P8W: 8 weeks
    -   P15D: 15 calender days
-   Elapsed time periods
    -   PT36H: 36 hours
        -   Extra capital T
    -   PT90M: 90 minutes
    -   PT2S: 2 seconds
-   Compound Value examples
    -   P3Y5M8W15DT36H90M2.576S
        -   T in middle, separates date and minutes.

## JSON Date Formats

-   JSON = JavaScript Object Notation
-   Does not define a date format.
-   Options:
    -   ISO 8601 Extended Format
    -   Unix time
    -   ASP.NET Format
        -   Example: `/Date(1388453025123)/`
        -   The number is Unix time in milliseconds.
        -   Created by Microsoft.
-   Recommendation: Use ISO 8601 Format

## XML Date formats

-   XML does not define a date format.
-   XSD uses the ISO 8601 Extended format.
-   Types:
    -   xsd:date
    -   xsd:time
    -   xsd:dateTime
    -   xsd:duration
