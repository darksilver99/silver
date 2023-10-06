import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  bool showSplashImage = true;

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) => NavBarPage(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => NavBarPage(),
        ),
        FFRoute(
          name: 'HomePage',
          path: '/homePage',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'HomePage')
              : HomePageWidget(),
        ),
        FFRoute(
          name: 'AboutPage',
          path: '/aboutPage',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'AboutPage')
              : AboutPageWidget(),
        ),
        FFRoute(
          name: 'ProfilePage',
          path: '/profilePage',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'ProfilePage')
              : ProfilePageWidget(),
        ),
        FFRoute(
          name: 'TestPage',
          path: '/testPage',
          builder: (context, params) => TestPageWidget(),
        ),
        FFRoute(
          name: 'GoTripDetailPage',
          path: '/goTripDetailPage',
          builder: (context, params) => GoTripDetailPageWidget(),
        ),
        FFRoute(
          name: 'GoTripSelectPlacePage',
          path: '/goTripSelectPlacePage',
          builder: (context, params) => GoTripSelectPlacePageWidget(),
        ),
        FFRoute(
          name: 'GoTripCreatePage',
          path: '/goTripCreatePage',
          builder: (context, params) => GoTripCreatePageWidget(),
        ),
        FFRoute(
          name: 'GoTripProfilePage',
          path: '/goTripProfilePage',
          builder: (context, params) => GoTripProfilePageWidget(),
        ),
        FFRoute(
          name: 'CreateTripDrawerView',
          path: '/createTripDrawerView',
          builder: (context, params) => CreateTripDrawerViewWidget(),
        ),
        FFRoute(
          name: 'AddExpensePage',
          path: '/addExpensePage',
          builder: (context, params) => AddExpensePageWidget(),
        ),
        FFRoute(
          name: 'ManualUploadPage',
          path: '/manualUploadPage',
          builder: (context, params) => ManualUploadPageWidget(),
        ),
        FFRoute(
          name: 'AddFromBookingPage',
          path: '/addFromBookingPage',
          builder: (context, params) => AddFromBookingPageWidget(),
        ),
        FFRoute(
          name: 'GoTripMapPickerPage',
          path: '/goTripMapPickerPage',
          builder: (context, params) => GoTripMapPickerPageWidget(),
        ),
        FFRoute(
          name: 'GoTripDetailPageCopy',
          path: '/goTripDetailPageCopy',
          builder: (context, params) => GoTripDetailPageCopyWidget(),
        ),
        FFRoute(
          name: 'Test2Page',
          path: '/test2Page',
          builder: (context, params) => Test2PageWidget(),
        ),
        FFRoute(
          name: 'Test3Page',
          path: '/test3Page',
          builder: (context, params) => Test3PageWidget(),
        ),
        FFRoute(
          name: 'Test4Page',
          path: '/test4Page',
          builder: (context, params) => Test4PageWidget(),
        ),
        FFRoute(
          name: 'Test5Page',
          path: '/test5Page',
          builder: (context, params) => Test5PageWidget(),
        ),
        FFRoute(
          name: 'Test6Page',
          path: '/test6Page',
          builder: (context, params) => Test6PageWidget(),
        ),
        FFRoute(
          name: 'Test7Page',
          path: '/test7Page',
          builder: (context, params) => Test7PageWidget(),
        ),
        FFRoute(
          name: 'Test8Page',
          path: '/test8Page',
          builder: (context, params) => Test8PageWidget(),
        ),
        FFRoute(
          name: 'Test9Page',
          path: '/test9Page',
          builder: (context, params) => Test9PageWidget(),
        ),
        FFRoute(
          name: 'BookingPage',
          path: '/bookingPage',
          builder: (context, params) => BookingPageWidget(),
        ),
        FFRoute(
          name: 'GoTripListPickerPage',
          path: '/goTripListPickerPage',
          builder: (context, params) => GoTripListPickerPageWidget(),
        ),
        FFRoute(
          name: 'BookingHotelPreviewPage',
          path: '/bookingHotelPreviewPage',
          builder: (context, params) => BookingHotelPreviewPageWidget(),
        ),
        FFRoute(
          name: 'TestHotelPage',
          path: '/testHotelPage',
          builder: (context, params) => TestHotelPageWidget(),
        ),
        FFRoute(
          name: 'AddPostPage',
          path: '/addPostPage',
          builder: (context, params) => AddPostPageWidget(),
        ),
        FFRoute(
          name: 'FriendListView',
          path: '/friendListView',
          builder: (context, params) => FriendListViewWidget(),
        ),
        FFRoute(
          name: 'DetailTestPage',
          path: '/detailTestPage',
          asyncParams: {
            'dataParameter':
                getDoc(['test_photo_list'], TestPhotoListRecord.fromSnapshot),
          },
          builder: (context, params) => DetailTestPageWidget(
            dataParameter: params.getParam('dataParameter', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'TestWidget',
          path: '/testWidget',
          builder: (context, params) => TestWidgetWidget(),
        ),
        FFRoute(
          name: 'PlaceList',
          path: '/placeList',
          builder: (context, params) => PlaceListWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(param, type, isList,
        collectionNamePath: collectionNamePath);
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouter.of(context).location;
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}
