import 'package:assesment_project/core/network/network.dart';
import 'package:assesment_project/data/datasources/local_datasource.dart';
import 'package:assesment_project/data/datasources/remote_datasource.dart';
import 'package:assesment_project/data/repositories/grocery_repository_impl.dart';
import 'package:assesment_project/domain/repository/grocery_repository.dart';
import 'package:assesment_project/domain/usecase/get_a_grocery.dart';
import 'package:assesment_project/domain/usecase/get_all_grocery.dart';
import 'package:assesment_project/presentation/bloc/blocs.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

final getIt = GetIt.instance;

Future<void> setUp() async {
  final client = http.Client();
  InternetConnectionChecker connectionChecker = InternetConnectionChecker();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  getIt.registerLazySingleton<InternetConnectionChecker>(
      () => connectionChecker);
  getIt.registerLazySingleton<http.Client>(() => client);
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  // Ensure NetworkInfo is registered after its dependencies
  getIt.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(getIt<InternetConnectionChecker>()));

  getIt.registerLazySingleton<LocalDataSource>(
      () => LocalDataSourceImpl(sharedPreferences: getIt<SharedPreferences>()));
  getIt.registerLazySingleton<GroceryRemoteDataSources>(
      () => GroceryRemoteDataSourcesImpl(client: getIt<http.Client>()));
  getIt.registerLazySingleton<GroceryRepository>(() => GroceryRepositoryImpl(
      localDataSources: getIt<LocalDataSource>(),
      groceryRemoteDataSources: getIt<GroceryRemoteDataSources>(),
      networkInfo: getIt<NetworkInfo>()));
  getIt.registerLazySingleton<GetAllGroceryUseCase>(
      () => GetAllGroceryUseCase(getIt<GroceryRepository>()));
  getIt.registerLazySingleton(
      () => GetGroceryUseCase(getIt<GroceryRepository>()));
  getIt.registerLazySingleton(() => GroceryBloc(
        getAllGroceryUseCase: getIt<GetAllGroceryUseCase>(),
        getGroceryUseCase: getIt<GetGroceryUseCase>(),
      ));
  
}
