import 'package:get/get.dart';
import 'package:grooce/modules/cart/bindings/cart_binding.dart';
import 'package:grooce/modules/cart/views/cart_view.dart';
import 'package:grooce/modules/favorite/bindings/favorite_binding.dart';
import 'package:grooce/modules/favorite/views/favorite_view.dart';
import 'package:grooce/modules/home/bindings/home_binding.dart';
import 'package:grooce/modules/home/views/home_view.dart';
import 'package:grooce/modules/item_detail/bindings/item_detail_binding.dart';
import 'package:grooce/modules/item_detail/views/item_detail_view.dart';
import 'package:grooce/modules/login/bindings/login_binding.dart';
import 'package:grooce/modules/login/views/login_view.dart';
import 'package:grooce/modules/profile/bindings/profile_binding.dart';
import 'package:grooce/modules/profile/views/profile_view.dart';
import 'package:grooce/modules/sign_up/bindings/sign_up_binding.dart';
import 'package:grooce/modules/sign_up/views/sign_up_view.dart';
import 'package:grooce/modules/splash/bindings/splash_binding.dart';
import 'package:grooce/modules/splash/views/splash_view.dart';
import 'package:grooce/modules/tabs/bindings/tabs_binding.dart';
import 'package:grooce/routes/app_routes.dart';
import '../modules/on_board/bindings/on_board_binding.dart';
import '../modules/on_board/views/on_board_view.dart';
import '../modules/all_products/bindings/all_products_binding.dart';
import '../modules/all_products/views/all_products_view.dart';
import '../modules/tabs/views/tabs_view.dart';

class AppPages {
  static List<GetPage<dynamic>> getPages() => [
        GetPage(
          name: AppRoutes.splash,
          page: () => const SplashView(),
          binding: SplashBinding(),
        ),
    GetPage(
          name: AppRoutes.onBoard,
          page: () => const OnBoardView(),
          binding: OnBoardBinding(),
        ),
        GetPage(
          name: AppRoutes.login,
          page: () => const LoginView(),
          binding: LoginBinding(),
        ),
        GetPage(
          name: AppRoutes.signUp,
          page: () => const SignUpView(),
          binding: SignUpBinding(),
        ),
        GetPage(
          name: AppRoutes.tabs,
          page: () => const TabsView(),
          binding: TabsBinding(),
        ),
        GetPage(
          name: AppRoutes.home,
          page: () => const HomeView(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: AppRoutes.itemDetail,
          page: () => const ItemDetailsView(),
          binding: ItemDetailsBinding(),
        ),
        GetPage(
          name: AppRoutes.cart,
          page: () => const CartView(),
          binding: CartBinding(),
        ),
        GetPage(
          name: AppRoutes.favorite,
          page: () => const FavoriteView(),
          binding: FavoriteBinding(),
        ),
        GetPage(
          name: AppRoutes.profile,
          page: () => const ProfileView(),
          binding: ProfileBinding(),
        ),
        GetPage(
          name: AppRoutes.allProducts,
          page: () => const AllProductsView(),
          binding: AllProductsBinding(),
        ),
      ];
}
