import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lostandfound/core/database/cache/cache_helper.dart';

class AuthMiddlewares extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (CacheHelper.getData(key: "id")!=null){

      return RouteSettings(name:"/HomeScreen" );
    }
    return null; 
  }
}