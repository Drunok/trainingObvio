
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

abstract class QrScannerRepository {
  Future<Either<Failure, bool>> validateQrCode(String rawValue);
}