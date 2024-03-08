import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/repositories/qr_scanner_repository.dart';
import '../datasources/qr_scanner_local_datasource.dart';

class QrScannerRepositoryImpl implements QrScannerRepository {
  final QrScannerLocalDataSource localDataSource;

  QrScannerRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, bool>> validateQrCode(String rawValue) async {
    try {
      final validationQR = await localDataSource.validateQrCode(rawValue); 
      return Right(validationQR); 
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
