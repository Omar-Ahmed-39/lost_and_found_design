import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lostandfound/core/api/api_consumer.dart';
import 'package:lostandfound/core/api/dio_consumer.dart';
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
  late String url;

  @override
  void initState() {
    super.initState();
    api = DioConsumer(dio: Dio());
    postsFuture = getPosts();
    url = 'https://picsum.photos/400/400';
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
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
            child: FutureBuilder<List<Post>>(
              future: postsFuture,
              builder: (context, snapshot) {
                // تحميل
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                // خطأ
                if (snapshot.hasError) {
                  return Center(
                    child: Text("حدث خطأ ما: ${snapshot.error}"),
                  );
                }

                // لا يوجد بيانات
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text("لا توجد منشورات حالياً"));
                }

                final posts = snapshot.data!;

                return GridView.builder(
                  itemCount: posts.length,
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 14,
                    childAspectRatio: 0.92,
                  ),
                  itemBuilder: (context, index) {
                    final post = posts[index];

                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => DetailsPage(
                              title: post.content,
                              date: post.imageUrl,
                              status: post.content,
                              statusColor: Colors.green,
                              image: url,
                            ),
                          ),
                        );
                      },
                      child: OfferCard(
                        title: post.content,
                        date: post.content,
                        status: post.content,
                        statusColor: Colors.green,
                        imageUrl: url,
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}