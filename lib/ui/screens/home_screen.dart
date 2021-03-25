import 'package:flutter/material.dart';
import 'package:homeward/logic/cubit/blog_cubit.dart';
import 'package:homeward/ui/widgets/blog_list_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ///fetch blogs
    final getblogs = context.read<BlogCubit>().getBlogs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Homeward Blog",
              style: TextStyle(
                  fontSize: 22,
                color: Colors.blue
              ),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(child: BlogListWidget()),
    );
  }
}
