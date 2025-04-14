// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../modules/authentication/data/api/api_client/auth_api_client.dart'
    as _i343;
import '../../modules/authentication/data/api/api_client_provider/auth_api_client_provider.dart'
    as _i1019;
import '../../modules/authentication/data/data_sources_contracts/login/login_local_data_source.dart'
    as _i147;
import '../../modules/authentication/data/data_sources_contracts/login/login_remote_data_source.dart'
    as _i766;
import '../../modules/authentication/data/data_sources_contracts/login_as_guest/login_as_guest_data_source.dart'
    as _i138;
import '../../modules/authentication/data/data_sources_contracts/register/register_online_datasource_contract.dart'
    as _i871;
import '../../modules/authentication/data/data_sources_imp/login/login_local_data_source_imp.dart'
    as _i916;
import '../../modules/authentication/data/data_sources_imp/login/login_remote_data_source_imp.dart'
    as _i132;
import '../../modules/authentication/data/data_sources_imp/login_as_guest/login_as_guest_data_source_impl.dart'
    as _i79;
import '../../modules/authentication/data/data_sources_imp/register/register_online_datasource_impl.dart'
    as _i219;
import '../../modules/authentication/data/respositoies_imp/login/login_repo_imp.dart'
    as _i639;
import '../../modules/authentication/data/respositoies_imp/login_as_guest/login_as_guest_repo_impl.dart'
    as _i252;
import '../../modules/authentication/data/respositoies_imp/register/register_repo_impl.dart'
    as _i161;
import '../../modules/authentication/domain/repositories_contracts/login/login_repo.dart'
    as _i450;
import '../../modules/authentication/domain/repositories_contracts/login_as_guest/login_as_guest_repo.dart'
    as _i926;
import '../../modules/authentication/domain/repositories_contracts/register/register_repo.dart'
    as _i496;
import '../../modules/authentication/domain/use_cases/login/login_use_case.dart'
    as _i543;
import '../../modules/authentication/domain/use_cases/login_as_guest/login_as_gust_use_case.dart'
    as _i421;
import '../../modules/authentication/domain/use_cases/register/register_use_case.dart'
    as _i782;
import '../../modules/authentication/ui/login/view_model/login_view_model_cubit.dart'
    as _i363;
import '../../modules/authentication/ui/register/view_model/register_cubit.dart'
    as _i303;
import '../../modules/best_seller/data/api/api_client/best_seller_api_client.dart'
    as _i41;
import '../../modules/best_seller/data/api/api_client_provider/best_seller_client_provider.dart'
    as _i664;
import '../../modules/best_seller/data/data_sources_contract/best_seller/best_seller_remote_data_source.dart'
    as _i23;
import '../../modules/best_seller/data/data_sources_imp/best_seller/best_seller_remote_data_source_imp.dart'
    as _i393;
import '../../modules/best_seller/data/respositories_imp/best_seller/best_seller_repositories_imp.dart'
    as _i911;
import '../../modules/best_seller/domain/repositories_contracts/best_seller/best_seller_repository.dart'
    as _i76;
import '../../modules/best_seller/domain/use_cases/best_seller/get_best_seller_products_use_case.dart'
    as _i502;
import '../../modules/best_seller/ui/view_model/best_seller_view_model.dart'
    as _i460;
import '../../modules/home/data/api/api_client/home_api_client.dart' as _i293;
import '../../modules/home/data/api/api_client/profile_api_client.dart'
    as _i486;
import '../../modules/home/data/api/api_client_provider/home_api_client_provider.dart'
    as _i939;
import '../../modules/home/data/api/api_client_provider/profile_api_client_provider.dart'
    as _i911;
import '../../modules/home/data/datasource_contract/home_online_data_source.dart'
    as _i274;
import '../../modules/home/data/datasource_contract/profile_online_data_source.dart'
    as _i896;
import '../../modules/home/data/datasource_impl/home_data_source_impl.dart'
    as _i524;
import '../../modules/home/data/datasource_impl/profile_data_source_impl.dart'
    as _i846;
import '../../modules/home/data/repo_impl/home_repo_impl.dart' as _i1042;
import '../../modules/home/data/repo_impl/profile_repo_impl.dart' as _i182;
import '../../modules/home/domain/repo_contract/home_repo.dart' as _i1003;
import '../../modules/home/domain/repo_contract/profile_repo.dart' as _i329;
import '../../modules/home/domain/use_cases/change_password_use_case.dart'
    as _i1029;
import '../../modules/home/domain/use_cases/edite_profile_image_use_case.dart'
    as _i208;
import '../../modules/home/domain/use_cases/edite_profile_use_case.dart'
    as _i411;
import '../../modules/home/domain/use_cases/get_all_products_use_case.dart'
    as _i1019;
import '../../modules/home/domain/use_cases/get_categories_use_case.dart'
    as _i369;
import '../../modules/home/domain/use_cases/get_home_data_use_case.dart'
    as _i90;
import '../../modules/home/domain/use_cases/get_occasions_use_case.dart'
    as _i386;
