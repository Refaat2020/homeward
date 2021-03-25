import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homeward/logic/cubit/blog_cubit.dart';
import 'package:homeward/ui/screens/blog_details_screen.dart';
import 'package:homeward/ui/widgets/loading_progress_widget.dart';

import 'blog_tile_widget.dart';

class BlogListWidget extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child:  Column(
        children: <Widget>[
          BlocConsumer<BlogCubit,BlogState>(
            builder: (context, state) {
              if (state is BlogLoading) {
                return LoadingProgressWidget();
              } else if (state is BlogFetched) {
              return  ListView.builder(
                controller: _scrollController,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  itemCount: context.read<BlogCubit>().blogList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>BlogDetailsScreen(blogIndex: index,)));
                      },
                      child: BlogsTile(
                          imgUrl: context.read<BlogCubit>().blogList[index].imageUrl,
                          title: context.read<BlogCubit>().blogList[index].title,
                          createdAt: context.read<BlogCubit>().blogList[index].createdAt,
                          ),
                    );
                  },
                );
              }else{
                return LinearProgressIndicator();
              }
            },
            listener: (context, state) {
              if (state is BlogFailed) {
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text('${state.error}')));
              }
            },
          ),

        ],
      )
    );
  }
}
