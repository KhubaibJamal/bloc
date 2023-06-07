import 'package:bloc_example/Models/post_model.dart';

abstract class PostState {}

class PostLoadingState extends PostState {}

class PostLoadedState extends PostState {
  final List<PostModel> post;
  PostLoadedState(this.post);
}

class PostErrorState extends PostState {
  final String errorMessage;
  PostErrorState(this.errorMessage);
}
