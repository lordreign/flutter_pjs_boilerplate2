import 'package:flutter/material.dart';
import 'package:flutter_pjs_boilerplate2/providers/router/go_router_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
      child: _App(),
    ),
  );
}

class _App extends ConsumerWidget {
  const _App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);

    return MaterialApp.router(
      theme: ThemeData(
        fontFamily: 'notoSansKr',
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
