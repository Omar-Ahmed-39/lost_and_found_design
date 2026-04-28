import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lostandfound/core/api/dio_consumer.dart';
import 'package:lostandfound/features/auth/cubit/auth_cubit.dart';
import 'package:lostandfound/features/auth/signin.dart';
import 'package:lostandfound/features/auth/signup.dart';
import 'package:lostandfound/core/database/cache/cache_helper.dart';
import 'package:lostandfound/core/theme/app_theme.dart';
import 'package:lostandfound/features/home/cubit/home_cubit.dart';
import 'package:lostandfound/features/home/home.dart';
import 'package:lostandfound/features/splash/splash_screen.dart';
import 'package:lostandfound/test1.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper().init();
  runApp(const Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    final dioConsumer = DioConsumer(dio: Dio());

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(dioConsumer),
        ),
        BlocProvider(
          create: (context) => HomeCubit(dioConsumer),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: MyAppColor.bg_page,
        ),
        home: ProductDetailsPage(),
        routes: {
          "SigninPage": (context) => const SigninPage(),
          "SignupPage": (context) => const SignupPage(),
          "HomePage": (context) => const Homepage(),
        },
      ),
    );
  }
}