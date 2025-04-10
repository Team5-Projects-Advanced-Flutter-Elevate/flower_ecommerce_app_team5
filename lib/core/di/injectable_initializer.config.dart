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
import '../../modules/home/data/api/api_client/home_api_client.dart' as _i293;
import '../../modules/home/data/api/api_client_provider/home_api_client_provider.dart'
    as _i939;
import '../../modules/home/data/datasource_contract/home_online_data_source.dart'
    as _i274;
import '../../modules/home/data/datasource_impl/home_data_source_impl.dart'
    as _i524;
import '../../modules/home/data/repo_impl/home_repo_impl.dart' as _i1042;
import '../../modules/home/domain/repo_contract/home_repo.dart' as _i1003;
import '../../modules/home/domain/use_cases/get_all_products_use_case.dart'
    as _i1019;
import '../../modules/home/domain/use_cases/get_categories_use_case.dart'
    as _i369;
import '../../modules/home/domain/use_cases/get_occasions_use_case.dart'
    as _i386;
import '../../modules/home/ui/layouts/categories_layout/view_model/categories_layout_view_model.dart'
    as _i44;
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
    final authApiClientProvider = _$AuthApiClientProvider();
    final homeApiClientProvider = _$HomeApiClientProvider();
    final localeInitializer = _$LocaleInitializer();
    await gh.factoryAsync<_i361.Dio>(
      () => dioService.provideDio(),
      preResolve: true,
    );
    await gh.factoryAsync<_i558.FlutterSecureStorage>(
      () => storagesInitializer.initFlutterSecureStorage(),
      preResolve: true,
    );
    gh.singleton<_i343.AuthApiClient>(
        () => authApiClientProvider.provideApiClient(gh<_i361.Dio>()));
    gh.singleton<_i293.HomeApiClient>(
        () => homeApiClientProvider.provideApiClient(gh<_i361.Dio>()));
    gh.factory<_i274.HomeDataSource>(
        () => _i524.HomeDataSourceImpl(gh<_i293.HomeApiClient>()));
    gh.singleton<_i629.SecureStorageService<dynamic>>(
        () => _i701.SecureStorageServiceImp(gh<_i558.FlutterSecureStorage>()));
    gh.factory<_i766.LoginRemoteDataSource>(
        () => _i132.LoginRemoteDataSourceImp(gh<_i343.AuthApiClient>()));
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
    gh.factory<_i147.LoginLocalDataSource>(() => _i916.LoginLocalDataSourceImpl(
        storageService: gh<_i629.SecureStorageService<dynamic>>()));
    gh.factory<_i138.LoginAsGuestOfflineDataSource>(() =>
        _i79.LoginAsGuestOfflineDataSourceImpl(
            gh<_i629.SecureStorageService<dynamic>>()));
    gh.factory<_i496.RegisterRepo>(
        () => _i161.RegisterRepoImpl(gh<_i871.RegisterOnlineDataSource>()));
    gh.factory<_i782.RegisterUseCase>(
        () => _i782.RegisterUseCase(gh<_i496.RegisterRepo>()));
    gh.factory<_i450.LoginRepo>(() => _i639.LoginRepoImp(
          gh<_i766.LoginRemoteDataSource>(),
          gh<_i147.LoginLocalDataSource>(),
        ));
    gh.factory<_i44.CategoriesLayoutViewModel>(
        () => _i44.CategoriesLayoutViewModel(
              gh<_i369.GetCategoriesUseCase>(),
              gh<_i1019.GetAllProductsUseCase>(),
            ));
    gh.factory<_i303.RegisterCubit>(
        () => _i303.RegisterCubit(gh<_i782.RegisterUseCase>()));
    gh.factory<_i926.LoginAsGuestRepo>(() =>
        _i252.LoginAsGuestRepoImpl(gh<_i138.LoginAsGuestOfflineDataSource>()));
    gh.factory<_i421.LoginAsGuest>(
        () => _i421.LoginAsGuest(gh<_i926.LoginAsGuestRepo>()));
    gh.factory<_i543.LoginUseCase>(
        () => _i543.LoginUseCase(gh<_i450.LoginRepo>()));
    gh.factory<_i363.LoginViewModelCubit>(() => _i363.LoginViewModelCubit(
          gh<_i543.LoginUseCase>(),
          gh<_i421.LoginAsGuest>(),
        ));
    return this;
  }
}

class _$DioService extends _i738.DioService {}

class _$StoragesInitializer extends _i241.StoragesInitializer {}

class _$AuthApiClientProvider extends _i1019.AuthApiClientProvider {}

class _$HomeApiClientProvider extends _i939.HomeApiClientProvider {}

class _$LocaleInitializer extends _i631.LocaleInitializer {}
