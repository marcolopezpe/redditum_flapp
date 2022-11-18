enum ENV {
  local,
  dev,
  prod,
}

extension Environment on ENV {
  static ENV type = ENV.dev;

  static Map<String, dynamic> get appConfig {
    switch (type) {
      case ENV.local:
        return {
          "environment": 'LOCAL',
          "baseUrl": "http://localhost:9003/redditum-api",
          "connectionTimeout": 60000
        };
      case ENV.dev:
        return {
          "environment": 'DEVELOPMENT',
          "baseUrl": "http://app.marcolopez.pe:8003/redditum-api",
          "connectionTimeout": 60000
        };
      case ENV.prod:
        return {
          "environment": 'PRODUCTION',
          "baseUrl": "http://app.marcolopez.pe:8003/redditum-api",
          "connectionTimeout": 60000
        };
      default:
        return {"": ""};
    }
  }
}
