import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lostandfound/features/home/cubit/home_cubit.dart';
import 'package:lostandfound/features/home/details.dart';
import 'package:lostandfound/features/home/widget/card.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late String url;

  @override
  void initState() {
    super.initState();
    url = 'https://picsum.photos/400/400';
    context.read<HomeCubit>().getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is HomeLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (state is HomeError) {
                  return Center(
                    child: Text(state.message),
                  );
                }

                if (state is HomeSuccess) {
                  if (state.posts.isEmpty) {
                    return const Center(
                      child: Text("لا توجد منشورات حالياً"),
                    );
                  }

                  return GridView.builder(
                    itemCount: state.posts.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 14,
                      mainAxisSpacing: 14,
                      childAspectRatio: 0.92,
                    ),
                    itemBuilder: (context, index) {
                      final post = state.posts[index];

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
                }

                return const SizedBox();
              },
            ),
          ),
        ),
      ],
    );
  }
}