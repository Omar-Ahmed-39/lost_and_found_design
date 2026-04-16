
import 'package:flutter/material.dart' ;
import 'package:lostandfound/core/api/end_points.dart';
import 'package:lostandfound/core/constsnt/image_constant.dart';
import 'package:lostandfound/core/database/cache/cache_helper.dart';
import 'package:lostandfound/core/error/exception.dart';
import 'package:lostandfound/core/theme/app_theme.dart';
import 'package:lostandfound/features/auth/widget/card_offer.dart';
import 'package:lostandfound/model/signin_model.dart';

class Sign extends StatefulWidget {
  const Sign({super.key});

  @override
  State<Sign> createState() => _SignState();
}

class _SignState extends State<Sign> {

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
                        child: ActionCard(
                          title: 'إنشاء حساب جديد',
                          imagePath: MyAppImage.signupImage,
                          onTap: () {
                             Navigator.of(context).pushNamed("SignupPage");

                          },
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: ActionCard(
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

