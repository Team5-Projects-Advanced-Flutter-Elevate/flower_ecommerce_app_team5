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
import '../../modules/authentication/data/data_sources_contracts/forget_password/forget_password_remote_data_source.dart'
    as _i150;
import '../../modules/authentication/data/data_sources_contracts/forget_password/reset_code_remote_data_source.dart'
    as _i779;
import '../../modules/authentication/data/data_sources_contracts/forget_password/reset_password_remote_data_source.dart'
    as _i881;
import '../../modules/authentication/data/data_sources_contracts/login/login_local_data_source.dart'
    as _i147;
import '../../modules/authentication/data/data_sources_contracts/login/login_remote_data_source.dart'
    as _i766;
import '../../modules/authentication/data/data_sources_contracts/login_as_guest/login_as_guest_data_source.dart'
    as _i138;
import '../../modules/authentication/data/data_sources_contracts/register/register_online_datasource_contract.dart'
    as _i871;
import '../../modules/authentication/data/data_sources_imp/forget_password/forget_password_remote_data_source_imp.dart'
    as _i191;
import '../../modules/authentication/data/data_sources_imp/forget_password/reset_code_remote_data_source_impl.dart'
    as _i808;
import '../../modules/authentication/data/data_sources_imp/forget_password/reset_password_remote_data_source_impl.dart'
    as _i956;
import '../../modules/authentication/data/data_sources_imp/login/login_local_data_source_imp.dart'
    as _i916;
import '../../modules/authentication/data/data_sources_imp/login/login_remote_data_source_imp.dart'
    as _i132;
import '../../modules/authentication/data/data_sources_imp/login_as_guest/login_as_guest_data_source_impl.dart'
    as _i79;
import '../../modules/authentication/data/data_sources_imp/register/register_online_datasource_impl.dart'
    as _i219;
import '../../modules/authentication/data/respositoies_imp/forget_password/forget_password_repo_imp.dart'
    as _i811;
import '../../modules/authentication/data/respositoies_imp/forget_password/reset_code_repo_impl.dart'
    as _i196;
import '../../modules/authentication/data/respositoies_imp/forget_password/reset_password_repo_impl.dart'
    as _i940;
import '../../modules/authentication/data/respositoies_imp/login/login_repo_imp.dart'
    as _i639;
import '../../modules/authentication/data/respositoies_imp/login_as_guest/login_as_guest_repo_impl.dart'
    as _i252;
import '../../modules/authentication/data/respositoies_imp/register/register_repo_impl.dart'
    as _i161;
import '../../modules/authentication/domain/repositories_contracts/forget_password/forget_password_repo.dart'
    as _i1013;
import '../../modules/authentication/domain/repositories_contracts/forget_password/reset_code_repo.dart'
    as _i251;
import '../../modules/authentication/domain/repositories_contracts/forget_password/reset_password_repo.dart'
    as _i731;
import '../../modules/authentication/domain/repositories_contracts/login/login_repo.dart'
    as _i450;
import '../../modules/authentication/domain/repositories_contracts/login_as_guest/login_as_guest_repo.dart'
    as _i926;
import '../../modules/authentication/domain/repositories_contracts/register/register_repo.dart'
    as _i496;
import '../../modules/authentication/domain/use_cases/forget_password/forget_password_use_case.dart'
    as _i823;
import '../../modules/authentication/domain/use_cases/forget_password/reset_code_use_case.dart'
    as _i9;
import '../../modules/authentication/domain/use_cases/forget_password/reset_password_use_case.dart'
    as _i110;
import '../../modules/authentication/domain/use_cases/login/login_use_case.dart'
    as _i543;
import '../../modules/authentication/domain/use_cases/login_as_guest/login_as_gust_use_case.dart'
    as _i421;
import '../../modules/authentication/domain/use_cases/register/register_use_case.dart'
    as _i782;
import '../../modules/authentication/ui/forget_password/view_model/forget_password_screen_view_model.dart'
    as _i105;
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
import '../../modules/check_out/data/api/api_client/check_out_api_client.dart'
    as _i363;
import '../../modules/check_out/data/api/api_provider/check_out_api_client_provider.dart'
    as _i97;
import '../../modules/check_out/data/data_source_contract/chechout_data_souce_contract.dart'
    as _i113;
import '../../modules/check_out/data/data_source_impl/checkout_data_souce_impl.dart'
    as _i455;
