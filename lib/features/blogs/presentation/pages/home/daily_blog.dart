import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seventy_five/features/blogs/presentation/bloc/blog/remote/remote_blog_bloc.dart';
import 'package:seventy_five/features/blogs/presentation/bloc/blog/remote/remote_blog_state.dart';

class DailyBlog extends StatelessWidget {
  const DailyBlog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }
  
  _buildAppBar() {
    return AppBar(
      title: Text("My Blogs", style: GoogleFonts.poppins(),),
    );
  }

  _buildBody() {
    return BlocBuilder<RemoteBlogBloc, RemoteBlogState>(
      builder: (_, state) {
        if(state is RemoteBlogLoading) {
          return const Center(child: CircularProgressIndicator(),);
        }

        if(state is RemoteBlogError) {
          return const Center(child: Icon(Icons.refresh));
        }


        if(state is RemoteBlogDone) {
          return ListView.builder(
            itemCount: state.blogs!.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(state.blogs![index].title!),
                subtitle: Text(state.blogs![index].content!),
              );
            },
          );
        }

        return Text("Something wrong");




      }
      );
  }
}