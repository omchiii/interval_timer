import 'package:flutter/material.dart';
import 'package:interval_timer/providers/quoteProvider.dart';
import 'package:provider/provider.dart';
import 'package:interval_timer/utils/sizeConfig.dart';

class Quote extends StatefulWidget {
  @override
  _QuoteState createState() => _QuoteState();
}

class _QuoteState extends State<Quote> {
  @override
  void initState() {
    super.initState();
    context.read<QuoteProvider>().fetchQuote();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 2),
      child: Text(
        '${context.select((QuoteProvider q) => q.quote)}',
        style: TextStyle(
            color: Color.fromRGBO(0, 0, 0, 0.5), fontStyle: FontStyle.italic),
      ),
    );
  }
}
