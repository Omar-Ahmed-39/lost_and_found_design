
import 'package:flutter/material.dart' ;
import 'package:lostandfound/core/api/end_points.dart';
import 'package:lostandfound/core/constsnt/image_constant.dart';
import 'package:lostandfound/core/database/cache/cache_helper.dart';
import 'package:lostandfound/core/error/exception.dart';
import 'package:lostandfound/core/theme/app_theme.dart';
import 'package:lostandfound/model/signin_model.dart';

class Sign extends StatefulWidget {
  const Sign({super.key});

  @override
  State<Sign> createState() => _SignState();
}

class _SignState extends State<Sign> {
  final email = TextEditingController();
  final password = TextEditingController();
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       
      body: Container(
        
        margin: EdgeInsets.all(15),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("اهلا وسهلا بك",style: MyTextStyle.title(),),
          SizedBox(height: 60,),
            const SizedBox(height: 28),

                  // الكرتين جنب بعض
                  Row(
                    children: [
                      
                      Expanded(
                        child: _ActionCard(
                          title: 'إنشاء حساب جديد',
                          imagePath: MyAppImage.signupImage,
                          onTap: () {
                             Navigator.of(context).pushNamed("SignupPage");

                          },
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: _ActionCard(
                          title: 'تسجيل الدخول',
                          imagePath: MyAppImage.signinImage,
                          onTap: () {
                            Navigator.of(context).pushNamed("SigninPage");
                          },
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 80),
        
        ],
      ),),
    );
  }
}


class _ActionCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback onTap;

  const _ActionCard({
    required this.title,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.black.withOpacity(0.3),
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: Container(
        height: 190,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color:  MyAppColor.card,
          borderRadius: BorderRadius.circular(18),
          boxShadow: const [
            BoxShadow(
              blurRadius: 10,
              offset: Offset(0, 6),
              color: Color(0x14000000),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // الصورة
            Expanded(
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 10),

            // النص
            Text(
              title,
              textAlign: TextAlign.center,
              style: MyTextStyle.subtitel()
            ),
          ],
        ),
      ),
    );
  }
}