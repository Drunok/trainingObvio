import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
// import 'package:qr_training_obvio/features/qr_scanner/domain/entities/qr_code.dart';

import 'package:qr_training_obvio/features/qr_scanner/domain/repositories/qr_scanner_repository.dart';
import 'package:qr_training_obvio/features/qr_scanner/domain/usecases/validate_qr_code.dart';



class MockQrScannerRepository extends Mock implements QrScannerRepository{}

  void main() {

    late ValidateQrCode usecase;
    late MockQrScannerRepository mockQrScannerRepository;

    setUp(() {
        mockQrScannerRepository = MockQrScannerRepository();
        usecase = ValidateQrCode(repository: mockQrScannerRepository);
      }      
    );

    // ignore: prefer_const_declarations
    final tCode = 'valor';

    test(
      'should get validation for a qr code from the repository', 
      () async {
        // arrange
        when(() => mockQrScannerRepository.validateQrCode(tCode))
          .thenAnswer((_) async => const Right(true));
        // act
        final result = await usecase.call(Params(qrCode: tCode));
        // assert
        expect(result, const Right(true));
        verify(() => mockQrScannerRepository.validateQrCode(tCode));
        verifyNoMoreInteractions(mockQrScannerRepository);
      },
    );
  
  }
