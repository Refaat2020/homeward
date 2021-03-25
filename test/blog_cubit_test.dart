import 'package:bloc_test/bloc_test.dart';
import 'package:homeward/logic/cubit/blog_cubit.dart';
import 'package:test/test.dart';

void main() {
  group('BlogCubit', () {
    BlogCubit blogCubit;

    setUp(() {
      blogCubit = BlogCubit();
    });

    tearDown(() {
      blogCubit.close();
    });

    test('initial state of BlogCubit is BlogState()', () {
      expect(blogCubit.state, BlogInitial());
    });

    blocTest(
        'the blogCubit should emit a blogLoading when the getBlogs function is called',
        build: () => blogCubit,
        act: (cubit) => blogCubit.getBlogs(),
        expect: [BlogLoading(),BlogFetched(),]);

    blocTest(
        'the blogCubit should emit a blogLoading when the getSingleBlog function is called',
        build: () => blogCubit,
        act: (cubit) => blogCubit.getSingleBlog(1),
        expect: [BlogLoading(),BlogFetched(),]);

  });
}