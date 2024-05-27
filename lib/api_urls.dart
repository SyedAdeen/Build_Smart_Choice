class ApiUrls {
  //static const String baseUrl = 'http://10.0.2.2:5000';
  static const String baseUrl = 'http://192.168.18.30:5000';
  //static const String baseUrl ='https://84fa-2401-ba80-a183-aa39-cdd7-bb6a-12dd-b8fe.ngrok-free.app';
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
  static const String getGrey = '$baseUrl/get_grey';
  static const String getFinish = '$baseUrl/get_finish';
  static const String update_finish_rate = '$baseUrl/update_finish_rate';
  static const String recommend_data = '$baseUrl/recommend_data';
  static const String fetch_pack1_data = '$baseUrl/pack1_data';
}
