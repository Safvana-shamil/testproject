
import 'package:flutter/material.dart';
import 'package:testproject/services/network_service.dart';
import '../import_packages.dart';
import 'services/locator.dart';

void main() {
  setUp();
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return HomePage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'course_details',
          builder: (BuildContext context, GoRouterState state) {
            CourseModel courseModel = state.extra as CourseModel;
            return CourseDetails(courseModel : courseModel);
          },
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<NetworkStatus>(
          create: (context) =>
          NetworkStatusService().networkStatusController.stream,
          initialData: NetworkStatus.Online,
        ),
        ChangeNotifierProvider.value(value: LanguageViewModel()),
        ChangeNotifierProvider(
          create: (_) => CourseViewModel(),
        ),

      ],
      child: Consumer<LanguageViewModel>(
        builder: (context, provider, child) => MaterialApp.router(
          builder: (context, child) => ResponsiveWrapper.builder(
              BouncingScrollWrapper.builder(context, child!),
              maxWidth: 1200,
              minWidth: 450,
              defaultScale: true,
              breakpoints: [
                const ResponsiveBreakpoint.resize(450, name: MOBILE),
                const ResponsiveBreakpoint.autoScale(800, name: TABLET),
                const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
                const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
                const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
              ],
              background: Container(color: const Color(0xFFF5F5F5))),
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          locale: Provider.of<LanguageViewModel>(context).currentLocale,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Mukta'),
          routerConfig: _router,
        ),
      ),
    );
  }
}
