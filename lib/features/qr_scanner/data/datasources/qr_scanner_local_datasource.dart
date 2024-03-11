// import 'package:mobile_scanner/mobile_scanner_web.dart';
import 'package:qr_training_obvio/core/constants/cache_constants.dart';
import 'package:qr_training_obvio/features/qr_scanner/data/models/qr_code_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


abstract class QrScannerLocalDataSource {
  Future<bool> validateQrCode(String rawValue);
}


class QrScannerLocalDataSourceImpl implements QrScannerLocalDataSource {

  SharedPreferences sharedPreferences;

  QrScannerLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<bool> validateQrCode(String rawValue) async{
    final jsonString = sharedPreferences.getString(cacheCorrectQRCodeList);

    bool res = false;

    if (jsonString != null) {
      List<QrCodeModel> qrCodeList = qrCodeModelListFromJson(jsonString);
      for (var element in qrCodeList) {
        if (element.rawValue == rawValue) {
          res = true;
        }
      }
    }

    return res;
  }

}