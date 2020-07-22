import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import './mainTheme.dart';
import './model/transaction.model.dart';
import './mock/transaction.mock.dart';
import './widgets/transaction_input.dart';
import './widgets/transaction_list.dart';
import './widgets/weekly_chart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [const Locale('pt', 'BR')],
      title: 'Me poupe!',
      theme: MainTheme().themeData,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  final List<Transaction> _transactions = TransactionMock().getTransactions();
  bool _showChart = false;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(state);
  }

  @override
  dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  List<Transaction> get _recentTransactions {
    return _transactions.where((element) {
      return element.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addTransaction(
      String titleValue, double amountValue, DateTime dateValue) {
    final newTransaction = Transaction(
        id: DateTime.now().toString(),
        amount: amountValue,
        title: titleValue,
        date: dateValue);

    setState(() {
      this._transactions.add(newTransaction);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      this._transactions.removeWhere((element) => element.id == id);
    });
  }

  void _toggleTransactionInput(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: TransactionInput(_addTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  List<Widget> _buildLandscapeContent(
    ThemeData _theme,
    MediaQueryData _mediaQuery,
    double _appBarHeight,
    Widget _expensesWidget,
  ) {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Mostrar Gráfico',
            style: _theme.textTheme.headline6,
          ),
          Switch.adaptive(
              activeColor: _theme.accentColor,
              value: _showChart,
              onChanged: (val) {
                setState(() => _showChart = val);
              })
        ],
      ),
      _showChart
          ? Container(
              height: (_mediaQuery.size.height -
                      _appBarHeight -
                      _mediaQuery.padding.top) *
                  0.7,
              child: WeeklyChart(_recentTransactions))
          : _expensesWidget
    ];
  }

  List<Widget> _buildPortraitContent(
    MediaQueryData _mediaQuery,
    double _appBarHeight,
    Widget _expensesWidget,
  ) {
    return [
      Container(
        height: (_mediaQuery.size.height -
                _appBarHeight -
                _mediaQuery.padding.top) *
            0.3,
        child: WeeklyChart(_recentTransactions),
      ),
      _expensesWidget
    ];
  }

  Widget _buildAppBar(ThemeData _theme, String _appTitle) {
    return Platform.isIOS
        ? _buildCupertinoAppBar(_appTitle)
        : _buildMaterialAppBar(_theme, _appTitle);
  }

  PreferredSizeWidget _buildCupertinoAppBar(String _appTitle) {
    return CupertinoNavigationBar(
      middle: Text(_appTitle),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          GestureDetector(
            child: const Icon(CupertinoIcons.add),
            onTap: () => _toggleTransactionInput(context),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildMaterialAppBar(ThemeData _theme, String _appTitle) {
    return AppBar(
      title: Text(_appTitle),
      backgroundColor: _theme.primaryColor,
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () => _toggleTransactionInput(context),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context);
    final _theme = Theme.of(context);
    final _isLandscape = _mediaQuery.orientation == Orientation.landscape;
    final _appTitle = 'Me Poupe\$!';

    final PreferredSizeWidget _appBar = _buildAppBar(_theme, _appTitle);

    final _expensesWidget = Container(
        height: (_mediaQuery.size.height -
                _appBar.preferredSize.height -
                _mediaQuery.padding.top) *
            0.7,
        child: TransactionList(_transactions, _deleteTransaction));

    final _body = SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (_isLandscape)
              ..._buildLandscapeContent(
                _theme,
                _mediaQuery,
                _appBar.preferredSize.height,
                _expensesWidget,
              ),
            if (!_isLandscape)
              ..._buildPortraitContent(
                _mediaQuery,
                _appBar.preferredSize.height,
                _expensesWidget,
              ),
          ],
        ),
      ),
    );

    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: _body,
            navigationBar: _appBar,
          )
        : Scaffold(
            appBar: _appBar,
            body: _body,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Platform.isIOS
                ? Container()
                : FloatingActionButton(
                    child: const Icon(Icons.add),
                    onPressed: () => _toggleTransactionInput(context),
                  ),
          );
  }
}
