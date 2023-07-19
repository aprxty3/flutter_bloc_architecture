import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_architecture/data/repositories/advice_repo_impl.dart';
import 'package:flutter_bloc_architecture/domain/entities/advice_entity.dart';
import 'package:flutter_bloc_architecture/domain/failures/failures.dart';
import 'package:flutter_bloc_architecture/domain/usecases/advice_usecases.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:mockito/annotations.dart';

import 'advice_usecase_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AdviceRepoImpl>()])
void main() {
  group('Advice Usecase', () {
    group('ketika mereturn AdviceEntity', () {
      test('ketika AdviceRepoImp return AdviceModel', () async {
        final mockAdviceRepoImp = MockAdviceRepoImpl();
        final adviceUseCaseUnderTest =
            AdviceUseCases(adviceRepo: mockAdviceRepoImp);

        when(mockAdviceRepoImp.getAdviceFromDatasource()).thenAnswer(
            (realInvocation) => Future.value(
                const Right(AdviceEntity(advice: 'test', id: 42))));
        final result = await adviceUseCaseUnderTest.getAdvice();

        expect(result.isLeft(), false);
        expect(result.isRight(), true);
        expect(
            result,
            const Right<Failure, AdviceEntity>(
                AdviceEntity(advice: 'test', id: 42)));

        verify(mockAdviceRepoImp.getAdviceFromDatasource()).called(1);
        verifyNoMoreInteractions(mockAdviceRepoImp);
      });
    });
    group('ketika ada suatu kesalahan', () {
      test('ketika ada kejadian ServerFail', () async {
        final mockAdviceRepoImp = MockAdviceRepoImpl();
        final adviceUseCaseUnderTest =
            AdviceUseCases(adviceRepo: mockAdviceRepoImp);

        when(mockAdviceRepoImp.getAdviceFromDatasource()).thenAnswer(
            (realInvocation) => Future.value(Left(ServerFailure())));
        final result = await adviceUseCaseUnderTest.getAdvice();

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, AdviceEntity>(ServerFailure()));
        verify(mockAdviceRepoImp.getAdviceFromDatasource()).called(1);
        verifyNoMoreInteractions(mockAdviceRepoImp);
      });
    });
  });
}
