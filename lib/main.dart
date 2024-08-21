import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'stores/characters/characters_store.dart';
import 'views/favorito-screen.dart';
import 'views/inicio-screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<CharactersStore>(create: (_) => CharactersStore()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Recupera o CharactersStore do Provider
    final CharactersStore store =
        Provider.of<CharactersStore>(context, listen: false);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(store: store),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final CharactersStore store;

  const MyHomePage({Key? key, required this.store}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  // Lista de páginas que serão exibidas quando o usuário selecionar uma aba
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();

    // Inicializa a lista de páginas com o store passado via widget
    _pages = [
      InicioPage(store: widget.store),
      FavoritosPage(store: widget.store),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
