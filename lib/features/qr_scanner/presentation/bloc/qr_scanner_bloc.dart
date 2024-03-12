import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
// import 'package:qr_training_obvio/core/error/failures.dart';

import '../../domain/usecases/validate_qr_code.dart';

part 'qr_scanner_event.dart';
part 'qr_scanner_state.dart';

class QrScannerBloc extends Bloc<QrScannerEvent, QrScannerState> {
  ValidateQrCode validateQrCode;

  QrScannerBloc({required this.validateQrCode}) : super(QrScannerInitial()) {
    on<GetValidationForScannedQREvent>((event, emit) {
      emit(QrScannerLoading());
      validateQrCode(Params(qrCode: event.qrScannedData)).then((result) {
        result.fold(
          (failure) => emit(QrScannerError()),
          (success) => emit(const QrScannerCorrect(messageCorrect: 'Correct')),
        );
      });
    });
  }
}
