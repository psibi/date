# Context Matter

-   In software, make sure to preserve context using better types.
-   Some context for date and time:
    -   UTC for DateTime
    -   DateTimeOffset instead of storing local time.

# Formatting

-   Use 4 digit year in formatting to avoid confusion.
-   ISO-8601 standard provides format for unambiguos interpretation.
    (MM/DD/YY vs DD/MM/YY)
-   ISO-8601 recommendation
    -   Simple Format (YYYY-MM-DD)

# Scope

-   Date and Time
    -   Example: `2013-12-31 22:00:00`
    -   Suitable for event time. Eg: Application log, Date of comment
-   Date
    -   Example: `2013-12-31`
    -   Suitable for just dates. Eg: Birthdate
-   Time Of Day
    -   Example: `10:00:00 PM`
    -   AM/PM is called meridiem. It's a latin word meaning midday.
    -   AM stands for ante meridiem or before midday.
    -   PM stands for post meridiem or after midday.
    -   Use cases: Businss hours
-   Elapsed Time
    -   Example: 33 hours, 15 minutes etc.
    -   Use case: Duration of Activity.
-   Imperfect Time Period
    -   Example: 1 year, 3 months, 10 days etc.
    -   Use case: Estimate, Scheduling

# Perspective

-   Unspecified Perspective
    -   Example `2013-12-31 10:00:00`
    -   Could be local time, but we should avoid making such
        assumptions.
    -   It could be useful for "floating times". Could refer to 10'o
        clock local time for anytime zone. (Useful for television show
        broadcast). It's time value doesn't change when you use it in
        other time zone.
-   Universal Perspective
    -   Example `2013-12-31 16:00:00 UTC`
    -   Instead of `UTC` above, it's also specified as `GMT` or marked
        by a letter `Z` which stands for Zulu time. Zulu time is just a
        military way of specifying GMT.
    -   It's completely unambiguos. Represents a fixed moment of time
        regardless of any time zones.
-   Local Perspective (Sibi: Todo - Go through the video again)
    -   By Offset (`2013-12-31 22:00:00 -06:00`)
        -   Offset to UTC is mentioned
    -   By Time Zone (`2013-12-31 22:00:00 Central`)
        -   Good to know background information about [Central
            Time](https://www.timeanddate.com/time/zones/ct).
    -   By Time Zone Segment (`2013-12-31 22:00:00 CST`)
        -   CST: Central Standard time
        -   Recommendation: Avoid time zone abbreviations when storing
            inside computer. (Fine to show it in UI, but not recommended
            otherwise)
    -   By Time Zone & Offset
        -   Example `2013-12-31 22:00:00 -06:00 Central`

# Calender Time

-   It's a position on a calender or a clock.
-   Use cases:
    -   Future scheduled events. It's best to use this instead of UTC
        timestamp because your events might run at wrong time after a
        Daylight saving transition.

# Instantaneous Time

-   Can use date and time in UTC to refer to a particular instant.
-   Use cases:
    -   Recording past events
    -   Future Absolute Events
    -   Calculations
        -   Adding or subtracing time
        -   Determining duration between them
        -   Recommendation: If you are planning to perform computation
            in date time, best to convert to UTC before performing them.
