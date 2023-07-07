// ignore_for_file: camel_case_types, non_constant_identifier_names

class serverApi {
  String url =
      "http://ec2-54-199-249-118.ap-northeast-1.compute.amazonaws.com:7088";
}

class Api {
  String countInfo = '${serverApi().url}/sos/api/county/news/get-all/count';
  String new_catagory = '${serverApi().url}/sos/api/county/news/category/';
  String uploadImage = '${serverApi().url}/sos/api/file/upload/shop-photos';
  String foods = '${serverApi().url}/sos/api/shop/foods';
  String nofoods = '${serverApi().url}/sos/api/shop/no-foods';
  String login = '${serverApi().url}/sos/api/auth/login';
  String step1 = '${serverApi().url}/sos/api/auth/step_1';
  String step2 = '${serverApi().url}/sos/api/auth/step_2';
  String step3 = '${serverApi().url}/sos/api/auth/step_3/register';
  String forget_password = '${serverApi().url}/sos/api/auth/forget/password/';
  String globalChatGet = "${serverApi().url}/sos/api/chat/all";
  String globatChatPut = '${serverApi().url}/sos/api/chat';
  String elon = "${serverApi().url}/sos/api/shop";
  String homeAgency = "${serverApi().url}/sos/api/service/all/home-agent";
  String vizaSupport = "${serverApi().url}/sos/api/service/all/visa-support";
  String sendMoneyCash =
      "${serverApi().url}/sos/api/service/all/send-money-cash";
  String jobAgent = "${serverApi().url}/sos/api/service/all/job-agent";
  String pochta = "${serverApi().url}/sos/api/service/all/postal-service-agent";
  String supportGet = "${serverApi().url}/sos/api/support-chat/get-all-dialog/";
  String supportPut = "${serverApi().url}/sos/api/support-chat";
  String airTicket = '${serverApi().url}/sos/api/service/all/avia-ticket-agent';
  String getComment = '${serverApi().url}/sos/api/info-comment/';
  String putComment = '${serverApi().url}/sos/api/info-comment';
  String putAirticket = '${serverApi().url}/sos/api/air_ticket/info';
  String smsGet = '${serverApi().url}/sos/api/auth/step_1';
  String id_card = '${serverApi().url}/sos/api/file/upload/id-card/';
  String upload_avatar = '${serverApi().url}/sos/api/file/upload/avatar';
  String edit_user = '${serverApi().url}/sos/api/user';
  String faol_elon = '${serverApi().url}/sos/api/shop/my/no-food/by-user/';
  String view_image = '${serverApi().url}/sos/api/file/view/one/photo/';
  String other_services =
      '${serverApi().url}/sos/api/service/all/other-service';
}
