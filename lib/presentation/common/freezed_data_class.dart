
import 'package:freezed_annotation/freezed_annotation.dart';
part 'freezed_data_class.freezed.dart';

@freezed
//with _$LoginObjet to know that this is freezed
class LoginObject with _$LoginObject{
  //factory because it's auto generated as we use @freezed
  factory LoginObject(String userName,String password) =_LoginPassword;

}