# B2B Lead Ingestion & Enrichment Pipeline
## 📌 Project Overview
This repository showcases a fully automated, decoupled backend architecture designed to capture, enrich, and store B2B leads. Built with **n8n**, **PostgreSQL (Supabase)**, and **Slack APIs**, this project demonstrates my ability to design robust data pipelines, implement relational database architectures, and manage payload ingestion via Webhooks and REST APIs.

## 🏗️ Architecture & Workflow
The system processes incoming data payloads through a structured ETL (Extract, Transform, Load) flow:
1. **Ingestion (Webhook / Form Trigger):** The pipeline acts as an independent backend, receiving JSON payloads via a POST Webhook. A native form UI is also configured and available as a fallback trigger.
2. **Conditional Logic (Routing):** An IF node filters out non-corporate emails (e.g., Gmail) to ensure only highly-qualified B2B leads enter the database.
3. **Data Enrichment:** A custom node automatically injects business rules, assigning a default Lead Score and "NEW" status to the incoming prospect.
4. **Relational Database Insertion (Supabase):** 
   - **Companies Table:** Inserts the company data and generates a unique Primary Key (SERIAL), strictly enforcing data constraints (e.g., specific company size ENUMs).
   - **Leads Table:** Inserts the lead information utilizing the newly generated company ID as a Foreign Key, ensuring 3NF normalization and strict Referential Integrity.
5. **Real-time Alerting:** A Slack API integration dynamically formats the enriched data and sends an instant notification to "avisos" channel in Slack.

## 🛠️ Tech Stack & Skills Demonstrated
* **Workflow Automation & API Integration:** n8n, REST APIs, JSON data parsing.
* **Database Architecture:** PostgreSQL, Relational Data Modeling, Entity-Relationship, Foreign Keys, Unique Constraints, ENUMs.
* **Backend Concepts:** Decoupled systems, Webhooks, Error Debugging, Payload routing, Solid Principles.

## 💡 Conclusion & Future Scalability
Developing this pipeline represents a practical application of backend engineering concepts, combining robust database normalization with flexible automation to solve real-world business problems. Building this system allowed me to solidify my knowledge of decoupled architectures, API integrations, and strict data integrity within a production-ready, fault-tolerant environment. Furthermore, the architecture was designed with future scalability in mind, embracing the spirit of the Open/Closed SOLID principle. While the core ingestion and validation engine remains securely intact, its highly modular design is completely open for extension. New features—such as integrating a CRM, syncing with external marketing tools, or adding machine learning for advanced lead scoring—can be seamlessly plugged into the pipeline, allowing the automation to grow alongside business needs without disrupting the foundational infrastructure.
