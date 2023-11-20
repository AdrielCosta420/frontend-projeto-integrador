import 'package:dartz/dartz.dart';

class Result<Failure, Success> {
  final Either<Failure, Success> _either;

  Result(this._either);

  factory Result.success(Success value) => Result(Right(value));

  factory Result.failure(Failure failure) => Result(Left(failure));

  R fold<R>(R Function(Failure) onFailure, R Function(Success) onSuccess) {
    return _either.fold(onFailure, onSuccess);
  }
}

class Failure {
  final Object object;

  Failure(this.object);
}

class Success {
  final Object object;

  Success(this.object);
}
