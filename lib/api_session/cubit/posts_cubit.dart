import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_flutter_round_two/api_session/models/post_model.dart';

import 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit() : super(PostsInitial());
  // URL =>>> https://jsonplaceholder.typicode.com/posts
  //BASE URL =>>>> https://jsonplaceholder.typicode.com/
  //END POINT =>> Posts

  //get posts from API using DIO Package
  List<PostModel> posts = [];
  void getAllPosts() async {
    emit(PostsLoading());
    try {
      var response = await Dio(BaseOptions(
        baseUrl: 'https://jsonplaceholder.typicode.com/',
      )).get('posts');
      // print(response.statusCode);
      //print(response.data); // data == body
      posts = response.data
          .map<PostModel>((elemet) => PostModel.fromJson(elemet))
          .toList();
      // print(posts[1].title);
      emit(PostsSucess());
    } catch (error) {
      print(error.toString());
      emit(PostsError(message: error.toString()));
    }
  }
}
