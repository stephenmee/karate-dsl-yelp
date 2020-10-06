# karate-yelp-graphql-poc  

POC GraphQL functional tests using [Karate DSL](https://intuit.github.io/karate/)  
Tests the following endpoint https://api.yelp.com/v3/graphql  
Sign-up for a Yelp Developer Beta Program account here https://www.yelp.com/developers/graphql/guides/intro  
Note: you will need the API key provided by your account to make requests   
  

## Runnning locally
Requirements: Java and Maven
  
To run the tests locally, execute this command - you also need to supply the apiKey in the command (apiKey will be generated for you when you signup to the beta program)

    mvn clean test -Dhost=api.yelp.com -DapiKey=yourApiKey
    
A report will be generated in target/cucumber-html-reports/overview-features.html

