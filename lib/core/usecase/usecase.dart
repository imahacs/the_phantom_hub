import 'package:fpdart/fpdart.dart';
import 'package:the_phantom_fx/core/error/failuers.dart';

abstract interface class UseCase<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call(Params params);
}
