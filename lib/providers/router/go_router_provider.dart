import 'package:flutter/cupertino.dart';
import 'package:flutter_pjs_boilerplate2/screens/home_screen.dart';
import 'package:flutter_pjs_boilerplate2/screens/splash_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider =
    ChangeNotifierProvider<RouterProvider>((ref) => RouterProvider(ref: ref));

class RouterProvider extends ChangeNotifier {
  final Ref ref;
  int splashCount = 0;

  List<GoRoute> get routes => [
        GoRoute(
          path: '/',
          name: 'home',
          builder: (_, __) => HomeScreen(),
        ),
        GoRoute(
          path: '/splash',
          name: 'splash',
          builder: (_, __) => SplashScreen(),
        ),
      ];

  RouterProvider({required this.ref}) {
    // ref.listen<UserModelBase?>(userMeProvider, (previous, current) {
    //   if (previous != current) {
    //     notifyListeners();
    //   }
    // });
    Future.delayed(
      const Duration(seconds: 3),
      () {
        notifyListeners();
      },
    );
  }

  // redirect check
  Future<String?> redirect(context, GoRouterState state) async {
    print(state.uri.toString());
    if (state.uri.toString() == '/splash') {
      if (this.splashCount == 0) {
        this.splashCount++;
        return null;
      } else {
        this.splashCount = 0;
        return '/';
      }
    }
    return null;
  }
}

final goRouterProvider = Provider<GoRouter>((ref) {
  final provider = ref.read(routerProvider);

  return GoRouter(
    routes: provider.routes,
    initialLocation: '/splash',
    refreshListenable: provider,
    redirect: provider.redirect,
  );
});
