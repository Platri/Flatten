import 'dart:async';

import 'package:flatten/bloc/bloc_provider.dart';
import 'package:rxdart/rxdart.dart';

class CreateQrBloc implements BlocBase {
	String purpose;

	final BehaviorSubject<String> _purposeController = BehaviorSubject.seeded('company');
	Stream<String> get outPurpose =>_purposeController.stream;
	Sink<String> get inPurpose =>_purposeController.sink;

  @override
  void dispose() {
    _purposeController.close();
  }
}
