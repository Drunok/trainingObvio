import 'package:qr_training_obvio/features/qr_scanner/domain/entities/qr_code.dart';


class QrCodeModel extends QrCode {
  
  const QrCodeModel ({
    required String title,
    required String rawValue,
  }) : super(title: title, rawValue: rawValue);


  factory QrCodeModel.fromJson(Map<String, dynamic> json) {
    return QrCodeModel(
      title: json['title'], 
      rawValue: json['rawValue']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "rawValue": rawValue
    };
  }

}