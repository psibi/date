# Common Mistakes and Best Practices

## Understand the Context

-   Date + Time vs Date Only
-   Time of Day vs Elasped Time
-   Elapsed Duration vs Calenderic Period

## Understanding Time Zone

-   Time Zone != Offset
-   Without referencing a point in time, you cannot know offset is in
    effect in a given time zone.
-   Time zone abbreviations are often ambiguous.
-   Time Zones change.

## Calculating Durations

-   10 AM - 1 AM = 9 hours ? Right
    -   Not always! Could be 8 hours or 10 hours.
-   Avoid calculating in local time.
-   Use UTC for calculations.
    -   12:00Z - 03:00Z = 9 hours
-   Alternatively, include an offset.
    -   10:00-02-01:00-02 = 9 hours
    -   10:00-01-01:00-02 = 8 hours
    -   10:00-02-01:00-01 = 10 hours

## Logging

-   If you're logging in local time, then it can be lead to problem.
    -   Local time values are not unique.
    -   Consequence:
        -   Spikes and dips in statistics/aggregations.
        -   Error coordinating activities from different time zones.
-   Instead:
    -   Log timestamps in UTC.
    -   Alternatively, log in local time and include an offset.

## Server's Time Zone

-   Don't Use the Server's Time Zone
-   Server side code should not depend on the server's time zone.
    -   Users can be in different time zones.
    -   An administrator might change the server's time zone.
-   Recommendation: Store data in UTC, or as DateTimeOffset.

## Database Data Types

-   Date and Time values should never be stored as strings (Eg: CHAR,
    VARCHAR etc) in a database.
-   SQL Server
    -   DATETIME2, DATETIME, SMALLDATETIME
    -   DATETIMEOFFSET
    -   DATE
    -   TIME (time-of-day)
    -   Caution: TIMESTAMP is not a date/time type
-   MySQL
    -   TIMESTAMP (Best to avoid)
    -   DATETIME
    -   TIME (elapsed time)
    -   YEAR (Recommendation: Use integer field instead)
    -   Recommendation: To store UTC values, just store them in DATETIME
        field.
-   PostgreSQL
    -   TIMESTAMP: Stores date and time without any time zone
        information at all.
    -   TIMESTAMP WITH TIME ZONE: Normalizes the value to UTC and
        converts back to session's time zone on retrieval. Best to avoid
        this.
    -   DATE: Date only values.
    -   TIME (time-of-day)
    -   TIME WITH TIME ZONE: Stores time of day with offset.
    -   INTERVAL: Can use to store elapsed times or calendrical periods.
    -   Recommendation: To store UTC values, use TIMESTAMP type.

## Working with Ranges

-   Date + Time Ranges should be treated as half open intervals
    -   \[Start, end)
    -   Duration calculation: end - start
    -   Value Comparison: (start \<= value AND end > value)
-   Date ranges should be treated as fully closed intervals.
    -   \[start, end\]
    -   Duration calculation: end - start + 1
    -   Value comparison: (start \<= value AND end >= value)
-   Time ranges should be treated as half open intervals
    -   \[start, end)
    -   Duration calculation:
        -   start \<= end ? end - start : end - start + 24 hours
    -   Value Comparion
        -   start \<= end ? (start \<= value AND end > value) : (start
            \<= value OR end > value)

## Scheduling Future Events

-   Record the time for the events.
    -   Future time should be record in Local time, **not UTC** (Goes
        against the normal advice!). Reasons:
        -   Daylight Saving Time: Time zones change their offset
            periodically for DST. If you schedule a daily event at a
            particular time, then the event should fire at the same time
            every day.
        -   Time zone rules can change.
-   Record the time zone associated with the event.
-   Project UTC or DateTimeOffset value for next occurence.
    -   Revise projections whenever updating time zone data.
-   Establish rules for dealing with DST gaps and overlays.
-   Example of running a cron job at 6:00 AM Pacific Time
    -   Save in Database: "Daily", "06:00",
        "America/Los<sub>Angeles</sub>"
    -   Daily is not same as "every 24 hours". Because not all days have
        24 hours due to Daylight saving time transitions.
    -   Project next occurences.
