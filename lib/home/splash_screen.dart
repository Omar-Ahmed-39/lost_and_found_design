import 'package:flutter/material.dart';
import 'package:lostandfound/auth/sign.dart';
import 'package:lostandfound/core/constsnt/image_constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
nav();
    // TODO: implement initState
    super.initState();
  }
  Future nav()async{
    await  Future.delayed(Duration(seconds: 3));
   Navigator.of(context).pushAndRemoveUntil(
    PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 800),
      pageBuilder: (context, animation, secondaryAnimation) => const Sign(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    ),
    (route) => false,
  );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF56A8E8), // أزرق علوي قريب من الصورة
              Color(0xFFD9CFA8), // رملي سفلي قريب من الصورة
            ],
          ),
        ),
        child: SafeArea(
          child: Stack(
            alignment: Alignment.center,
            children: [
              // الشعار أعلى المنتصف
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 28),
                  child: Container(
                    width: 74,
                    height: 74,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.9),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 12,
                          spreadRadius: 1,
                          offset: const Offset(0, 6),
                          color: Colors.black.withOpacity(0.12),
                        ),
                      ],
                    ),
                    child: Image.asset(
                        MyAppImage.logoHadramout, // <-- غيّر المسار
                        fit: BoxFit.contain,
                      
                    ),
                  ),
                ),
              ),

              // نص المنتصف
              Directionality(
                textDirection: TextDirection.rtl,
                child: Container(
                   width: 250,
                    height: 250,
                  child: Image.asset(
                          MyAppImage.logoImage, // <-- غيّر المسار
                          fit: BoxFit.contain,
                        
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}