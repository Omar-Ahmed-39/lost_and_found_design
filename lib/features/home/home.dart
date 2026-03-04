import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lostandfound/core/api/api_consumer.dart';
import 'package:lostandfound/core/api/dio_consumer.dart';
import 'package:lostandfound/core/constsnt/image_constant.dart';
import 'package:lostandfound/core/shared/appbar.dart';
import 'package:lostandfound/core/shared/navigation_bottom_bar.dart';
import 'package:lostandfound/features/home/details.dart';
import 'package:lostandfound/features/home/widget/card.dart';
import 'package:lostandfound/model/home_model.dart';


class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
   late ApiConsumer api;
  late Future<List<Post>> postsFuture;
    int currentIndex = 3;
    late String url;

   @override
  void initState() {
    super.initState();
    // تهيئة الـ API والـ Future في الـ initState لضمان عدم تكرار الطلب عند الـ Build
    api = DioConsumer(dio: Dio());
    postsFuture = getPosts(); 
  }

  Future<List<Post>> getPosts() async {
    try {
      final response = await api.get("posts");
      final List<dynamic> data = response["data"];
      return data.map((item) => Post.fromJson(item)).toList();
    } catch (e) {
      throw Exception("فشل تحميل البيانات: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    extendBodyBehindAppBar: true,
    extendBody: true,
appBar: MyAppbar(),
 bottomNavigationBar: MyNavigationBottomBar( currentIndex: currentIndex),
  
      body: Container(child: 
      Column(children: [
       
         Expanded(
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 14,vertical: 20),
                child:  FutureBuilder<List<Post>>(
                  future: postsFuture,
          builder: (context, snapshot) {
            // 1. حالة التحميل
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            // 2. حالة الخطأ
            if (snapshot.hasError) {
              return Center(
                child: Text("حدث خطأ ما: ${snapshot.error}"),
              );
            }

            // 3. حالة عدم وجود بيانات
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text("لا توجد منشورات حالياً"));
            }
           url="data:image/jpeg;base64,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";
            // 4. حالة نجاح وصول البيانات
            final posts = snapshot.data!;
                  return GridView.builder(
                     itemCount: posts.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // 2 في الصف
                      crossAxisSpacing: 14,
                      mainAxisSpacing: 14,
                      childAspectRatio: 0.92, // قريب من شكل الكرت بالصورة
                    ),
                    itemBuilder: (context, index) {
                      final post =  posts[index];
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>DetailsPage(title:  post.content, date: post.imageUrl,
                               status: post.content, statusColor: Colors.green, image: post.imageUrl) ));
                        },
                        child: OfferCard(
                          title:  post.content,
                          date:  post.content,
                          status:  post.content,
                          statusColor: Colors.green,
                          imageUrl: url,
                        ),
                      );
                    },
                  );
               }),
              ),
            ),
          
      
        const SizedBox(width: 6),],)
        ),
      );
    
  }
}



