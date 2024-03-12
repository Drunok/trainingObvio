part of 'qr_scanner_bloc.dart';

sealed class QrScannerEvent extends Equatable {
  const QrScannerEvent();

  @override
  List<Object> get props => [];
}

class GetValidationForScannedQREvent extends QrScannerEvent {
  final String qrScannedData;

  const GetValidationForScannedQREvent({required this.qrScannedData});

  

}
