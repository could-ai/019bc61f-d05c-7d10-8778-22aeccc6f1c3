import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lancelot Luan Profile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0A0A0A),
        primaryColor: const Color(0xFF00E5FF),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF00E5FF),
          secondary: Color(0xFFFFD700),
          surface: Color(0xFF1E1E1E),
          background: Color(0xFF0A0A0A),
        ),
        useMaterial3: true,
        fontFamily: 'Roboto', // Using default, but styled heavily
      ),
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ScrollController _scrollController = ScrollController();
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _opacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          _buildSliverAppBar(),
          SliverToBoxAdapter(
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 800),
              opacity: _opacity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    _buildIntroSection(),
                    const SizedBox(height: 40),
                    _buildStatsGrid(),
                    const SizedBox(height: 50),
                    const SectionHeader(title: "ACHIEVEMENTS", subtitle: "主要成就"),
                    const SizedBox(height: 20),
                    _buildAchievementsList(),
                    const SizedBox(height: 50),
                    const SectionHeader(title: "CAREER JOURNEY", subtitle: "人物经历"),
                    const SizedBox(height: 20),
                    _buildTimeline(),
                    const SizedBox(height: 80),
                    _buildFooter(),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 300.0,
      floating: false,
      pinned: true,
      backgroundColor: const Color(0xFF0A0A0A),
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.only(left: 20, bottom: 16),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Lancelot Luan',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
                letterSpacing: 1.2,
                shadows: [
                  Shadow(
                    offset: const Offset(0, 2),
                    blurRadius: 4.0,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ],
              ),
            ),
            Text(
              '栾添昊',
              style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
        background: Stack(
          fit: StackFit.expand,
          children: [
            // Abstract Tech Background
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF1A237E), // Deep Blue
                    Color(0xFF000000), // Black
                  ],
                ),
              ),
            ),
            // Decorative Circles
            Positioned(
              top: -50,
              right: -50,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFF00E5FF).withOpacity(0.1),
                ),
              ),
            ),
            Positioned(
              bottom: 50,
              left: -30,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFFFFD700).withOpacity(0.05),
                ),
              ),
            ),
            // Gradient Overlay
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    const Color(0xFF0A0A0A).withOpacity(0.8),
                    const Color(0xFF0A0A0A),
                  ],
                  stops: const [0.0, 0.7, 1.0],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIntroSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Founder of CouldAI / Serial Entrepreneur",
          style: TextStyle(
            color: const Color(0xFF00E5FF),
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.0,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          "毕业于上海交通大学信息安全工程专业，信息安全、流程挖掘与人工智能领域技术专家。曾任职于 Symantec，参与创办秒针系统，并在多家人工智能、工业互联网及企业数字化公司担任首席技术官。",
          style: TextStyle(
            color: Colors.white.withOpacity(0.8),
            fontSize: 15,
            height: 1.6,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }

  Widget _buildStatsGrid() {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 2.5,
      children: [
        _buildStatCard("EDUCATION", "SJTU 上海交大", Icons.school_outlined),
        _buildStatCard("FOCUS", "AI & Security", Icons.psychology_outlined),
        _buildStatCard("EXPERIENCE", "18+ Years", Icons.history_edu_outlined),
        _buildStatCard("LOCATION", "Shanghai / Global", Icons.public_outlined),
      ],
    );
  }

  Widget _buildStatCard(String label, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF00E5FF), size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.4),
                    fontSize: 10,
                    letterSpacing: 1.0,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAchievementsList() {
    final achievements = [
      "全国信息学奥林匹克竞赛一等奖",
      "中国流程挖掘技术第一人",
      "VR 家居设计软件技术开创者",
      "CouldAI 创始人 (AI App Builder)",
    ];

    return Column(
      children: achievements.map((text) => Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: GlassCard(
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFD700).withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.emoji_events, color: Color(0xFFFFD700), size: 20),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      )).toList(),
    );
  }

  Widget _buildTimeline() {
    return Column(
      children: [
        TimelineItem(
          year: "2024 - Present",
          title: "CouldAI Inc.",
          role: "Founder & CEO",
          description: "专注于通用智能体与 AI 编程平台方向。开发世界首个可以生成跨平台原生应用的 AI App Builder，实现基于云端的浏览器自动化技术。",
          isFirst: true,
          isActive: true,
        ),
        TimelineItem(
          year: "2021 - 2024",
          title: "九科信息 (Jiuke Info)",
          role: "CTO",
          description: "孵化于招商局集团。开发国内首个流程挖掘算法及产品，主导研发企业级GUI智能体bit-Agent，服务200亿以上营收规模大型企业上百家。",
        ),
        TimelineItem(
          year: "2016 - 2021",
          title: "新格尔人居 (Thinkerx)",
          role: "CTO",
          description: "工业互联网独角兽。独自开发0.1秒排版优化算法，服务超过142万家商家，实现全屋定制前后端一体化。",
        ),
        TimelineItem(
          year: "2011 - 2016",
          title: "VR Home Platform",
          role: "Founder",
          description: "创办世界首个VR整体家装平台。基于游戏引擎开发家居VR设计软件，公司最高估值5亿元。",
        ),
        TimelineItem(
          year: "2007 - 2011",
          title: "Miaozhen / Symantec",
          role: "Co-Founder / Engineer",
          description: "参与创办秒针系统（后明略科技），日处理1000亿次PV。早年任职Symantec从事企业级安全产品开发。",
          isLast: true,
        ),
      ],
    );
  }

  Widget _buildFooter() {
    return Center(
      child: Column(
        children: [
          const Icon(Icons.fingerprint, color: Colors.white24, size: 40),
          const SizedBox(height: 16),
          Text(
            "DESIGNED BY COULDAI",
            style: TextStyle(
              color: Colors.white.withOpacity(0.3),
              fontSize: 10,
              letterSpacing: 2.0,
            ),
          ),
        ],
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const SectionHeader({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
        const SizedBox(width: 12),
        Padding(
          padding: const EdgeInsets.only(bottom: 2),
          child: Text(
            subtitle,
            style: TextStyle(
              color: Colors.white.withOpacity(0.4),
              fontSize: 12,
            ),
          ),
        ),
        const Spacer(),
        Container(
          height: 1,
          width: 60,
          color: const Color(0xFF00E5FF),
        ),
      ],
    );
  }
}

class GlassCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;

  const GlassCard({super.key, required this.child, this.padding});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: padding ?? const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white.withOpacity(0.08)),
          ),
          child: child,
        ),
      ),
    );
  }
}

