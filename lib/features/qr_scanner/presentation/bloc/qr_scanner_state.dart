part of 'qr_scanner_bloc.dart';

sealed class QrScannerState extends Equatable {
  const QrScannerState();
  
  @override
  List<Object> get props => [];
}

final class QrScannerInitial extends QrScannerState {}

final class QrScannerLoading extends QrScannerState {}

final class QrScannerCorrect extends QrScannerState {
  final String messageCorrect;

  const QrScannerCorrect({required this.messageCorrect});

  @override
  List<Object> get props => [messageCorrect];
}

final class QrScannerError extends QrScannerState {}
