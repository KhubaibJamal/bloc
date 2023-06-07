import 'package:bloc_example/Bloc/post_api_cubit/post_cubit.dart';
import 'package:bloc_example/Bloc/post_api_cubit/post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Handling Post Api using bloc"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: BlocConsumer<PostCubit, PostState>(listener: (context, state) {
          if (state is PostErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Internet is lost"),
                backgroundColor: Colors.red,
              ),
            );
          }
        }, builder: (context, state) {
          if (state is PostLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is PostLoadedState) {
            return ListView.builder(
              itemCount: state.post.length,
              itemBuilder: ((context, index) {
                return ListTile(
                  title: Text(state.post[index].title.toString()),
                  subtitle: Text(state.post[index].body.toString()),
                );
              }),
            );
          } else {
            return const Center(
              child: Text("Connection is Lost"),
            );
          }
        }),
      ),
    );
  }
}
