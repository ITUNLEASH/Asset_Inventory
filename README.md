# Asset_Inventory
A relational database solution designed to track, manage, and audit corporate hardware assets across macOS and Windows ecosystems. This system ensures data integrity through strict validation rules and automates asset status reporting using generated columns.

🚀 Key Features
Multi-Platform Support: Dedicated schemas for macOS and Windows hardware configurations, including specific Dell Pro and MacBook models.

Automated Condition Reporting: Uses MySQL Generated Columns to automatically toggle asset health status ("Good" vs "Fair") based on a single boolean flag.

Data Validation: Implements Regular Expression (REGEXP) constraints to ensure Serial Numbers and Employee Numbers remain strictly numeric.

Hybrid Workforce Tracking: Built-in support for global teams with ENUM tracking for Remote (USA, LATAM, EMEA) and Headquarters locations.

Virtual Infrastructure: Tracks cloud-based assets including AWS EC2 and Azure VDI instances.

📊 Database Architecture
The system is comprised of three primary relational tables within the BRICORP_Asset_Inventory database:

1. Employee Information (Employee_Information)
The "Source of Truth" for personnel. It stores contact details, physical addresses, and unique identifiers.

Primary Key: EmployeeID

Validation: Strict numeric checks on Employee_Number.

2. MacOS Assets (MacOS_Assets)
Manages the fleet of Apple hardware.

Highlights: Specific support for 12" MacBook models (2015-2017) and automated warranty/condition tracking.

Automation: Asset_Condition is virtually generated, reducing manual data entry errors.

3. Windows Assets (Windows_Assets)
Manages the Dell Pro ecosystem, including Slim, Tower, Micro, and Rugged series.

Hardware Lifecycle: Tracks Purchase_Date and Asset_End_Date alongside specialized "End of Life" valuations.

Asset Categorization: Distinguishes between New Assets, Replacements, and specialized Developer Desktops.

🛠️ Technical Stack
Engine: MySQL

Platform: Developed and optimized for MySQL Workbench.

SQL Concepts Utilized: * ENUM for standardized data entry.

CHECK constraints with REGEXP.

VIRTUAL Generated Columns.

DATETIME and DATE temporal types.

📖 Usage
To initialize the database, run the scripts in the following order:

CREATE DATABASE and USE statements.

Employee_Information (to establish the primary keys).

MacOS_Assets and Windows_Assets.
