import 'package:dhbw_se2_quote_app/domain/entities/quote.dart';
import 'package:equatable/equatable.dart';

abstract class LocalQuotsEvent extends Equatable {
  final QuoteEntity? quots;

  const LocalQuotsEvent({this.quots});

  @override
  List<Object> get props => [quots!];
}

class GetSavedQuots extends LocalQuotsEvent {
  const GetSavedQuots();
}

class RemoveQuots extends LocalQuotsEvent {
  const RemoveQuots(QuoteEntity quots) : super(quots: quots);
}

class SaveQuots extends LocalQuotsEvent {
  const SaveQuots(QuoteEntity quots) : super(quots: quots);
}
