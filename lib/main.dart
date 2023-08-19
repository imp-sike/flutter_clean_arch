import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seventy_five/features/blogs/presentation/bloc/blog/remote/remote_blog_bloc.dart';
import 'package:seventy_five/features/blogs/presentation/bloc/blog/remote/remote_blog_event.dart';
import 'package:seventy_five/features/blogs/presentation/pages/home/daily_blog.dart';
import 'package:seventy_five/injection_container.dart';

Future<void> main() async {
  await initializeDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteBlogBloc>(
      create: (context) => sl()..add(const GetBlogs()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DailyBlog()
      ),
    );
  }
}
