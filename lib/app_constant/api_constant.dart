class ApiConstants {
  static const String baseUrl = 'http://api.indiancoinshop.com/api';
  static const String apiVersion = 'v1';

  static const String login_endpoint="login";
  static const String register_endpoint="register";

  static Uri homeNewsFeedUri = Uri.parse('$baseUrl/$apiVersion/home');
  static Uri fullNewsFeedUri = Uri.parse('$baseUrl/$apiVersion/fullview');
  static Uri tagsFeedUri = Uri.parse('$baseUrl/$apiVersion/tags-search');

  static const String NEWS_TITLE="";
  static const String NEWS_IMAGE="";
  static const String NEWS_DETAILS="";
  static const int NEWS_ID=0;

  static var url = "";
  static printString() {
    print(url);
  }
  static changeString(String a) {
    url = a;
    printString(); // this can be replaced with any static method
  }

}
