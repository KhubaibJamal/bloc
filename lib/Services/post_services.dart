import 'dart:convert';

import 'package:bloc_example/Models/post_model.dart';
import 'package:bloc_example/Services/utils/api_utils.dart';
import 'package:http/http.dart' as http;

class PostServices {
  Future<List<PostModel>> getPostData() async {
    List<PostModel> postData = [];
    try {
      final response =
          await http.get(Uri.parse(ApiUtils.baseURL + ApiUtils.postEndPoint));

      var data = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        for (var i in data) {
          postData.add(PostModel.fromJson(i));
        }
        return postData;
      } else {
        throw Error();
      }
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}
