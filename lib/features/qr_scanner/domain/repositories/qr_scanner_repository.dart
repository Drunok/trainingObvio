
import 'package:dartz/dartz.dart';

import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_training_obvio/features/qr_scanner/domain/entities/qr_code.dart';

import '../../../../core/error/failures.dart';

abstract class QrScannerRepository {
  Future<Either<Failure, QrCode>> getQrCode(Barcode barcode);
}