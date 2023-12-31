import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:graphqldemo/core/routes/app_config_routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphqldemo/features/mainApp/presentation/cubit/blog_cubit.dart';

import '../core/utils/dependency_injection.dart' as di;

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  ///default initializer

  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<BlogCubit>(
              create: (BuildContext context) =>
                  di.servicelocater<BlogCubit>()..fetchBlogs())
        ],
        child: MaterialApp.router(
          // Providing a restorationScopeId allows the Navigator built by the
          // MaterialApp to restore the navigation stack when a user leaves and
          // returns to the app after it has been killed while running in the
          // background.
          restorationScopeId: 'app',
          debugShowCheckedModeBanner: false,

          // Provide the generated AppLocalizations to the MaterialApp. This
          // allows descendant Widgets to display the correct translations
          // depending on the user's locale.
          localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const <Locale>[
            Locale('en', ''), // English, no country code
          ],

          // Use AppLocalizations to configure the correct application title
          // depending on the user's locale.
          //
          // The appTitle is defined in .arb files found in the localization
          // directory.
          onGenerateTitle: (BuildContext context) =>
              AppLocalizations.of(context)!.appTitle,

          // Define a light and dark color theme. Then, read the user's
          // preferred ThemeMode (light, dark, or system default) from the
          // SettingsController to display the correct theme.
          theme: ThemeData(),
          darkTheme: ThemeData.dark(),
          routerConfig: AppConfigRoutes().router,
        ),
      );
}