import '../../modules/home/ui/layouts/categories_layout/view_model/categories_layout_view_model.dart'
    as _i44;
import '../../modules/home/ui/layouts/home_layout/view_model/home_cubit.dart'
    as _i692;
import '../../modules/home/ui/layouts/profile_layout/view_model/profile_layout_view_model.dart'
    as _i901;
import '../../modules/occasion/data/api/api_client/api_client.dart' as _i941;
import '../../modules/occasion/data/api/api_client_provider/occasion_api_client_provider.dart'
    as _i507;
import '../../modules/occasion/data/data_sources_contracts/occasion_data_source.dart'
    as _i362;
import '../../modules/occasion/data/data_sources_imp/occasion_datasourceimpl.dart'
    as _i713;
import '../../modules/occasion/data/repositories_imp/occasion_repo_imp.dart'
    as _i276;
import '../../modules/occasion/domain/repositories_contracts/ocassion_repo.dart'
    as _i319;
import '../../modules/occasion/domain/use_cases/occasion_usecase.dart' as _i41;
import '../../modules/occasion/ui/occasion_cubit.dart' as _i855;
import '../../shared_layers/localization/initializer/locale_initializer.dart'
    as _i631;
import '../../shared_layers/localization/l10n_manager/localization_manager.dart'
    as _i273;
import '../../shared_layers/storage/contracts/flutter_secure_storage_service_contract.dart'
    as _i629;
import '../../shared_layers/storage/implementation/flutter_secure_storage_service_imp.dart'
    as _i701;
import '../../shared_layers/storage/initializer/storage_initializer.dart'
    as _i241;
