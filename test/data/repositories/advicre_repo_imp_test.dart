import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_architecture/data/datasources/advice_remote_datasource.dart';
import 'package:flutter_bloc_architecture/data/exceptions/exceptions.dart';
import 'package:flutter_bloc_architecture/data/models/advice_model.dart';
import 'package:flutter_bloc_architecture/data/repositories/advice_repo_impl.dart';
import 'package:flutter_bloc_architecture/domain/entities/advice_entity.dart';
import 'package:flutter_bloc_architecture/domain/failures/failures.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'advicre_repo_imp_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AdviceRemoteDatasourceImpl>()])
void main() {
  group('Advice Repo Imp', () {
    group('apakah mereturn ke Entity', () {
      test('ketika AdviceRemoteDataSoure return AdviceModel', () async {
        final mockAdviceRemoteDataSource = MockAdviceRemoteDatasourceImpl();
        final adviceRepoImpUnderTest =
            AdviceRepoImpl(adviceRemoteDatasource: mockAdviceRemoteDataSource);

        when(mockAdviceRemoteDataSource.getRandomAdviceFromApi()).thenAnswer(
            (realInvocation) =>
                Future.value(AdviceModel(advice: 'test', id: 42)));

        final result = await adviceRepoImpUnderTest.getAdviceFromDatasource();

        expect(result.isLeft(), false);
        expect(result.isRight(), true);
        expect(result,
            Right<Failure, AdviceModel>(AdviceModel(advice: 'test', id: 42)));

        verify(mockAdviceRemoteDataSource.getRandomAdviceFromApi());
        verifyNoMoreInteractions(mockAdviceRemoteDataSource);
      });
    });

    group('ketika return nya salah (false)', () {
      test('Server Failure ketika ServerException Occurs', () async {
        final mockAdviceRemoteDataSource = MockAdviceRemoteDatasourceImpl();
        final adviceRepoImpUnderTest =
            AdviceRepoImpl(adviceRemoteDatasource: mockAdviceRemoteDataSource);

        when(mockAdviceRemoteDataSource.getRandomAdviceFromApi())
            .thenThrow(ServerException());
        final result = await adviceRepoImpUnderTest.getAdviceFromDatasource();
        expect(result.isLeft(), true);
        expect(result.isRight(), false);

        expect(result, Left<Failure, AdviceEntity>(ServerFailure()));
      });

      test('General Failure ketika GeneralException Occurs', () async {
        final mockAdviceRemoteDataSource = MockAdviceRemoteDatasourceImpl();
        final adviceRepoImpUnderTest =
            AdviceRepoImpl(adviceRemoteDatasource: mockAdviceRemoteDataSource);

        when(mockAdviceRemoteDataSource.getRandomAdviceFromApi())
            .thenThrow(const SocketException('test'));
        final result = await adviceRepoImpUnderTest.getAdviceFromDatasource();
        expect(result.isLeft(), true);
        expect(result.isRight(), false);

        expect(result, Left<Failure, AdviceEntity>(GeneralFailure()));
      });
    });
  });
}
