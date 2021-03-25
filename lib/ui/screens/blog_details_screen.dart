import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homeward/logic/cubit/blog_cubit.dart';
import 'package:homeward/ui/widgets/loading_progress_widget.dart';

///for only one blog
class BlogDetailsScreen extends StatefulWidget {
 final int blogIndex;

 BlogDetailsScreen({this.blogIndex});

  @override
  _BlogDetailsScreenState createState() => _BlogDetailsScreenState();
}

class _BlogDetailsScreenState extends State<BlogDetailsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ///fetch the blog
    context.read<BlogCubit>().getSingleBlog(widget.blogIndex);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:BlocConsumer<BlogCubit,BlogState>(
          builder: (context, state) {
            if (state is BlogLoading) {
              return LoadingProgressWidget();
            }else if (state is BlogFetched) {
              return Column(
                children: [
                Container(
                  height: MediaQuery.of(context).size.height/2,
                  width: MediaQuery.of(context).size.width,

                  child: CachedNetworkImage(
                    imageUrl: context.read<BlogCubit>().blogMap["imageUrl"],
                    width: MediaQuery.of(context).size.width,

                    fit: BoxFit.cover,
                  ),
                ) ,
                  SizedBox(height: 10,),
                  Center(
                    child: Text(
                      context.read<BlogCubit>().blogMap["title"],
                      style: TextStyle(
                        color: Colors.blue,
                      ),

                    ),
                  ),
                  SizedBox(height: 100,),

                  Text(
                    context.read<BlogCubit>().blogMap["createdAt"],
                    style: TextStyle(
                      color: Colors.blue,
                    ),

                  ),
                ],
              );
            }
            return Container();
          },
          listener: (context, state) {
          if (state is BlogFailed) {
            Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text('${state.error}')));
          }
          },
      ) ,
    );
  }
}
