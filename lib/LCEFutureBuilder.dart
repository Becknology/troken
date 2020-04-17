import 'package:flutter/material.dart';

class LCEFutureBuilder<T> extends StatelessWidget {

  Future<T> future;
  AsyncWidgetBuilder<T> builder;

  LCEFutureBuilder({this.future, this.builder});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return builder(context, snapshot);
          } else if (snapshot.hasError) {
            return Center(
              child: Text("ERROR"),
            );
          } else {
            return loadingState(context);
          }
        }
    );
  }

  Widget loadingState(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

}

class LCEStreamBuilder<T> extends StatelessWidget {

  Stream<T> stream;
  AsyncWidgetBuilder<T> builder;

  LCEStreamBuilder({this.stream, this.builder});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
        stream: stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return builder(context, snapshot);
          } else if (snapshot.hasError) {
            return Center(
              child: Text("ERROR"),
            );
          } else {
            return loadingState(context);
          }
        }
    );
  }

  Widget loadingState(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

}