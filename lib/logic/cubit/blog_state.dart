part of 'blog_cubit.dart';

abstract class BlogState extends Equatable {
  const BlogState();
}

class BlogInitial extends BlogState {
  @override
  List<Object> get props => [];
}
class BlogLoading extends BlogState {
  @override
  List<Object> get props => [];
}
class BlogFetched extends BlogState {
  @override
  List<Object> get props => [];
}
class BlogFailed extends BlogState {
  final String error;

  BlogFailed({this.error});

  @override
  List<Object> get props => [];
}
