import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/application/auth_controller.dart';
import '../../features/auth/application/auth_state.dart';
import '../../features/auth/presentation/pages/forgot_password_page.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/signup_page.dart';
import '../../features/dashboard/presentation/pages/dashboard_entry_page.dart';
import '../../features/expenses/presentation/pages/expense_categories_page.dart';
import '../../features/expenses/presentation/pages/expense_create_page.dart';
import '../../features/expenses/presentation/pages/expense_page.dart';
import '../../features/sales/presentation/pages/sales_cart_page.dart';
import '../../features/sales/presentation/pages/sales_page.dart';
import '../../features/stores/presentation/pages/store_selector_page.dart';
import '../../features/users/presentation/pages/user_management_page.dart';
import 'app_routes.dart';

final appNavigatorKeyProvider = Provider<GlobalKey<NavigatorState>>(
  (ref) => GlobalKey<NavigatorState>(),
);

final _routerNotifierProvider = Provider<RouterNotifier>((ref) {
  final notifier = RouterNotifier(ref);
  ref.onDispose(notifier.dispose);
  return notifier;
});

final appRouterProvider = Provider<GoRouter>((ref) {
  final navigatorKey = ref.watch(appNavigatorKeyProvider);
  final routerNotifier = ref.watch(_routerNotifierProvider);

  return GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: AppRoutes.login,
    refreshListenable: routerNotifier,
    routes: [
      GoRoute(
        path: AppRoutes.login,
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: AppRoutes.signup,
        name: 'signup',
        builder: (context, state) => const SignupPage(),
      ),
      GoRoute(
        path: AppRoutes.forgotPassword,
        name: 'forgot-password',
        builder: (context, state) => const ForgotPasswordPage(),
      ),
      GoRoute(
        path: AppRoutes.dashboard,
        name: 'dashboard',
        builder: (context, state) => const DashboardEntryPage(),
      ),
      GoRoute(
        path: AppRoutes.expenses,
        name: 'expenses',
        builder: (context, state) => const ExpensePage(),
      ),
      GoRoute(
        path: '${AppRoutes.expenseCreate}/:category',
        name: 'expense-create',
        builder: (context, state) => ExpenseCreatePage(
          categoryName: Uri.decodeComponent(
            state.pathParameters['category'] ?? '',
          ),
        ),
      ),
      GoRoute(
        path: AppRoutes.expenseCategories,
        name: 'expense-categories',
        builder: (context, state) => const ExpenseCategoriesPage(),
      ),
      GoRoute(
        path: AppRoutes.sales,
        name: 'sales',
        builder: (context, state) => const SalesPage(),
      ),
      GoRoute(
        path: AppRoutes.salesCart,
        name: 'sales-cart',
        builder: (context, state) => const SalesCartPage(),
      ),
      GoRoute(
        path: AppRoutes.storeSelector,
        name: 'stores',
        builder: (context, state) => const StoreSelectorPage(),
      ),
      GoRoute(
        path: AppRoutes.users,
        name: 'users',
        builder: (context, state) => const UserManagementPage(),
      ),
    ],
    redirect: routerNotifier.redirect,
  );
});

class RouterNotifier extends ChangeNotifier {
  RouterNotifier(this.ref) {
    _subscription = ref.listen<AuthState>(
      authControllerProvider,
      (_, __) => notifyListeners(),
    );
  }

  final Ref ref;
  late final ProviderSubscription<AuthState> _subscription;

  String? redirect(BuildContext context, GoRouterState state) {
    final authState = ref.read(authControllerProvider);
    final location = state.matchedLocation;
    final isLoggingIn = location == AppRoutes.login;
    final isSigningUp = location == AppRoutes.signup;
    final isForgotPassword = location == AppRoutes.forgotPassword;
    final isAuthPage = isLoggingIn || isSigningUp || isForgotPassword;

    if (!authState.isAuthenticated && !isAuthPage) {
      return AppRoutes.login;
    }

    if (authState.isAuthenticated && isAuthPage) {
      return AppRoutes.dashboard;
    }

    return null;
  }

  @override
  void dispose() {
    _subscription.close();
    super.dispose();
  }
}
