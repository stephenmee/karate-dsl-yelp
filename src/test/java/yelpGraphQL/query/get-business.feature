Feature: test query business

  Background:
    * url 'https://'+host+'/v3/graphql'
    * header Authorization = 'Bearer '+apiKey

  @business
  Scenario: query for a business by id
    Given text query =
    """
    {
      business(id: "garaje-san-francisco"){
        name
        id
        alias
        url
      }
    }
    """
    And request { query: '#(query)' }
    When method post
    Then status 200
    Then match response ==
    """
    {
      "data": {
        "business": {
          "name": "Garaje",
          "id": "tnhfDv5Il8EaGSXZGiuQGg",
          "alias": "garaje-san-francisco",
          "url": "https://www.yelp.com/biz/garaje-san-francisco?adjust_creative=6AbCaexLqwnJsHqFj_HZBQ&utm_campaign=yelp_api_v3&utm_medium=api_v3_graphql&utm_source=6AbCaexLqwnJsHqFj_HZBQ"
        }
      }
    }
    """

    @business
  Scenario: search for burritos in Cork
    Given  text query =
    """
     {
      search(term: "burrito", location: "cork" limit: 2) {
          total
              business {
                  name
                  rating
                  location {
                      address1
                      city
                      state
                      country
                  }
              reviews(limit: 1) {
                  text
                  rating
                  user {
                      name
                  }
              }
          }
      }
    }
    """
    And request { query: '#(query)' }
    When method post
    Then status 200
    Then match response ==
    """
    {
      "data": {
          "search": {
              "total": '#number',
              "business": '#array'
          }
      }
    }
    """

  @business
  Scenario Outline: test all query variables
    Given text query =
    """
    {
      business(id: "garaje-san-francisco"){
        <variable>
      }
    }
    """
    And request { query: '#(query)' }
    When method post
    Then status 200
    Then match response ==
    """
       {
      "data": {
        "business": {
          "<variable>": "#<type>"
        }
      }
    }
    """
    Examples:
      | variable   | type    |
      | alias      | string  |
      | url        | string  |
      | is_claimed | boolean |
      | rating     | number  |
