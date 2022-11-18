import 'package:redditum_flapp/core/environment/env.dart';

class AppConfig {
  static void init() {
    Environment.type = ENV.dev;
  }
}
