import 'package:dartz/dartz.dart';
import 'package:first_application/data/mapper/mapper.dart';
import 'package:first_application/data/network/failure.dart';
import 'package:first_application/data/network/requests.dart';
import 'package:first_application/domain/models.dart';
import 'package:first_application/domain/repository/repository.dart';

import '../data_source/remote_data_source.dart';
import '../network/network_info.dart';

class RepositoryImpl implements Repository{
 final RemoteDataSource _remoteDataSource;
 final NetworkInfo _networkInfo;
  RepositoryImpl(this._remoteDataSource,this._networkInfo);
  @override
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest)async {
    if(await _networkInfo.isConnected){
      final response=await _remoteDataSource.login(loginRequest);
      if(response.status==0){
        return Right(response.toDomain());
      }
      else{
        return Left(Failure(409,response.message?? "business error message"));
      }
    }
    else{
      return Left(Failure (501,"please check internet Connection"));
    }
  }
  
}