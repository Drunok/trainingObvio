import 'package:equatable/equatable.dart';




class QrCode extends Equatable {
  final String rawValue;
  final String title;

  const QrCode({required this.title, required this.rawValue});
  
  @override
  List<Object?> get props => [rawValue, title];
}