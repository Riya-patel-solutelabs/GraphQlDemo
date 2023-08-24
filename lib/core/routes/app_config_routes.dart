import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graphqldemo/core/routes/app_config_constants.dart';
import 'package:graphqldemo/features/mainApp/presentation/pages/blog_details_page.dart';
import 'package:graphqldemo/features/mainApp/presentation/pages/home_page.dart';
import 'package:graphqldemo/features/mainApp/presentation/pages/my_app.dart';

///routes config class
class AppConfigRoutes {
  ///router config var
  GoRouter router = GoRouter(routes: <RouteBase>[
    GoRoute(
        path: '/',
        name: AppConfigConstants.myapp,
        builder: (BuildContext context, _) => const MyApp()),
    GoRoute(
        path: '/home',
        name: AppConfigConstants.home,
        builder: (BuildContext context, _) => const HomePage()),
    // GoRoute(
    //     path: '/blogDetails/',
    //     name: AppConfigConstants.blogDetails,
    //     builder: (BuildContext context, _) => const BlogDetailsPage(
    //           currentBlog: _.pathParameters['currentBlog'],
    //         )),
  ]);
}
