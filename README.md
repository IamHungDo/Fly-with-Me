# Fly-with-Me
Emirates Travel Hackathon

Fly with Me is a travel iOS application that determines your preferences based on personas. Our goal was to guess the preferences of the user. We did this by using the twitter API to take the last 200 tweets and push that information into the IBM personality insights. The personality insights will then determine the personality of the person based on the twitter feed.

Each personality came with a percentage. Depending on the percentage, we choose whether or not to show particular information to the user. For example, if the adventure personality is higher than 80%, then we show attractions.

Not only that we utilized the personality insights API to determine the preferences, we also linked it to another API called IBM sunburst. This API creates a sunburst style graph that shows each personality with a given percentage.
