import 'package:flutter/material.dart';

void main() {
  runApp(const MyCVApp());
}

class MyCVApp extends StatelessWidget {
  const MyCVApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Professional CV',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
        fontFamily: 'Roboto', // Clean, professional ATS-friendly font
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const CVScreen(),
      },
    );
  }
}

class CVScreen extends StatelessWidget {
  const CVScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 850),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
            padding: const EdgeInsets.all(48.0),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  const SizedBox(height: 24),
                  _buildSectionTitle('CAREER OBJECTIVE'),
                  const Text(
                    'Detail-oriented and highly motivated Chemist with a strong background in analytical chemistry, quality control, and laboratory safety protocols. Seeking to leverage technical expertise, rigorous testing methodologies, and proficiency in data management to contribute to innovative pharmaceutical research and development.',
                    style: TextStyle(fontSize: 14, height: 1.5),
                  ),
                  const SizedBox(height: 20),
                  _buildSectionTitle('SKILLS'),
                  _buildSkillRow([
                    'Analytical Chemistry & Quality Control (QC)',
                    'Microsoft Excel (Advanced Data Analysis)',
                    'Microsoft Office Suite',
                    'Spectroscopy (UV-Vis, FTIR) & Chromatography (HPLC)',
                    'Good Laboratory Practices (GLP)',
                    'Technical Reporting & Documentation',
                  ]),
                  const SizedBox(height: 20),
                  _buildSectionTitle('WORK EXPERIENCE'),
                  _buildExperienceItem(
                    title: 'Junior Analytical Chemist',
                    company: 'PharmaTech Solutions Inc.',
                    date: 'Jun 2022 – Present',
                    details: [
                      'Performed routine and non-routine analysis of raw materials, in-process samples, and finished pharmaceutical products.',
                      'Utilized MS Excel to process and analyze complex laboratory data, generating comprehensive reports for the QA team.',
                      'Maintained and calibrated laboratory equipment ensuring compliance with industry standards and safety protocols.',
                    ],
                  ),
                  const SizedBox(height: 12),
                  _buildExperienceItem(
                    title: 'Laboratory Assistant',
                    company: 'University Research Labs',
                    date: 'Sep 2020 – May 2022',
                    details: [
                      'Assisted senior researchers in organic synthesis and chemical characterization projects.',
                      'Managed chemical inventory and ensured proper disposal of hazardous waste materials.',
                    ],
                  ),
                  const SizedBox(height: 20),
                  _buildSectionTitle('EDUCATION'),
                  _buildExperienceItem(
                    title: 'Bachelor of Science in Chemistry',
                    company: 'State University of Science',
                    date: 'Graduated: May 2022',
                    details: [
                      'Relevant Coursework: Analytical Chemistry, Organic Chemistry, Biochemistry, Instrumental Analysis.',
                      'GPA: 3.8/4.0',
                    ],
                  ),
                  const SizedBox(height: 20),
                  _buildSectionTitle('INTERNSHIPS & PROJECTS'),
                  _buildExperienceItem(
                    title: 'Quality Control Intern',
                    company: 'BioHealth Pharmaceuticals',
                    date: 'Summer 2021',
                    details: [
                      'Supported the QC team in stability testing of new drug formulations.',
                      'Streamlined data entry processes using Microsoft Office and Excel macros, reducing reporting time by 15%.',
                    ],
                  ),
                  const SizedBox(height: 20),
                  _buildSectionTitle('CERTIFICATIONS & LANGUAGES'),
                  const Text(
                    '• OSHA Laboratory Standard Training Certification\n'
                    '• Good Manufacturing Practice (GMP) Basics\n'
                    '• Languages: English (Native), Spanish (Conversational)',
                    style: TextStyle(fontSize: 14, height: 1.5),
                  ),
                  const SizedBox(height: 20),
                  _buildSectionTitle('ACHIEVEMENTS & HOBBIES'),
                  const Text(
                    '• Achievements: Dean\\'s List (2020 - 2022), Outstanding Undergraduate Research Award (2022).\n'
                    '• Hobbies: Scientific journal reading, hiking, and amateur photography.',
                    style: TextStyle(fontSize: 14, height: 1.5),
                  ),
                  const SizedBox(height: 20),
                  _buildSectionTitle('REFERENCES'),
                  const Text(
                    'Available upon request.',
                    style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'JANE DOE',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 16,
          runSpacing: 8,
          children: [
            _buildContactInfo(Icons.phone, '+1 (555) 123-4567'),
            _buildContactInfo(Icons.email, 'jane.doe@email.com'),
            _buildContactInfo(Icons.location_on, '123 Science Way, Lab City, TX'),
          ],
        ),
        const SizedBox(height: 8),
        const Divider(color: Colors.black87, thickness: 1.5),
      ],
    );
  }

  Widget _buildContactInfo(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: Colors.black54),
        const SizedBox(width: 6),
        Text(text, style: const TextStyle(fontSize: 14, color: Colors.black87)),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 4),
        const Divider(color: Colors.black38, thickness: 1),
        const SizedBox(height: 8),
      ],
    );
  }

  Widget _buildSkillRow(List<String> skills) {
    return Wrap(
      spacing: 16,
      runSpacing: 8,
      children: skills.map((skill) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('• ', style: TextStyle(fontWeight: FontWeight.bold)),
          Text(skill, style: const TextStyle(fontSize: 14)),
        ],
      )).toList(),
    );
  }

  Widget _buildExperienceItem({
    required String title,
    required String company,
    required String date,
    required List<String> details,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              date,
              style: const TextStyle(fontSize: 14, color: Colors.black54, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        const SizedBox(height: 2),
        Text(
          company,
          style: const TextStyle(fontSize: 14, fontStyle: FontStyle.italic, color: Colors.black87),
        ),
        const SizedBox(height: 6),
        ...details.map((detail) => Padding(
          padding: const EdgeInsets.only(bottom: 4.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('•  ', style: TextStyle(fontSize: 14)),
              Expanded(child: Text(detail, style: const TextStyle(fontSize: 14, height: 1.4))),
            ],
          ),
        )),
      ],
    );
  }
}