import '../../modules/check_out/data/repo_impl/checkout_repo_impl.dart'
    as _i868;
import '../../modules/check_out/domain/repo_contract/checkout_repo_contract.dart'
    as _i107;
import '../../modules/check_out/domain/use_case/get_all_addresses_use_case.dart'
    as _i297;
import '../../modules/check_out/ui/view_model/check_out_cubit.dart' as _i82;
import '../../modules/edit_profile/data/api/api_client/profile_api_client.dart'
    as _i319;
import '../../modules/edit_profile/data/api/api_client/upload_image_api_client.dart'
    as _i737;
import '../../modules/edit_profile/data/api/api_client_provider/profile_api_client_provider.dart'
    as _i28;
import '../../modules/edit_profile/data/datasource_contract/edit_profile_online_data_source.dart'
    as _i713;
import '../../modules/edit_profile/data/datasource_imp/profile_data_source_impl.dart'
    as _i914;
import '../../modules/edit_profile/data/repo_imp/profile_repo_impl.dart'
    as _i182;
import '../../modules/edit_profile/domain/repo_contract/edit_profile_repo.dart'
    as _i881;
import '../../modules/edit_profile/domain/use_cases/change_password_use_case.dart'
    as _i70;
import '../../modules/edit_profile/domain/use_cases/edit_profile_use_case.dart'
    as _i85;
import '../../modules/edit_profile/domain/use_cases/upload_image_use_case.dart'
    as _i359;
import '../../modules/edit_profile/ui/view_model/edit_profile_view_model.dart'
    as _i430;
import '../../modules/home/data/api/api_client/home_api_client.dart' as _i293;
import '../../modules/home/data/api/api_client_provider/home_api_client_provider.dart'
    as _i939;
import '../../modules/home/data/datasource_contract/about_us.dart' as _i925;
import '../../modules/home/data/datasource_contract/home_online_data_source.dart'
    as _i274;
import '../../modules/home/data/datasource_contract/new_address.dart' as _i1042;
import '../../modules/home/data/datasource_contract/terms.dart' as _i937;
import '../../modules/home/data/datasource_impl/about_us.dart' as _i1049;
import '../../modules/home/data/datasource_impl/home_data_source_impl.dart'
    as _i524;
import '../../modules/home/data/datasource_impl/new_address.dart' as _i265;
import '../../modules/home/data/datasource_impl/Terms.dart' as _i139;
import '../../modules/home/data/repo_impl/about_us.dart' as _i219;
import '../../modules/home/data/repo_impl/home_repo_impl.dart' as _i1042;
import '../../modules/home/data/repo_impl/new_address_repo_impl.dart' as _i150;
import '../../modules/home/data/repo_impl/terms.dart' as _i880;
import '../../modules/home/domain/repo_contract/about_us.dart' as _i936;
import '../../modules/home/domain/repo_contract/home_repo.dart' as _i1003;
import '../../modules/home/domain/repo_contract/new_address_repo.dart' as _i469;
import '../../modules/home/domain/repo_contract/terms.dart' as _i1053;
import '../../modules/home/domain/use_cases/about_us.dart' as _i435;
import '../../modules/home/domain/use_cases/add_to_use_case.dart' as _i999;
import '../../modules/home/domain/use_cases/delete_from_cart.dart' as _i828;
import '../../modules/home/domain/use_cases/get_all_products_use_case.dart'
    as _i1019;
import '../../modules/home/domain/use_cases/get_cart_items_use_case.dart'
    as _i640;
import '../../modules/home/domain/use_cases/get_categories_use_case.dart'
    as _i369;
import '../../modules/home/domain/use_cases/get_home_data_use_case.dart'
    as _i90;
import '../../modules/home/domain/use_cases/get_occasions_use_case.dart'
    as _i386;
import '../../modules/home/domain/use_cases/new_address_use_case.dart' as _i304;
import '../../modules/home/domain/use_cases/terms_use_case.dart' as _i721;
import '../../modules/home/ui/layouts/add_new_address/viewModel/new_address_cubit.dart'
    as _i482;
import '../../modules/home/ui/layouts/cart_layout/view_model/cart_layout_view_model.dart'
    as _i671;
import '../../modules/home/ui/layouts/categories_layout/view_model/categories_layout_view_model.dart'
    as _i44;
