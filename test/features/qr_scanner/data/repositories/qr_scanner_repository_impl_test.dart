import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qr_training_obvio/core/error/exceptions.dart';
import 'package:qr_training_obvio/core/error/failures.dart';
import 'package:qr_training_obvio/features/qr_scanner/data/datasources/qr_scanner_local_datasource.dart';
import 'package:qr_training_obvio/features/qr_scanner/data/repositories/qr_scanner_repository_impl.dart';

class MockQrScannerLocalDataSource extends Mock
    implements QrScannerLocalDataSource {}

void main() {
  late QrScannerRepositoryImpl repository;
  late MockQrScannerLocalDataSource mockQrScannerLocalDataSource;

  setUp(() {
    mockQrScannerLocalDataSource = MockQrScannerLocalDataSource();
    repository =
        QrScannerRepositoryImpl(localDataSource: mockQrScannerLocalDataSource);
  });

  const tCode = 'valor 1';

  group('validate QR code', () {
    test(
        'should return true when the QR code is valid', 
        () async {
          // arrange
          when(() => mockQrScannerLocalDataSource.validateQrCode(any())).thenAnswer((_) async => true);

          // act
          final result = await repository.validateQrCode(tCode);

          // assert
          expect(result, const Right(true));
        }
      );

    test(
      'should return Cache Failure when the call to local data source is unsuccessful', 
      () async {
        //arrange
          when(() => mockQrScannerLocalDataSource.validateQrCode(any())).thenThrow(CacheException());
        //act
          final result = await repository.validateQrCode(tCode);        
        //assert
          verify(() => mockQrScannerLocalDataSource.validateQrCode(tCode));
          verifyNoMoreInteractions(mockQrScannerLocalDataSource);
          expect(result, equals(Left(CacheFailure())));
      }
    );
  });
}