import '../utilities/dio/dio_service/dio_service.dart' as _i738;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioService = _$DioService();
    final storagesInitializer = _$StoragesInitializer();
    final bestSellerClientProvider = _$BestSellerClientProvider();
    final authApiClientProvider = _$AuthApiClientProvider();
    final homeApiClientProvider = _$HomeApiClientProvider();
    final profileApiClientProvider = _$ProfileApiClientProvider();
    final occasionApiClientProvider = _$OccasionApiClientProvider();
    final localeInitializer = _$LocaleInitializer();
    await gh.factoryAsync<_i361.Dio>(
      () => dioService.provideDio(),
      preResolve: true,
    );
    gh.factory<_i901.ProfileViewModelCubit>(
        () => _i901.ProfileViewModelCubit());
    await gh.factoryAsync<_i558.FlutterSecureStorage>(
      () => storagesInitializer.initFlutterSecureStorage(),
      preResolve: true,
    );
    gh.lazySingleton<_i41.BestSellerApiClient>(
        () => bestSellerClientProvider.providerApiClient(gh<_i361.Dio>()));
    gh.singleton<_i343.AuthApiClient>(
        () => authApiClientProvider.provideApiClient(gh<_i361.Dio>()));
    gh.singleton<_i293.HomeApiClient>(
        () => homeApiClientProvider.provideApiClient(gh<_i361.Dio>()));
    gh.singleton<_i486.ProfileApiClient>(
        () => profileApiClientProvider.ApiClient(gh<_i361.Dio>()));
    gh.singleton<_i941.OccasionApiClient>(
        () => occasionApiClientProvider.ApiClient(gh<_i361.Dio>()));
    gh.factory<_i274.HomeDataSource>(
        () => _i524.HomeDataSourceImpl(gh<_i293.HomeApiClient>()));
    gh.singleton<_i629.SecureStorageService<dynamic>>(
        () => _i701.SecureStorageServiceImp(gh<_i558.FlutterSecureStorage>()));
    gh.factory<_i766.LoginRemoteDataSource>(
        () => _i132.LoginRemoteDataSourceImp(gh<_i343.AuthApiClient>()));
    gh.factory<_i362.OccasionOnlineDataSource>(() =>
        _i713.OccasionOnlineDataSourceImpl(gh<_i941.OccasionApiClient>()));
    await gh.factoryAsync<String>(
      () => localeInitializer
          .initCurrentLocal(gh<_i629.SecureStorageService<dynamic>>()),
      instanceName: 'initCurrentLocal',
      preResolve: true,
    );
    gh.singleton<_i273.LocalizationManager>(() => _i273.LocalizationManager(
          gh<_i629.SecureStorageService<dynamic>>(),
          gh<String>(instanceName: 'initCurrentLocal'),
        ));
    gh.factory<_i23.BestSellerRemoteDataSource>(() =>
        _i393.BestSellerRemoteDataSourceImp(gh<_i41.BestSellerApiClient>()));
    gh.factory<_i896.ProfileOnlineDataSource>(
        () => _i846.ProfileOnlineDataSourceImpl(gh<_i486.ProfileApiClient>()));
    gh.factory<_i319.OccasionRepo>(
        () => _i276.OccasionRepoImpl(gh<_i362.OccasionOnlineDataSource>()));
    gh.factory<_i1003.HomeRepo>(
        () => _i1042.HomeRepoImpl(gh<_i274.HomeDataSource>()));
    gh.factory<_i871.RegisterOnlineDataSource>(
        () => _i219.RegisterOnlineDataSourceImpl(gh<_i343.AuthApiClient>()));
    gh.factory<_i1019.GetAllProductsUseCase>(
        () => _i1019.GetAllProductsUseCase(gh<_i1003.HomeRepo>()));
    gh.factory<_i369.GetCategoriesUseCase>(
        () => _i369.GetCategoriesUseCase(gh<_i1003.HomeRepo>()));
    gh.factory<_i386.GetOccasionsUseCase>(
        () => _i386.GetOccasionsUseCase(gh<_i1003.HomeRepo>()));
    gh.factory<_i329.ProfileRepo>(
        () => _i182.ProfileRepoImpl(gh<_i896.ProfileOnlineDataSource>()));
    gh.factory<_i90.GetHomeDataUseCase>(
        () => _i90.GetHomeDataUseCase(gh<_i1003.HomeRepo>()));
    gh.factory<_i147.LoginLocalDataSource>(() => _i916.LoginLocalDataSourceImpl(
        storageService: gh<_i629.SecureStorageService<dynamic>>()));
    gh.factory<_i41.OccasionUseCase>(
        () => _i41.OccasionUseCase(gh<_i319.OccasionRepo>()));
    gh.factory<_i138.LoginAsGuestOfflineDataSource>(() =>
        _i79.LoginAsGuestOfflineDataSourceImpl(
            gh<_i629.SecureStorageService<dynamic>>()));
    gh.factory<_i855.OcassionViewModelCubit>(
        () => _i855.OcassionViewModelCubit(gh<_i41.OccasionUseCase>()));
    gh.factory<_i76.BestSellerRepository>(() =>
        _i911.BestSellerRepositoryImp(gh<_i23.BestSellerRemoteDataSource>()));
    gh.factory<_i411.EditeProfileUseCase>(
        () => _i411.EditeProfileUseCase(gh<_i329.ProfileRepo>()));
    gh.factory<_i208.EditeProfileImageUseCase>(
        () => _i208.EditeProfileImageUseCase(gh<_i329.ProfileRepo>()));
    gh.factory<_i1029.ChangePasswordUseCase>(
        () => _i1029.ChangePasswordUseCase(gh<_i329.ProfileRepo>()));
    gh.factory<_i496.RegisterRepo>(
        () => _i161.RegisterRepoImpl(gh<_i871.RegisterOnlineDataSource>()));
    gh.factory<_i782.RegisterUseCase>(
        () => _i782.RegisterUseCase(gh<_i496.RegisterRepo>()));
    gh.factory<_i450.LoginRepo>(() => _i639.LoginRepoImp(
          gh<_i766.LoginRemoteDataSource>(),
          gh<_i147.LoginLocalDataSource>(),
        ));
    gh.factory<_i502.GetBestSellerProductsUseCase>(() =>
        _i502.GetBestSellerProductsUseCase(gh<_i76.BestSellerRepository>()));
    gh.factory<_i692.HomeCubit>(
        () => _i692.HomeCubit(gh<_i90.GetHomeDataUseCase>()));
    gh.factory<_i460.BestSellerViewModel>(() =>
        _i460.BestSellerViewModel(gh<_i502.GetBestSellerProductsUseCase>()));
    gh.factory<_i44.CategoriesLayoutViewModel>(
        () => _i44.CategoriesLayoutViewModel(
              gh<_i369.GetCategoriesUseCase>(),
              gh<_i1019.GetAllProductsUseCase>(),
            ));
    gh.factory<_i303.RegisterCubit>(
        () => _i303.RegisterCubit(gh<_i782.RegisterUseCase>()));
    gh.factory<_i926.LoginAsGuestRepo>(() =>
        _i252.LoginAsGuestRepoImpl(gh<_i138.LoginAsGuestOfflineDataSource>()));
    gh.factory<_i421.LoginAsGuestUseCase>(
        () => _i421.LoginAsGuestUseCase(gh<_i926.LoginAsGuestRepo>()));
    gh.factory<_i543.LoginUseCase>(
        () => _i543.LoginUseCase(gh<_i450.LoginRepo>()));
    gh.factory<_i363.LoginViewModelCubit>(() => _i363.LoginViewModelCubit(
          gh<_i543.LoginUseCase>(),
          gh<_i421.LoginAsGuestUseCase>(),
        ));
    return this;
  }
}

class _$DioService extends _i738.DioService {}

class _$StoragesInitializer extends _i241.StoragesInitializer {}

class _$BestSellerClientProvider extends _i664.BestSellerClientProvider {}

class _$AuthApiClientProvider extends _i1019.AuthApiClientProvider {}

class _$HomeApiClientProvider extends _i939.HomeApiClientProvider {}

class _$ProfileApiClientProvider extends _i911.ProfileApiClientProvider {}

class _$OccasionApiClientProvider extends _i507.OccasionApiClientProvider {}

class _$LocaleInitializer extends _i631.LocaleInitializer {}
