part of 'router.dart';

GoRoute _homeRoutes() {
  return GoRoute(
    path: AppRoutes.home.routePath,
    builder: (context, state) {
      return RepositoryProvider.value(
        value: serviceLocator.getDetailsService(),
        child: HomeView(),
      );
      // return HomeView();
    },
    routes: <RouteBase>[
      GoRoute(
        path: AppRoutes.myCart.routeSubPath,
        builder: (context, state) {
          return RepositoryProvider.value(
            value: serviceLocator.getDetailsService(),
            child: const MyCartView(),
          );
          // return FavoriteView();
        },
      ),
      GoRoute(
        path: AppRoutes.bookAppointment.routeSubPath,
        builder: (context, state) {
          // Map<String, dynamic> data = state.extra as Map<String, dynamic>;
          return RepositoryProvider.value(
            value: serviceLocator.getDetailsService(),
            child: const BookAppointmentView(),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.success.routeSubPath,
        builder: (context, state) {
          return RepositoryProvider.value(
            value: serviceLocator.getDetailsService(),
            child: const SuccessView(),
          );
          // return HomeView();
        },
      ),
    ],

  );
}