import '../../modules/home/ui/layouts/home_layout/view_model/home_cubit.dart'
    as _i692;
import '../../modules/home/ui/layouts/profile_layout/view_model/profile_layout_view_model.dart'
    as _i901;
import '../../modules/home/ui/view_model/home_screen_view_model.dart' as _i867;
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
import '../../modules/order_page/data/api/api_client/my_orders_api_client.dart'
    as _i583;
import '../../modules/order_page/data/api/api_client_provider/my_orders_api_client_provider.dart'
    as _i372;
import '../../modules/order_page/data/data_source_contract/order_page.dart'
    as _i160;
import '../../modules/order_page/data/data_source_impl/order_page.dart' as _i20;
import '../../modules/order_page/data/repo_impl/order_page.dart' as _i23;
import '../../modules/order_page/domain/repo/order_page.dart' as _i484;
import '../../modules/order_page/domain/usecase/order_page.dart' as _i865;
import '../../modules/order_page/ui/cubit/order_page_view_model.dart' as _i811;
import '../../modules/payment/data/api/api_client/payment_api_client.dart'
    as _i979;
import '../../modules/payment/data/api/api_client_provider/payment_api_client_provider.dart'
    as _i177;
import '../../modules/payment/data/data_source_contract/payment/payment_remote_data_source.dart'
    as _i409;
import '../../modules/payment/data/data_source_imp/payment/payment_remote_data_source_imp.dart'
    as _i979;
import '../../modules/payment/data/repository_imp/payment/payment_repository_imp.dart'
    as _i1026;
import '../../modules/payment/domain/repository_contract/payment/payment_repository.dart'
    as _i542;
import '../../modules/payment/domain/use_cases/payment/make_cash_order_use_case.dart'
    as _i112;
import '../../modules/payment/domain/use_cases/payment/make_checkout_session_use_case.dart'
    as _i834;
import '../../modules/payment/ui/view_model/payment_view_model.dart' as _i801;
import '../../modules/product_details/ui/view_model/product_details_view_model.dart'
    as _i902;
