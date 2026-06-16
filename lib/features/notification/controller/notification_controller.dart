import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:lostandfound/core/database/cache/cache_helper.dart';

class NotificationController extends GetxController{
  List<Map<String, dynamic>> notifications = [];
  void loadNotifications() {
  notifications = CacheHelper.getListMap(
    key: "notifications",
  );

  update();
}

void saveNotification({
  required String title,
  required String body,
}) {
  notifications.insert(0, {
    "title": title,
    "body": body,
  });

  CacheHelper.saveListMap(
    key: "notifications",
    value: notifications,
  );

  update();
}

    @override
  void onInit() {
    super.onInit();

      loadNotifications();


    myPermissionMessage();
    getToken();
    getinitialMessage();
    ifAppIsOpen();
    ifClickOnNotfication();
  }
  
  myPermissionMessage()async{
    FirebaseMessaging messaging = FirebaseMessaging.instance;

NotificationSettings settings = await messaging.requestPermission(
  alert: true,
  announcement: false,
  badge: true,
  carPlay: false,
  criticalAlert: false,
  provisional: false,
  sound: true,
);

if (settings.authorizationStatus == AuthorizationStatus.authorized) {
  print('User granted permission');
} else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
  print('User granted provisional permission');
} else {
  print('User declined or has not accepted permission');
}
  }
  getToken()async{
    String? mytoken=await FirebaseMessaging.instance.getToken();
    print('===============');
    print(mytoken);
  }
  getinitialMessage()async{
     RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

        if(initialMessage!=null){
          if (initialMessage!.data['type'] == 'Homepage') {
      // Navigator.of(context).push(MaterialPageRoute(builder: (context) => Homepage(),));}
       
          }}
        
  }
 ifAppIsOpen(){
    FirebaseMessaging.onMessage.listen((RemoteMessage  message) {// تشتغل في حالة كان التطبيق   مفتوح
      if(message.notification!=null){
saveNotification(
    title: message.notification!.title ?? "No Title",
    body: message.notification!.body ?? "",
  );     
      }
      
    },);
 }
   ifClickOnNotfication(){
     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {//تشتغل عند الظغط على الاشعار
        print("================================");
        print("excuetonMessageOpenedApp");
      },);
   }
}