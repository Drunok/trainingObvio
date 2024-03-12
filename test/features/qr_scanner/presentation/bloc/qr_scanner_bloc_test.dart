import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qr_training_obvio/core/error/failures.dart';
import 'package:qr_training_obvio/features/qr_scanner/domain/entities/qr_code.dart';
import 'package:qr_training_obvio/features/qr_scanner/domain/usecases/validate_qr_code.dart';
import 'package:qr_training_obvio/features/qr_scanner/presentation/bloc/qr_scanner_bloc.dart';


class MockValidateQrCode extends Mock implements ValidateQrCode {}


void main() {
  late QrScannerBloc bloc;

  late MockValidateQrCode mockValidateQrCode;

  setUp(() {
    mockValidateQrCode = MockValidateQrCode();
    registerFallbackValue(const Params(qrCode: 'valor 1'));
    bloc = QrScannerBloc(validateQrCode: mockValidateQrCode);
  });

  test('initialState should be QrScannerInitial', () {
    //assert
    expect(bloc.state, equals(QrScannerInitial()));
  });

  group('GetValidationForScannedQR', 
    () {
    const tQRScannedDataString = 'valor 1';
    const tBool = true;

    test(
        'should get a boolean value from the Validate QR code usecase', 
        () async {
          // arrange
          when(() => mockValidateQrCode.call(any()))
            .thenAnswer((_) async => const Right(tBool));
          // act
          bloc.add(const GetValidationForScannedQREvent(qrScannedData: tQRScannedDataString));
          await untilCalled(() => mockValidateQrCode.call(any()));
          // assert
          verify(() => mockValidateQrCode.call(const Params(qrCode: tQRScannedDataString)));
        }
      );

    test(
        'should emit [Loading, Correct] when data is gotten successfully', 
        () async {
          // arrange
          when(() => mockValidateQrCode.call(any()))
            .thenAnswer((_) async => const Right(tBool));
          // assert later
          final expected = [
            QrScannerLoading(),
            const QrScannerCorrect(messageCorrect: 'Correct')
          ];
          expectLater(bloc.stream, emitsInOrder(expected));
          // act
          bloc.add(const GetValidationForScannedQREvent(qrScannedData: tQRScannedDataString));
        }
      );

      test(
        'should emit [Loading, Error] when data is gotten unsuccessfully', 
        () async {
          // arrange
          when(() => mockValidateQrCode.call(any()))
            .thenAnswer((_) async => Left(CacheFailure()));
          // assert later
          final expected = [
            QrScannerLoading(),
            QrScannerError()
          ];
          expectLater(bloc.stream, emitsInOrder(expected));
          // act
          bloc.add(const GetValidationForScannedQREvent(qrScannedData: tQRScannedDataString));
        }
      );
    }
  );
}