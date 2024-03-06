
import 'package:qr_training_obvio/features/qr_scanner/domain/entities/qr_code.dart';

class QrValidator {

  bool isValid(QrCode userQrCode, List<QrCode> systemQrCodeList) {

    bool res = false;
    String rawQrCode = userQrCode.rawValue;
    for (var i = 0; i < systemQrCodeList.length && !res; i++) {
      if (systemQrCodeList[i].rawValue == rawQrCode ) {
        res = true;
      }
    } 

    return res;
  }

}