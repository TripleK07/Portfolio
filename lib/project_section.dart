import 'package:flutter/material.dart';
import 'package:portfolio/widgets/project_card.dart';
import 'package:portfolio/widgets/responsive.dart';

class ProjectSection extends StatelessWidget {
  const ProjectSection({Key? key}) : super(key: key);

  List<Map<String, String>> get projects => [
        {
          "title": "RMA - Return Merchandise Authorization",
          "description":
              "The RMA system supports end-to-end product return processes including return requests, approvals, refunds, replacements, and integration with Oracle Fusion for financial and inventory management.",
        },
        {
          "title": "MOH (HALP) – Ministry of Health",
          "description":
              "The HALP – Healthcare Application & Licensing Portal is the new licensing system that will replace the current e-Licensing (eLIS) system, for all new licence applications, renewals and manage them.",
        },
        {
          "title": "CCNB - Customer Care and Billing",
          "description":
              "Oracle software for billing processes of utility companies, supports one to many utility service types, and handles the complexities associated with a utility's business processes.",
        },
        {
          "title": "Oracle Core Banking",
          "description":
              "An end-to-end enterprise digital solution for banks, enable them to deliver on their digital strategies including launch new digital brands, digitize processes, modernize digital experiences.",
        },
        {
          "title": "CMHL - ERP, POS and BI SOLUTION",
          "description":
              "Developed and implemented in-house ERP and POS systems for thousands of customers, streamlining sales, forecasting, and centralized data management."
        }
      ];

  List<Map<String, String>> get otherProjects => [
        {
          "title": "GCS - Green Certificate System",
          "description":
              "Integrated system for GENECO’s retail system, SCRM and CCNB in order to award certificates to customers who care go-green plan.",
        },
        {
          "title": "Transportation Management System",
          "description":
              "The system efficiently manages transportation companies handling the shipment of goods to their designated destinations including order management, payment processing, and expense tracking."
        },
        {
          "title": "Finance",
          "description":
              "A compact software application designed to record and process accounting transactions. It's organized into functional modules, including accounts payable, accounts receivable, and general ledger, all integrated with MYOB for seamless reference and operation."
        },
        {
          "title": "E-Learning System",
          "description":
              "A system for students to self-learn by watching lesson videos without lecturers including examination, result grading and reports."
        }
      ];

  Widget desktopLayout(context) {
    return Column(
      children: [
        Text(
          "Featured Projects",
          style: Theme.of(context).textTheme.headline3,
        ),
        SizedBox(height: 20),
        Column(
          children: [
            ...projects.map((project) => ProjectCard(
                  title: project["title"]!,
                  description: project["description"]!,
                )),
            SizedBox(height: 20),
            Text(
              "Other Projects",
              style: Theme.of(context).textTheme.headline3,
            ),
            ...otherProjects.map((project) => ProjectCard(
                  title: project["title"]!,
                  description: project["description"]!,
                )),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30, bottom: 30),
      width: double.infinity,
      child: Responsive(
        mobile: desktopLayout(context),
        tablet: desktopLayout(context),
        desktop: desktopLayout(context),
      ),
    );
  }
}
