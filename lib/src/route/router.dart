import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gl/src/modules/create/screen.dart';
import 'package:gl/src/modules/details/screen.dart';
import 'package:gl/src/modules/home/model.dart';
import 'package:gl/src/modules/home/screen.dart';
import 'package:gl/src/modules/login/screen.dart';
import 'package:gl/src/modules/register/screen.dart';
part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        CustomRoute(
          page: LoginRoute.page,
          initial: true,
          usesPathAsKey: true,
          path: '/login',
          transitionsBuilder: TransitionsBuilders.noTransition,
        ),
        CustomRoute(
          page: RegisterRoute.page,
          usesPathAsKey: true,
          path: '/register',
          transitionsBuilder: TransitionsBuilders.noTransition,
        ),
        CustomRoute(
          page: HomeRoute.page,
          usesPathAsKey: true,
          path: '/home',
          transitionsBuilder: TransitionsBuilders.noTransition,
        ),
        CustomRoute(
          page: CreateRoute.page,
          usesPathAsKey: true,
          path: '/create',
          transitionsBuilder: TransitionsBuilders.noTransition,
        ),
        CustomRoute(
          page: DetailsRoute.page,
          usesPathAsKey: true,
          path: '/details',
          transitionsBuilder: TransitionsBuilders.noTransition,
        ),
      ];
}
