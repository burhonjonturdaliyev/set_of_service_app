// ignore_for_file: camel_case_types

class serverApi {
  String url =
      "http://ec2-54-199-249-118.ap-northeast-1.compute.amazonaws.com:7088";
}

class Api {
  String foods = '${serverApi().url}/sos/api/shop/foods';
  String nofoods = '${serverApi().url}/sos/api/shop/no-foods';
  String login = '${serverApi().url}/sos/api/auth/login';
  String step1 = '${serverApi().url}/sos/api/auth/step_1';
  String step2 = '${serverApi().url}/sos/api/auth/step_2';
  String step3 = '${serverApi().url}/sos/api/auth/step_3/register';
  String globalChatGet = "${serverApi().url}/sos/api/chat/all";
  String globatChatPut = '${serverApi().url}/sos/api/chat';
  String elon = "${serverApi().url}/sos/api/shop";
  String homeAgency = "${serverApi().url}/sos/api/service/home-agent";
  String vizaSupport = "${serverApi().url}/sos/api/service/visa-support";
  String sendMoneyCash = "${serverApi().url}/sos/api/service/send-money-cash";
  String jobAgent = "${serverApi().url}/sos/api/service/job-agent";
  String pochta = "${serverApi().url}/sos/api/service/postal-service-agent";
  String supportGet =
      "${serverApi().url}/sos/api/support-chats/get-all-dialog/";
  String supportPut = "${serverApi().url}/sos/api/support-chats";
  String airTicket = '${serverApi().url}/sos/api/service/avia-ticket-agent';
  String getComment = '${serverApi().url}/sos/api/info-comment/';
  String putComment = '${serverApi().url}/sos/api/info-comment';
  String putAirticket = '${serverApi().url}/sos/api/air/ticket/info';
  String smsGet = '${serverApi().url}/sos/api/auth/step_1';
}