import '../../modules/search/view_model/search_cubit.dart' as _i861;
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
import '../apis/api_manager.dart' as _i669;
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
    final checkOutApiClientProvider = _$CheckOutApiClientProvider();
    final paymentApiClientProvider = _$PaymentApiClientProvider();
    final authApiClientProvider = _$AuthApiClientProvider();
    final editProfileApiClientProvider = _$EditProfileApiClientProvider();
    final homeApiClientProvider = _$HomeApiClientProvider();
    final occasionApiClientProvider = _$OccasionApiClientProvider();
    final myOrdersApiClientProvider = _$MyOrdersApiClientProvider();
    final localeInitializer = _$LocaleInitializer();
    gh.factory<_i669.ApiManager>(() => _i669.ApiManager());
    await gh.factoryAsync<_i361.Dio>(
      () => dioService.provideDio(),
      preResolve: true,
    );
    gh.factory<_i902.ProductDetailsViewModel>(
        () => _i902.ProductDetailsViewModel());
    await gh.factoryAsync<_i558.FlutterSecureStorage>(
      () => storagesInitializer.initFlutterSecureStorage(),
      preResolve: true,
    );
    gh.factory<_i937.TermsLocalDataSource>(
        () => _i139.TermsLocalDataSourceImpl());
    gh.lazySingleton<_i41.BestSellerApiClient>(
        () => bestSellerClientProvider.providerApiClient(gh<_i361.Dio>()));
    gh.lazySingleton<_i363.CheckOutApiClient>(
        () => checkOutApiClientProvider.providerApiClient(gh<_i361.Dio>()));
    gh.lazySingleton<_i737.UploadImageApiClient>(
        () => _i737.UploadImageApiClient(gh<_i361.Dio>()));
    gh.lazySingleton<_i979.PaymentApiClient>(
        () => paymentApiClientProvider.providerApiClient(gh<_i361.Dio>()));
    gh.singleton<_i343.AuthApiClient>(
        () => authApiClientProvider.provideApiClient(gh<_i361.Dio>()));
    gh.singleton<_i319.ProfileApiClient>(
        () => editProfileApiClientProvider.apiClient(gh<_i361.Dio>()));
    gh.singleton<_i293.HomeApiClient>(
        () => homeApiClientProvider.provideApiClient(gh<_i361.Dio>()));
    gh.singleton<_i941.OccasionApiClient>(
        () => occasionApiClientProvider.apiClient(gh<_i361.Dio>()));
    gh.singleton<_i583.MyOrdersApiClient>(
        () => myOrdersApiClientProvider.apiClient(gh<_i361.Dio>()));
    gh.factory<_i274.HomeDataSource>(
        () => _i524.HomeDataSourceImpl(gh<_i293.HomeApiClient>()));
    gh.factory<_i1042.NewAddressOnlineDataSource>(
        () => _i265.NewAddressOnlineDataSourceImpl(gh<_i293.HomeApiClient>()));
    gh.factory<_i113.CheckOutDataSource>(
        () => _i455.CheckOutDataSourceImpl(gh<_i363.CheckOutApiClient>()));
    gh.factory<_i160.OrderPageOnlineDataSource>(() =>
        _i20.OrderPageOnlineDataSourceImpl(gh<_i583.MyOrdersApiClient>()));
    gh.factory<_i925.AboutUsLocalDataSource>(
        () => _i1049.AboutUsLocalDataSourceImpl());
    gh.factory<_i936.AboutUsRepo>(
        () => _i219.AboutUsRepoImpl(gh<_i925.AboutUsLocalDataSource>()));
    gh.factory<_i779.ResetCodeRemoteDataSource>(
        () => _i808.ResetCodeRemoteDataSourceImpl(gh<_i343.AuthApiClient>()));
    gh.factory<_i150.ForgetPasswordRemoteDataSource>(() =>
        _i191.ForgetPasswordRemoteDataSourceImpl(gh<_i343.AuthApiClient>()));
    gh.factory<_i1053.TermsRepo>(
        () => _i880.TermsRepoImpl(gh<_i937.TermsLocalDataSource>()));
    gh.factory<_i251.ResetCodeRepo>(
        () => _i196.ResetCodeRepoImpl(gh<_i779.ResetCodeRemoteDataSource>()));
    gh.singleton<_i629.SecureStorageService<dynamic>>(
        () => _i701.SecureStorageServiceImp(gh<_i558.FlutterSecureStorage>()));
    gh.factory<_i484.OrderPageRepo>(
        () => _i23.OrderPageRepoImpl(gh<_i160.OrderPageOnlineDataSource>()));
    gh.factory<_i713.EditProfileOnlineDataSource>(
        () => _i914.EditProfileOnlineDataSourceImpl(
              gh<_i319.ProfileApiClient>(),
              gh<_i737.UploadImageApiClient>(),
            ));
    gh.factory<_i881.ResetPasswordRemoteDataSource>(() =>
        _i956.ResetPasswordRemoteDataSourceImpl(gh<_i343.AuthApiClient>()));
    gh.factory<_i409.PaymentRemoteDataSource>(
        () => _i979.PaymentRemoteDataSourceImp(gh<_i979.PaymentApiClient>()));
    gh.factory<_i542.PaymentRepository>(
        () => _i1026.PaymentRepositoryImp(gh<_i409.PaymentRemoteDataSource>()));
    gh.factory<_i721.TermsUseCase>(
        () => _i721.TermsUseCase(gh<_i1053.TermsRepo>()));
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
    gh.factory<_i881.ProfileRepo>(
        () => _i182.ProfileRepoImpl(gh<_i713.EditProfileOnlineDataSource>()));
    gh.factory<_i319.OccasionRepo>(
        () => _i276.OccasionRepoImpl(gh<_i362.OccasionOnlineDataSource>()));
    gh.factory<_i469.NewAddressRepo>(() =>
        _i150.NewAddressRepoImpl(gh<_i1042.NewAddressOnlineDataSource>()));
    gh.factory<_i731.ResetPasswordRepo>(() =>
        _i940.ResetPasswordRepoImpl(gh<_i881.ResetPasswordRemoteDataSource>()));
    gh.factory<_i107.CheckOutRepo>(() => _i868.CheckOutRepoImpl(
        checkOutDataSource: gh<_i113.CheckOutDataSource>()));
    gh.factory<_i1003.HomeRepo>(
        () => _i1042.HomeRepoImpl(gh<_i274.HomeDataSource>()));
    gh.factory<_i1013.ForgetPasswordRepo>(() => _i811.ForgetPasswordRepoImpl(
        gh<_i150.ForgetPasswordRemoteDataSource>()));
    gh.factory<_i435.AboutUsUseCase>(
        () => _i435.AboutUsUseCase(gh<_i936.AboutUsRepo>()));
    gh.factory<_i9.ResetCodeUseCase>(
        () => _i9.ResetCodeUseCase(gh<_i251.ResetCodeRepo>()));
    gh.factory<_i871.RegisterOnlineDataSource>(
        () => _i219.RegisterOnlineDataSourceImpl(gh<_i343.AuthApiClient>()));
    gh.factory<_i828.DeleteFromCartUseCase>(
        () => _i828.DeleteFromCartUseCase(gh<_i1003.HomeRepo>()));
    gh.factory<_i1019.GetAllProductsUseCase>(
        () => _i1019.GetAllProductsUseCase(gh<_i1003.HomeRepo>()));
    gh.factory<_i369.GetCategoriesUseCase>(
        () => _i369.GetCategoriesUseCase(gh<_i1003.HomeRepo>()));
    gh.factory<_i386.GetOccasionsUseCase>(
        () => _i386.GetOccasionsUseCase(gh<_i1003.HomeRepo>()));
    gh.factory<_i297.GetAllAddressesUseCase>(
        () => _i297.GetAllAddressesUseCase(gh<_i107.CheckOutRepo>()));
    gh.factory<_i861.SearchCubit>(
        () => _i861.SearchCubit(gh<_i1019.GetAllProductsUseCase>()));
    gh.factory<_i90.GetHomeDataUseCase>(
        () => _i90.GetHomeDataUseCase(gh<_i1003.HomeRepo>()));
    gh.factory<_i147.LoginLocalDataSource>(() => _i916.LoginLocalDataSourceImpl(
        storageService: gh<_i629.SecureStorageService<dynamic>>()));
    gh.factory<_i41.OccasionUseCase>(
        () => _i41.OccasionUseCase(gh<_i319.OccasionRepo>()));
    gh.factory<_i865.OrderPageUsecase>(
        () => _i865.OrderPageUsecase(gh<_i484.OrderPageRepo>()));
    gh.factory<_i138.LoginAsGuestOfflineDataSource>(() =>
        _i79.LoginAsGuestOfflineDataSourceImpl(
            gh<_i629.SecureStorageService<dynamic>>()));
    gh.factory<_i999.AddToCartUseCase>(
        () => _i999.AddToCartUseCase(homeRepo: gh<_i1003.HomeRepo>()));
    gh.factory<_i640.GetCartItemsUseCase>(
        () => _i640.GetCartItemsUseCase(homeRepo: gh<_i1003.HomeRepo>()));
    gh.factory<_i855.OccasionViewModelCubit>(
        () => _i855.OccasionViewModelCubit(gh<_i41.OccasionUseCase>()));
    gh.factory<_i76.BestSellerRepository>(() =>
        _i911.BestSellerRepositoryImp(gh<_i23.BestSellerRemoteDataSource>()));
    gh.factory<_i112.MakeCashOrderUseCase>(
        () => _i112.MakeCashOrderUseCase(gh<_i542.PaymentRepository>()));
    gh.factory<_i834.MakeCheckoutSessionUseCase>(
        () => _i834.MakeCheckoutSessionUseCase(gh<_i542.PaymentRepository>()));
    gh.factory<_i496.RegisterRepo>(
        () => _i161.RegisterRepoImpl(gh<_i871.RegisterOnlineDataSource>()));
    gh.factory<_i782.RegisterUseCase>(
        () => _i782.RegisterUseCase(gh<_i496.RegisterRepo>()));
    gh.factory<_i110.ResetPasswordUseCase>(
        () => _i110.ResetPasswordUseCase(gh<_i731.ResetPasswordRepo>()));
    gh.factory<_i450.LoginRepo>(() => _i639.LoginRepoImp(
          gh<_i766.LoginRemoteDataSource>(),
          gh<_i147.LoginLocalDataSource>(),
        ));
    gh.singleton<_i82.CheckOutCubit>(() => _i82.CheckOutCubit(
          gh<_i297.GetAllAddressesUseCase>(),
          gh<_i112.MakeCashOrderUseCase>(),
          gh<_i834.MakeCheckoutSessionUseCase>(),
        ));
    gh.factory<_i70.ChangePasswordUseCase>(
        () => _i70.ChangePasswordUseCase(gh<_i881.ProfileRepo>()));
    gh.factory<_i85.EditProfileUseCase>(
        () => _i85.EditProfileUseCase(gh<_i881.ProfileRepo>()));
    gh.factory<_i359.UploadImageUseCase>(
        () => _i359.UploadImageUseCase(gh<_i881.ProfileRepo>()));
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
    gh.factory<_i304.NewAddressUseCase>(
        () => _i304.NewAddressUseCase(gh<_i469.NewAddressRepo>()));
    gh.factory<_i926.LoginAsGuestRepo>(() =>
        _i252.LoginAsGuestRepoImpl(gh<_i138.LoginAsGuestOfflineDataSource>()));
    gh.factory<_i823.ForgetPasswordUseCase>(
        () => _i823.ForgetPasswordUseCase(gh<_i1013.ForgetPasswordRepo>()));
    gh.factory<_i801.PaymentViewModel>(
        () => _i801.PaymentViewModel(gh<_i834.MakeCheckoutSessionUseCase>()));
    gh.factory<_i421.LoginAsGuestUseCase>(
        () => _i421.LoginAsGuestUseCase(gh<_i926.LoginAsGuestRepo>()));
    gh.factory<_i811.MyOrdersViewModelCubit>(
        () => _i811.MyOrdersViewModelCubit(gh<_i865.OrderPageUsecase>()));
    gh.factory<_i105.ForgetPasswordViewModel>(
        () => _i105.ForgetPasswordViewModel(
              gh<_i823.ForgetPasswordUseCase>(),
              gh<_i110.ResetPasswordUseCase>(),
              gh<_i9.ResetCodeUseCase>(),
            ));
    gh.factory<_i543.LoginUseCase>(
        () => _i543.LoginUseCase(gh<_i450.LoginRepo>()));
    gh.factory<_i430.EditProfileViewModelCubit>(
        () => _i430.EditProfileViewModelCubit(
              gh<_i543.LoginUseCase>(),
              gh<_i85.EditProfileUseCase>(),
              gh<_i359.UploadImageUseCase>(),
              gh<_i70.ChangePasswordUseCase>(),
            ));
    gh.factory<_i867.HomeScreenViewModel>(() => _i867.HomeScreenViewModel(
          gh<_i44.CategoriesLayoutViewModel>(),
          gh<_i855.OccasionViewModelCubit>(),
        ));
    gh.factory<_i482.NewAddressViewModelCubit>(
        () => _i482.NewAddressViewModelCubit(gh<_i304.NewAddressUseCase>()));
    gh.factory<_i363.LoginViewModelCubit>(() => _i363.LoginViewModelCubit(
          gh<_i543.LoginUseCase>(),
          gh<_i421.LoginAsGuestUseCase>(),
        ));
    gh.singleton<_i671.CartCubit>(() => _i671.CartCubit(
          gh<_i640.GetCartItemsUseCase>(),
          gh<_i543.LoginUseCase>(),
          gh<_i999.AddToCartUseCase>(),
          gh<_i828.DeleteFromCartUseCase>(),
        ));
    gh.factory<_i901.ProfileViewModelCubit>(() => _i901.ProfileViewModelCubit(
          gh<_i543.LoginUseCase>(),
          gh<_i435.AboutUsUseCase>(),
          gh<_i721.TermsUseCase>(),
        ));
    return this;
  }
}

class _$DioService extends _i738.DioService {}

class _$StoragesInitializer extends _i241.StoragesInitializer {}

class _$BestSellerClientProvider extends _i664.BestSellerClientProvider {}

class _$CheckOutApiClientProvider extends _i97.CheckOutApiClientProvider {}

class _$PaymentApiClientProvider extends _i177.PaymentApiClientProvider {}

class _$AuthApiClientProvider extends _i1019.AuthApiClientProvider {}

class _$EditProfileApiClientProvider
    extends _i28.EditProfileApiClientProvider {}

class _$HomeApiClientProvider extends _i939.HomeApiClientProvider {}

class _$OccasionApiClientProvider extends _i507.OccasionApiClientProvider {}

class _$MyOrdersApiClientProvider extends _i372.MyOrdersApiClientProvider {}

class _$LocaleInitializer extends _i631.LocaleInitializer {}
