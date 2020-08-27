function fn() {
  var host = karate.properties['host'];
  var apiKey = karate.properties['apiKey'];

  var config = {
    host: host,
    apiKey: apiKey,
  }

  return config;
}
