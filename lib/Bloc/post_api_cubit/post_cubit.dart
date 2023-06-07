import 'package:bloc_example/Bloc/post_api_cubit/post_state.dart';
import 'package:bloc_example/Models/post_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Services/post_services.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostLoadingState()) {
    fetchPostData();
  }

  PostServices postServices = PostServices();

  void fetchPostData() async {
    try {
      final List<PostModel> post = await postServices.getPostData();
      emit(PostLoadedState(post));
    } catch (error) {
      emit(PostErrorState(error.toString()));
    }
  }
}
