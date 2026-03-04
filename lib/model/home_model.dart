
class Post {
  final int id;
  final String content;
  final String imageUrl;

  Post({required this.id, required this.content, required this.imageUrl});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: (json['id'] as num).toInt(),
      content: json['post_content']?.toString() ?? 'لا يوجد محتوى',
      imageUrl: json['image_url']?.toString() ?? '',
    );
  }
}