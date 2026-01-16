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
        fontFamily: 'Roboto', 
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
  final double _opacity = 1.0; 

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
                    const SizedBox(height: 30),
                    _buildPersonalInfoGrid(),
                    const SizedBox(height: 40),
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
          "毕业于上海交通大学信息安全工程专业，信息安全、流程挖掘与人工智能领域技术专家。曾任职于 Symantec，参与创办秒针系统，并在多家人工智能、工业互联网及企业数字化公司担任首席技术官。长期从事分布式系统、流程自动化与智能体相关技术研发。",
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

  Widget _buildPersonalInfoGrid() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "PERSONAL PROFILE",
            style: TextStyle(
              color: Colors.white.withOpacity(0.4),
              fontSize: 12,
              letterSpacing: 1.5,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: _buildInfoItem("Education", "SJTU 上海交大")),
              Expanded(child: _buildInfoItem("Birth", "1984.04.15")),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: _buildInfoItem("Hometown", "Mudanjiang, CN")),
              Expanded(child: _buildInfoItem("Role", "Founder & CTO")),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: const Color(0xFF00E5FF).withOpacity(0.7),
            fontSize: 11,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildAchievementsList() {
    final achievements = [
      "全国信息学奥林匹克竞赛一等奖",
      "中国流程挖掘技术第一人",
      "VR 家居设计软件技术开创者",
      "CouldAI 创始人 (AI App Builder)",
      "Google Camp 全球首家学生社团创办人",
      "上海交通大学联读班 / 学生会主席",
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
          description: "专注于通用智能体与 AI 编程平台。2025年8月开发完成世界首个生成跨平台原生应用的 AI App Builder。11月正式发布全球首个基于 Flutter 的 AI 编程平台，实现一键发布至 App Store 及 Google Play。",
          isFirst: true,
          isActive: true,
        ),
        TimelineItem(
          year: "2021 - 2024",
          title: "九科信息 (Jiuke Info)",
          role: "CTO",
          description: "孵化于招商局集团。开发国内首个流程挖掘算法及产品，主导研发企业级GUI智能体 bit-Agent。服务200亿以上营收规模大型企业上百家，推动业务流程走向真正的智能自动化。",
        ),
        TimelineItem(
          year: "2016 - 2021",
          title: "新格尔人居 (Thinkerx)",
          role: "CTO",
          description: "工业互联网独角兽。独自开发 0.1 秒排版优化算法（行业水平5-30分钟），服务超过142万家商家。整合设计渲染、拆单下料及物流管理，实现全屋定制前后端一体化。",
        ),
        TimelineItem(
          year: "2011 - 2016",
          title: "VR Home Platform",
          role: "Founder",
          description: "创办世界首个VR整体家装平台。基于游戏引擎开发家居VR设计软件，集合谷居VR、谷居网等模块。公司最高估值5亿元，拥有15万入驻设计师及100+城市运营中心。",
        ),
        TimelineItem(
          year: "2007 - 2011",
          title: "Miaozhen / Symantec",
          role: "Co-Founder / Engineer",
          description: "参与创办秒针系统（后明略科技），日处理1000亿次PV，发展为亚太最大互联网广告公司（2025年港交所上市，市值420亿）。早年任职 Symantec 开发企业级诺顿安全产品。",
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
