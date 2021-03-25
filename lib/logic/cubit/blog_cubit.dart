import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:homeward/logic/services/utilitis.dart';
import 'package:homeward/models/blog_model.dart';

part 'blog_state.dart';

class BlogCubit extends Cubit<BlogState> {
  BlogCubit() : super(BlogInitial());


  UtilitiesService get = UtilitiesService();

  List<BlogModel> blogList = List();
  Map blogMap = Map();
  ///for get all blogs
  Future<List<BlogModel>>getBlogs()async{
    emit(BlogLoading());
    get.getWithParams("blogs", {}).then((response) {
      print(response.statusCode);
      if (response != null && response.statusCode == 200) {
        emit(BlogFetched());
        print(response.body);
        blogList = (json.decode(response.body)as List).map((blog) => BlogModel.fromJson(blog))
            .toList();
      }else{
        emit(BlogFailed(error: response.body));
      }

    });
    return blogList;
  }

  ///for get only one blog
  Future getSingleBlog(int index)async{
    emit(BlogLoading());
    get.getWithParams("blogs/$index", {}).then((response) {
      print(response.statusCode);
      if (response != null && response.statusCode == 200) {
        emit(BlogFetched());
        print(response.body);
        blogMap = json.decode(response.body);
      }else{
        emit(BlogFailed(error: response.body));
      }

    });
    return blogList;
  }

}
