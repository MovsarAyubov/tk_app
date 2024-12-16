

import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/tk_info.dart';


abstract class TkInfoRepository{
  Future<Either<Failure, TKInfo>> getTKInfo(); 
}


