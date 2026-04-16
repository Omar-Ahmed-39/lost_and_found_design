import 'package:flutter/material.dart';
import 'package:lostandfound/features/auth/sign.dart';
import 'package:lostandfound/core/constsnt/image_constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  // حركة الشعار العلوي (Fade + Scale)
  late final Animation<double> _topFade;
  late final Animation<double> _topScale;

  // حركة اللوغو بالوسط (Fade + Scale)
  late final Animation<double> _centerFade;
  late final Animation<double> _centerScale;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _topFade = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.55, curve: Curves.easeOut),
    );
    _topScale = Tween<double>(begin: 0.92, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.70, curve: Curves.easeOutBack),
      ),
    );

    _centerFade = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.25, 1.0, curve: Curves.easeOut),
    );
    _centerScale = Tween<double>(begin: 0.92, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.25, 1.0, curve: Curves.easeOutBack),
      ),
    );

    _controller.forward();
    nav();
  }

  Future nav() async {
    await Future.delayed(const Duration(seconds: 3));

    if (!mounted) return;

    Navigator.of(context).pushAndRemoveUntil(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 800),
        pageBuilder: (context, animation, secondaryAnimation) => const Sign(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
      (route) => false,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
              // الشعار أعلى المنتصف (نفسه) لكن مع Animation
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 28),
                  child: FadeTransition(
                    opacity: _topFade,
                    child: ScaleTransition(
                      scale: _topScale,
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
                          MyAppImage.logoHadramout, // <-- نفس المسار
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // اللوغو بالمنتصف (نفسه) لكن مع Animation
              Directionality(
                textDirection: TextDirection.rtl,
                child: FadeTransition(
                  opacity: _centerFade,
                  child: ScaleTransition(
                    scale: _centerScale,
                    child: Container(
                      width: 250,
                      height: 250,
                      child: Image.asset(
                        MyAppImage.logoImage, // <-- نفس المسار
                        fit: BoxFit.contain,
                      ),
                    ),
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