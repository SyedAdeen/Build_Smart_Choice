class ApiUrls {
  //static const String baseUrl = 'http://10.0.2.2:5000';
  static const String baseUrl = 'http://192.168.18.30:5000';
  //static const String baseUrl = 'https://3068-58-27-213-34.ngrok-free.app';
  static const String forgot = '$baseUrl/forgot';
  static const String login = '$baseUrl/login';
  static const String signup = '$baseUrl/signup';
  static const String adduser = '$baseUrl/adduser';
  static const String verifyuser = '$baseUrl/verify_user';
  static const String checkpass1 = '$baseUrl/check_pass';
  static const String checkpass2 = '$baseUrl/check_pass2';
  static const String sendfeed = '$baseUrl/send_feed';
  static const String getfeeds = '$baseUrl/get_all_feeds';
  static const String updatefeedaction = '$baseUrl/update_action';
  static const String fetchusers = '$baseUrl/get_users';
  static const String deluser = '$baseUrl/remove_users';
  static const String singlestorypackage = '$baseUrl/single_package';
  static const String doublestorypackage = '$baseUrl/double_package';
  static const String singlestorybasementpackage =
      '$baseUrl/single_basement_package';
  static const String doublestorybasementpackage =
      '$baseUrl/double_basement_package';

  static const String laboursinglestorypackage =
      '$baseUrl/labour_single_package';
  static const String labourdoublestorypackage =
      '$baseUrl/labour_double_package';

  static const String laboursinglestorybasementpackage =
      '$baseUrl/labour_single_basement_package';
  static const String labourdoublestorybasementpackage =
      '$baseUrl/labour_double_basement_package';
}
