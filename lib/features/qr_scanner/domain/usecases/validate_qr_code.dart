

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/qr_scanner_repository.dart';

class ValidateQrCode implements UseCase<bool, Params>{

  final QrScannerRepository repository;

  ValidateQrCode({required this.repository});


  @override
  Future<Either<Failure, bool>> call(Params params) async{
    
    return await repository.validateQrCode(params.qrCode);
  }

}

class Params extends Equatable {

  final String qrCode;

  const Params({required this.qrCode});

  @override
  List<Object?> get props => [qrCode];

}