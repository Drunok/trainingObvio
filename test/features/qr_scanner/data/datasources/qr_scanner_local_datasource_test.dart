import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qr_training_obvio/core/constants/cache_constants.dart';
import 'package:qr_training_obvio/features/qr_scanner/data/datasources/qr_scanner_local_datasource.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late QrScannerLocalDataSourceImpl qrScannerLocalDataSourceImpl;
  late MockSharedPreferences mockSharedPreferences;
  
  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    qrScannerLocalDataSourceImpl = QrScannerLocalDataSourceImpl(sharedPreferences: mockSharedPreferences);
  });

  group("validate QR code", () {

    final tQrCodeModelList = fixture('qr_code_cached.json');
      test(
        'should return false when Shared Preferences does not have a QR code cached', 
        () async {
          // arrange
            when(() => mockSharedPreferences.getString(cacheCorrectQRCodeList))
                  .thenReturn(null);
          // act
            final result = await qrScannerLocalDataSourceImpl.validateQrCode('test qr code');
          // assert
            verify(() => mockSharedPreferences.getString(cacheCorrectQRCodeList));
            expect(result, false);
        }
      );
      
      test(
        'should return true when Shared Preferences has the scanned QR code cached', 
        () async {
          // arrange
            when(() => mockSharedPreferences.getString(cacheCorrectQRCodeList))
                  .thenReturn(tQrCodeModelList);
          // act
            final result = await qrScannerLocalDataSourceImpl.validateQrCode('valor de prueba 1');
          // assert
            verify(() => mockSharedPreferences.getString(cacheCorrectQRCodeList));
            expect(result, true);
        }
      );

      test(
        'should return false when the qr code is incorrecto', 
        () async {
          // arrange
            when(() => mockSharedPreferences.getString(cacheCorrectQRCodeList))
                  .thenReturn(tQrCodeModelList);
          // act
            final result = await qrScannerLocalDataSourceImpl.validateQrCode('valor de prueba 3');
          // assert
            verify(() => mockSharedPreferences.getString(cacheCorrectQRCodeList));
            expect(result, false);
        }
      );
    },
  );
}