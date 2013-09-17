You haven't actually reached geocities.  Sorry to disappoint
=====================================

What you have found is a sample application used by Placeable.  We use this application for on-boarding.
If you've joined the team, or are thinking about joining, please read on.  If not, please leave things as you found them.

# Getting Started
To perform this exercise, all you'll need is a running JVM, and a recent copy of the [PlayFramework|http://www.playframework.com/download] (2.1.4 as of this writing)

Once you've got the necessary prerequisites, open up the project in your favorite IDE, and head over to app/controllers/Cities.scala,
where you'll see a few utility methods to get you started, along with an example of how *NOT* to use Play.

The findLocation function shows a few poorly implemented concepts (especially for Playframework), but shows how to use the provided utility methods to make a geocode request
and output a JSON response.

# Goal
As a user
I want to find the city that is furthest from the equator
So that I can plan my next adventure

# The exercise
The findFurthest function has been stubbed out, and code has been provided to parse valid requests, geocode input, and output JSON.
To fulfill the stated goal (above) you'll need to take the list of inputted cities, geocode them, find the location furthest
from the equator, and then output it's formatted address as JSON.  Please take whatever liberties with application design that you
think that this problem warrants.

## Assumptions
This exercise isn't meant to be exhaustive with error handling.  With that in mind, please assume that all input will be valid.
Additionally, assume that any input will correctly geocode, and results for these queries will always be returned.

## Examples:
An example request showing the use of our findLocation function:
    curl 'http://localhost:9000/geocodeCity?apiKey=0b40d6b2895828a8c7b66f9f73f3c18f&city=Denver'

And it's example response:
    {"name":"Denver, CO","latitude":"39.74000930786133","longitude":"-104.99230194091797"}

An example request to the findFurthest function that you'll be working on
    curl 'http://localhost:9000/furthestFromEquator?apiKey=0b40d6b2895828a8c7b66f9f73f3c18f' -d '{"cities": ["Seattle WA", "Portland ME"]}'

And an example of the expected (status 200) response:
    {"name":"Seattle, WA"}