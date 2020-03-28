import 'dart:async';
import 'package:flatten/bloc/bloc_provider.dart';
import 'package:rxdart/rxdart.dart';


class HS_Info_Bloc implements BlocBase{
  @override
  void dispose() {
    // TODO: implement dispose
    _controller.close();
  }
  Stream get currentState => _controller.stream;
   StreamController _controller = StreamController<bool>.broadcast();
   bool _currentState = true;
   void onTap(){
     _controller.stream;
     _currentState = !_currentState;
     _controller.add(_currentState);
   }
}