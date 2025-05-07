part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const SPLASH = _Paths.SPLASH;
  static const HOME = _Paths.HOME;
  static const SHADOWS = _Paths.SHADOWS;
  static const SHADOW_DETAIL = _Paths.SHADOW_DETAIL;
  static const HUNTERS = _Paths.HUNTERS;
  static const HUNTER_DETAIL = _Paths.HUNTER_DETAIL;
  static const MONARCHS = _Paths.MONARCHS;
  static const MONARCH_DETAIL = _Paths.MONARCH_DETAIL;
}

abstract class _Paths {
  _Paths._();
  static const SPLASH = '/splash';
  static const HOME = '/home';
  static const SHADOWS = '/shadows';
  static const SHADOW_DETAIL = '/shadow-detail';
  static const HUNTERS = '/hunters';
  static const HUNTER_DETAIL = '/hunter-detail';
  static const MONARCHS = '/monarchs';
  static const MONARCH_DETAIL = '/monarch-detail';
}
