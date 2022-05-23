class ApiConstants {
  static const String baseUrl = 'https://api.sportsmania.in/api';
  static const String apiVersion = 'v1';
  static const String xApiToken =
      '2y10PUC/Le1X7fLRCKsNZQ09jOzsKZfhHdmVI7EX7uHywk.z/GqzQk7s2';
  static const String category_slug="1";
  static const String news_slug="1";
  static const String api_secret="api-secret";
  static const String news_endpoint="news-full-view/";
  static const String cat_endpoint="category-wise-view/";
  static const String bookmark_endpoint="bookmarks";
  static const String recent_all_news="recent-all-news";
  static const String add_bookmark_endpoint="add-bookmark";
  static const String remove_bookmark_endpoint="remove-bookmark";
  static const String refreshtToken_endpoint="refresh-token";
  static const String login_endpoint="login-user";
  static const String register_endpoint="register-user";
  static const String verify_mobile_no_endpoint="verify-mobile-no";
  static const String verify_new_mobile_no_endpoint="verify-new-mobile-no";
  static const String check_mobile_no_endpoint="check-mobile-no";
  static const String live_score_endpoint="live-score";
  static const String vhange_password_endpoint="change-password";
  static const String refresh_token="refresh-token";
  static const String update_my_profile="update-my-profile";
  static const String search_news="search-news";
  static const String story_full_view="story-full-view";
  static const String save_fcm_token="save-fcm-token";
  static const String photo_full_view="photo-full-view";
  static const String about_us="about-us";
  static const String support_us="support-us";
  static const String notifications="notifications";

  static Uri homeNewsFeedUri = Uri.parse('$baseUrl/$apiVersion/home-page');
  static Uri fullNewsFeedUri = Uri.parse('$baseUrl/$apiVersion/news-full-view/');
  static Uri fullNewsFeedUri11 = Uri.parse('$baseUrl/$apiVersion/news-full-view/1');
  static Uri fullNewsFeedUri1 = Uri.parse('$baseUrl/$apiVersion/my-personalized-feeds');
  static Uri tagsFeedUri = Uri.parse('$baseUrl/$apiVersion/tags-search');
  static Uri storyFullView = Uri.parse('$baseUrl/$apiVersion/story-full-view');
  static Uri categoryNewsFeedUri = Uri.parse('$baseUrl/$apiVersion/category-wise-view/$category_slug');

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
