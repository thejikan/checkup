import 'package:checkup/router/routesHelperClass.dart';

class AppRoutes {
  static const home = RoutesBase(
    name: "home",
    routePath: "/home",
    routeSubPath: "home",
  );
  static const myCart = RoutesBase(
    name: "myCart",
    routePath: '/home/myCart',
    routeSubPath: "myCart",
  );
  static const bookAppointment = RoutesBase(
    name: "bookAppointment",
    routePath: '/home/bookAppointment',
    routeSubPath: "bookAppointment",
  );
  static const success = RoutesBase(
    name: "success",
    routePath: '/home/success',
    routeSubPath: "success",
  );

}
