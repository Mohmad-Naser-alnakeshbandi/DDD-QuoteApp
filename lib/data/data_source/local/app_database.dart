import 'package:dhbw_se2_quote_app/data/model/quote.dart';
import 'package:dhbw_se2_quote_app/data/data_source/local/DAO/quote_dao.dart';
import 'package:floor/floor.dart';

import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';

part 'app_database.g.dart';

@Database(version: 1, entities: [QuoteModel])
abstract class AppDatabase extends FloorDatabase {
  QuoteDao get quoteDAO;
}
