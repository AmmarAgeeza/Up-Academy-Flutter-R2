import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_flutter_round_two/api_session/cubit/posts_cubit.dart';

import '../cubit/posts_state.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostsCubit()..getAllPosts(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Posts')),
        body: BlocConsumer<PostsCubit, PostsState>(
          listener: (BuildContext context, PostsState state) {
            if (state is PostsError) {
              //toast
              print(state.message);
            }
          },
          builder: (BuildContext context, PostsState state) {
            if (state is PostsSucess) {
              return ListView.builder(
                  itemCount: context.read<PostsCubit>().posts.length,
                  itemBuilder: (context, index) {
                    var postsList = context.read<PostsCubit>().posts;

                    return ListTile(
                      leading: Text(postsList[index].id.toString()),
                      title: Text(postsList[index].title),
                      subtitle: Text(postsList[index].body),
                      trailing: Text(postsList[index].userId.toString()),
                    );
                  });
            }

            if (state is PostsError) {
              return Center(
                child: Text(state.message),
              );
            }

            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
