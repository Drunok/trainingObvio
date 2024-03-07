import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:qr_training_obvio/features/qr_scanner/data/models/qr_code_model.dart';
import 'package:qr_training_obvio/features/qr_scanner/domain/entities/qr_code.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {

  const tQrCodeModel = QrCodeModel(title: 'titulo de prueba 1', rawValue: 'valor de prueba 1');

  test(
    'should be a subclass of QrCode entity', 
    () {
      //assert
      expect(tQrCodeModel, isA<QrCode>());
    },
  );

  group('from Json', () { 
      test('should return a valid model when the JSON is valid', 
        () async {
          // arrange
          final Map<String, dynamic> jsonMap = json.decode(fixture('qr_information.json'));
          // act
          final result = QrCodeModel.fromJson(jsonMap);
          // assert
          expect(result, tQrCodeModel);
        }
      );      
    }
  );

  group('to Json', () {
    test('should return a JSON map containing the proper data', 
      () async {
        //act
        final result =  tQrCodeModel.toJson();
        //assert
        final expectedMap = {
          "title": "titulo de prueba 1",
          "rawValue": "valor de prueba 1"
        };
        expect(result, expectedMap);
      }
    );
  });

}