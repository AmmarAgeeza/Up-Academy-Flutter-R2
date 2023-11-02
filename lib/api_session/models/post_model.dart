/*
 {
        "userId": 1,
        "id": 1,
        "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
        "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
    },
     */
class PostModel {
  //attributes
  final int id;
  final int userId;
  final String title;
  final String body;

  PostModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  });

  //named constructor

  factory PostModel.fromJson(Map<String,dynamic> json){
    return PostModel(
      id: json['id'],
     userId: json['userId'],
      title: json['title'],
      body: json['body'],
     );
  }
}

void main(){
  var post =PostModel(id: 1, userId: 2, title: 'title', body: 'body');
  post.id;
}
