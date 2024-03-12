import "package:get_it/get_it.dart";
import "package:qr_training_obvio/features/qr_scanner/data/datasources/qr_scanner_local_datasource.dart";
import "package:qr_training_obvio/features/qr_scanner/data/repositories/qr_scanner_repository_impl.dart";
import "package:qr_training_obvio/features/qr_scanner/domain/repositories/qr_scanner_repository.dart";
import "package:qr_training_obvio/features/qr_scanner/domain/usecases/validate_qr_code.dart";
import "package:qr_training_obvio/features/qr_scanner/presentation/bloc/qr_scanner_bloc.dart";
import "package:shared_preferences/shared_preferences.dart";

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - QR Scanner
  
  // Bloc
  sl.registerFactory(
    () => QrScannerBloc(
      validateQrCode: sl()
    )
  );

  // Use cases
  sl.registerLazySingleton(
    () => ValidateQrCode(
      repository: sl()
    )
  );

  // Repository
  sl.registerLazySingleton<QrScannerRepository>(
    () => QrScannerRepositoryImpl(localDataSource: sl())
  );

  // Data sources
  sl.registerLazySingleton<QrScannerLocalDataSource>(
    () => QrScannerLocalDataSourceImpl(sharedPreferences: sl()) 
  );

  //! Core

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
