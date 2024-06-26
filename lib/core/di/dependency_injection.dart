import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:galaxyxgate/core/logic/local_cubit/local_cubit.dart';
import 'package:galaxyxgate/core/networking/dio_helper.dart';
import 'package:galaxyxgate/features/about_company/data/services/about_company_services.dart';
import 'package:galaxyxgate/features/about_company/logic/cubit/about_company_cubit.dart';
import 'package:galaxyxgate/features/auth/data/services/auth_services.dart';
import 'package:galaxyxgate/features/auth/logic/sign_in_cubit/sign_in_cubit.dart';
import 'package:galaxyxgate/features/auth/logic/sign_up_cubit/sign_up_cubit.dart';
import 'package:galaxyxgate/features/community_posts/data/services/community_posts_services.dart';
import 'package:galaxyxgate/features/community_posts/logic/community_posts/community_posts_cubit.dart';
import 'package:galaxyxgate/features/community_posts/logic/posts_comments/posts_comments_cubit.dart';
import 'package:galaxyxgate/features/favourits/data/service.dart/favorite_services.dart';
import 'package:galaxyxgate/features/favourits/logic/cubit/favourite_cubit.dart';
import 'package:galaxyxgate/features/launches/data/services/launches_services.dart';
import 'package:galaxyxgate/features/launches/logic/cubit/launches_cubit.dart';
import 'package:galaxyxgate/features/profile/logic/profile_cubit.dart';
import 'package:galaxyxgate/features/rockets/logic/rockets_cubit.dart';
import 'package:galaxyxgate/features/rockets/data/services/rockets_services.dart';
import 'package:galaxyxgate/features/ships/logic/cubit/ships_cubit.dart';
import '../../features/crew/logic/cubit/crews_cubit.dart';
import '../../features/crew/data/services/crews_services.dart';
import '../../features/ships/data/repository/ships_repository.dart';
import '../../features/ships/data/services/ships_services.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;
bool _isServiceLocatorInitialized = false;

void setUpServiceLocator() {
  if (!_isServiceLocatorInitialized) {
    getIt.registerSingleton<DioHelper>(DioHelper());

    getIt.registerSingleton<FlutterSecureStorage>(
      const FlutterSecureStorage(),
    );
    // auth
    getIt.registerSingleton<AuthServices>(
      AuthServices(),
    );

    getIt.registerSingleton<SignInCubit>(
      SignInCubit(
        authServices: getIt<AuthServices>(),
      ),
    );
    getIt.registerSingleton<SignUpCubit>(
      SignUpCubit(
        authServices: getIt<AuthServices>(),
      ),
    );

    // Launches
    getIt.registerSingleton<LaunchesServices>(
      LaunchesServices(
        dioHelper: getIt<DioHelper>(),
      ),
    );

    getIt.registerSingleton<LaunchesCubit>(
      LaunchesCubit(
        launchesServices: getIt<LaunchesServices>(),
      ),
    );
    // AboutCompany
    getIt.registerSingleton<AboutCompanyServices>(
      AboutCompanyServices(
        dioHelper: getIt<DioHelper>(),
      ),
    );

    getIt.registerSingleton<AboutCompanyCubit>(
      AboutCompanyCubit(
        aboutCompanyServices: getIt<AboutCompanyServices>(),
      ),
    );
    // Profile
    getIt.registerSingleton<ProfileCubit>(
      ProfileCubit(
        authServices: getIt<AuthServices>(),
      ),
    );
    // Crew
    getIt.registerSingleton<CrewService>(
      CrewService(dioHelper: getIt()),
    );

    getIt.registerSingleton<CrewsCubit>(
      CrewsCubit(crewService: getIt()),
    );
    // Ships
    getIt.registerSingleton<ShipsService>(
      ShipsServiceImp(dioHelper: getIt()),
    );

    getIt.registerSingleton<ShipsRepository>(
      ShipsRepository(shipsService: getIt()),
    );

    getIt.registerSingleton<ShipsCubit>(
      ShipsCubit(shipsRepository: getIt()),
    );
    // Favs
    getIt.registerSingleton<FavoriteServices>(
      FavoriteServices(),
    );

    getIt.registerSingleton<FavoriteCubit>(
      FavoriteCubit(favoriteServices: getIt()),
    );
    // Rockets
    getIt.registerSingleton<RocketsService>(
      RocketsService(
        dioHelper: getIt<DioHelper>(),
      ),
    );

    getIt.registerSingleton<RocketsCubit>(
      RocketsCubit(rocketsService: getIt<RocketsService>()),
    );
    // CommunityPosts
    getIt.registerSingleton<CommunityPostsService>(
      CommunityPostsService(),
    );

    getIt.registerSingleton<CommunityPostsCubit>(
      CommunityPostsCubit(
          communityPostsService: getIt<CommunityPostsService>()),
    );

    // PostsComments

    getIt.registerSingleton<PostsCommentsCubit>(
      PostsCommentsCubit(communityPostsService: getIt<CommunityPostsService>()),
    );
    // Localization
    getIt.registerSingleton<LocalCubit>(
      LocalCubit(),
    );

    _isServiceLocatorInitialized = true;
  }
}
