//dependency injection file
import 'package:dio/dio.dart';
import 'package:first_application/app/app_preferences.dart';
import 'package:first_application/data/data_source/remote_data_source.dart';
import 'package:first_application/data/network/dio_factory.dart';
import 'package:first_application/data/network/network_info.dart';
import 'package:first_application/data/repository/repository_impl.dart';
import 'package:first_application/domain/repository/repository.dart';
import 'package:first_application/domain/usecase/login_usecase.dart';
import 'package:first_application/presentation/login/viewModel/login_view_model.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/network/app_api.dart';
final instance=GetIt.instance;
Future <void> initAppModule()async{
  //app module it's a module where we put all generic dependencies

  //shared prefs instance
  final sharedPrefs= await SharedPreferences.getInstance();

  instance.registerLazySingleton<SharedPreferences>(()=>sharedPrefs);
  //app pref instance
  instance.registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));

  //network info instance
  instance.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(InternetConnectionChecker()));

  //dio factory instance
  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));

  Dio dio =await instance<DioFactory>().getDio();
  //app services client
  instance.registerLazySingleton<AppServicesClient>(() => AppServicesClient (dio));

  //remote data source instance
  instance.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImp(instance()));

  //repository

  instance.registerLazySingleton<Repository>(() => RepositoryImpl(instance(), instance()));


}
initLoginModule(){
  //because this module is just for login so we don't need to store instance in singleton so we use factory

  if(!GetIt.I.isRegistered<LoginUseCase>()){

    //login useCase instance
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));

    //login view model
    instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));
  }

}
