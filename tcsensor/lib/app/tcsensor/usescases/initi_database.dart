import 'package:dartz/dartz.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tcsensor/app/tcsensor/domain/errors/erros.dart';
import 'dart:io';

abstract class IGetFrabicantes {
  Future<Either<SqlLiteException, Database>> call();
}

class InitiDataBase implements IGetFrabicantes {
  @override
  Future<Either<SqlLiteException, Database>> call() async {
    return await initDatabase();
  }

  Future<Either<SqlLiteException, Database>> initDatabase() async {
    final databasePath = await getDatabasesPath();
    // print(databasePath);
    final path = join(databasePath, 'tcsensor.db');
    if (await Directory(dirname(path)).exists()) {
      return Right(await openDatabase(path, version: 1,
          onCreate: (Database db, int version) async {
        // When creating the db, create the table
        await db.execute(
            'CREATE TABLE fornecedores (id TEXT PRIMARY KEY, nome TEXT)');
        await db.execute('CREATE TABLE sysparam (kernel TEXT)');
      }));
    } else {
      try {
        await Directory(dirname(path)).create(recursive: true);
        return Right(await openDatabase(path, version: 1,
            onCreate: (Database db, int version) async {
          // When creating the db, create the table
          await db.execute(
              'CREATE TABLE fornecedores (id TEXT PRIMARY KEY, nome TEXT)');
          await db.execute('CREATE TABLE sysparam (kernel TEXT)');
        }));
      } catch (e) {
        throw Left(SqlLiteException(message: e.toString()));
      }
    }
  }
}