class TimelineItem extends StatelessWidget {
  final String year;
  final String title;
  final String role;
  final String description;
  final bool isFirst;
  final bool isLast;
  final bool isActive;

  const TimelineItem({
    super.key,
    required this.year,
    required this.title,
    required this.role,
    required this.description,
    this.isFirst = false,
    this.isLast = false,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline Line & Dot
          SizedBox(
            width: 40,
            child: Column(
              children: [
                if (!isFirst) Expanded(child: Container(width: 2, color: Colors.white12)),
                Container(
                  margin: EdgeInsets.only(top: isFirst ? 0 : 0, bottom: 0),
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    color: isActive ? const Color(0xFF00E5FF) : const Color(0xFF1E1E1E),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isActive ? const Color(0xFF00E5FF).withOpacity(0.3) : Colors.white24,
                      width: 4,
                    ),
                    boxShadow: isActive ? [
                      BoxShadow(
                        color: const Color(0xFF00E5FF).withOpacity(0.5),
                        blurRadius: 8,
                        spreadRadius: 2,
                      )
                    ] : [],
                  ),
                ),
                if (!isLast) Expanded(child: Container(width: 2, color: Colors.white12)),
              ],
            ),
          ),
          const SizedBox(width: 16),
          // Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: isActive ? const Color(0xFF00E5FF).withOpacity(0.1) : Colors.white.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      year,
                      style: TextStyle(
                        color: isActive ? const Color(0xFF00E5FF) : Colors.white54,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    role,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 13,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
