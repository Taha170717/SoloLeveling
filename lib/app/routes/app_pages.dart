import 'package:get/get.dart';
import 'package:shadow_monarch/app/modules/splash/bindings/splash_binding.dart';
import 'package:shadow_monarch/app/modules/splash/views/splash_view.dart';
import 'package:shadow_monarch/app/modules/home/bindings/home_binding.dart';
import 'package:shadow_monarch/app/modules/home/views/home_view.dart';
import 'package:shadow_monarch/app/modules/shadows/bindings/shadows_binding.dart';
import 'package:shadow_monarch/app/modules/shadows/views/shadows_view.dart';
import 'package:shadow_monarch/app/modules/hunters/bindings/hunters_binding.dart';
import 'package:shadow_monarch/app/modules/hunters/views/hunters_view.dart';
import 'package:shadow_monarch/app/modules/monarchs/bindings/monarchs_binding.dart';
import 'package:shadow_monarch/app/modules/monarchs/views/monarchs_view.dart';
import 'package:shadow_monarch/app/modules/shadow_detail/bindings/shadow_detail_binding.dart';
import 'package:shadow_monarch/app/modules/shadow_detail/views/shadow_detail_view.dart';
import 'package:shadow_monarch/app/modules/hunter_detail/bindings/hunter_detail_binding.dart';
import 'package:shadow_monarch/app/modules/hunter_detail/views/hunter_detail_view.dart';
import 'package:shadow_monarch/app/modules/monarch_detail/bindings/monarch_detail_binding.dart';
import 'package:shadow_monarch/app/modules/monarch_detail/views/monarch_detail_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SHADOWS,
      page: () => const ShadowsView(),
      binding: ShadowsBinding(),
    ),
    GetPage(
      name: _Paths.SHADOW_DETAIL,
      page: () => const ShadowDetailView(),
      binding: ShadowDetailBinding(),
    ),
    GetPage(
      name: _Paths.HUNTERS,
      page: () => const HuntersView(),
      binding: HuntersBinding(),
    ),
    GetPage(
      name: _Paths.HUNTER_DETAIL,
      page: () => const HunterDetailView(),
      binding: HunterDetailBinding(),
    ),
    GetPage(
      name: _Paths.MONARCHS,
      page: () => const MonarchsView(),
      binding: MonarchsBinding(),
    ),
    GetPage(
      name: _Paths.MONARCH_DETAIL,
      page: () => const MonarchDetailView(),
      binding: MonarchDetailBinding(),
    ),
  ];
}
