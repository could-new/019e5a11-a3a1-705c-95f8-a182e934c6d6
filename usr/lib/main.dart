import 'package:flutter/material.dart';

void main() {
  runApp(const TrendingApp());
}

class TrendingApp extends StatelessWidget {
  const TrendingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trending',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      initialRoute: '/',
      routes: {
        '/': (context) => const TrendingHomePage(),
      },
    );
  }
}

class TrendingHomePage extends StatefulWidget {
  const TrendingHomePage({super.key});

  @override
  State<TrendingHomePage> createState() => _TrendingHomePageState();
}

class _TrendingHomePageState extends State<TrendingHomePage> {
  final List<Map<String, dynamic>> _trendingItems = [
    {
      'title': 'CouldAI v2.0 Released',
      'description': 'The autonomous AI agent for building cross-platform apps.',
      'category': 'Technology',
      'metrics': '14.2k views',
      'icon': Icons.rocket_launch,
      'color': Colors.blueAccent,
    },
    {
      'title': 'Next-Gen Mobile UI Trends',
      'description': 'Exploring Glassmorphism, Neumorphism, and Material 3 design patterns.',
      'category': 'Design',
      'metrics': '8.9k views',
      'icon': Icons.brush,
      'color': Colors.pinkAccent,
    },
    {
      'title': 'Flutter on Desktop',
      'description': 'How to build high-performance Windows and macOS apps with Flutter.',
      'category': 'Development',
      'metrics': '6.4k views',
      'icon': Icons.desktop_mac,
      'color': Colors.indigo,
    },
    {
      'title': 'The Future of AI',
      'description': 'A deep dive into large language models and their impact on daily work.',
      'category': 'Technology',
      'metrics': '22.1k views',
      'icon': Icons.memory,
      'color': Colors.green,
    },
    {
      'title': 'Healthy Living Guide',
      'description': 'Top 10 daily habits for maintaining a healthy lifestyle.',
      'category': 'Lifestyle',
      'metrics': '5.1k views',
      'icon': Icons.favorite,
      'color': Colors.redAccent,
    },
    {
      'title': 'Top 5 Flutter State Management',
      'description': 'Comparing Provider, Riverpod, BLoC, GetX, and MobX in 2026.',
      'category': 'Development',
      'metrics': '11.3k views',
      'icon': Icons.code,
      'color': Colors.orange,
    },
    {
      'title': 'Mars Colonization Update',
      'description': 'Recent advancements in sustainable habitats on Mars.',
      'category': 'Science',
      'metrics': '19.8k views',
      'icon': Icons.public,
      'color': Colors.deepOrange,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trending Now', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isDesktop = constraints.maxWidth > 600;
          
          return SafeArea(
            child: isDesktop 
              ? GridView.builder(
                  padding: const EdgeInsets.all(16.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: constraints.maxWidth > 900 ? 3 : 2,
                    childAspectRatio: 2.5,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: _trendingItems.length,
                  itemBuilder: (context, index) {
                    return _buildTrendingCard(_trendingItems[index], index + 1);
                  },
                )
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  itemCount: _trendingItems.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: _buildTrendingCard(_trendingItems[index], index + 1),
                    );
                  },
                ),
          );
        }
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.whatshot),
            label: 'Trending',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildTrendingCard(Map<String, dynamic> item, int rank) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '#$rank',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade500,
                ),
              ),
              const SizedBox(width: 16),
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: item['color'].withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  item['icon'],
                  color: item['color'],
                  size: 32,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.surfaceContainerHighest,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            item['category'],
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ),
                        Text(
                          item['metrics'],
                          style: TextStyle(
                            fontSize: 12,
                            color: Theme.of(context).textTheme.bodySmall?.color,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      item['title'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item['description'],
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.8),
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
