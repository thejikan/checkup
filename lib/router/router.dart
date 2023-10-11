import 'package:checkup/features/bookAppointment/bookAppointment.dart';
import 'package:checkup/features/home/home.dart';
import 'package:checkup/features/myCart/myCart.dart';
import 'package:checkup/features/service/serviceLocator.dart';
import 'package:checkup/features/success.dart';
import 'package:checkup/main.dart';
import 'package:checkup/router/appRoutesEnum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

part 'appRoutes.dart';

typedef PopViewCallback = void Function(bool result);

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: "/",
      builder: (BuildContext context, GoRouterState state) {
        return const MyHomePage(title: 'Flutter Demo Home Page');
      },
      redirect: (BuildContext context, GoRouterState state) async {
        // return AppRoutes.success.routePath;
        // return AppRoutes.bookAppointment.routePath;
        // return AppRoutes.myCart.routePath;
        return AppRoutes.home.routePath;
      },
    ),

    _homeRoutes(),

  ],
);