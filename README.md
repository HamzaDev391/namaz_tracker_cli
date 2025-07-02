# 🕌 Prayer(Salah) Tracker CLI App(Dart)

A simple and efficient **command-line app** built in **Dart** to help users **log, view, and manage their Salah (Namaz)**. Supports multiple users, date filtering, and status summaries — all through a clean text-based interface.

---

## 📦 Features

✅ Multi-user support  
✅ Log daily Salah (Fajr, Dhuhr, Asr, Maghrib, Isha)  
✅ Mark Salah as `offered`, `missed`, or `late`  
✅ View Salah history  
✅ Filter logs by specific date  
✅ Summary count (offered / missed / late)  
✅ Secure: personal logs are kept separate  
✅ Lightweight and file-based – no database needed

---

## 🛠 Tech Stack

- **Language:** Dart
- **Platform:** Command-line Interface (CLI)
- **Storage:** Local `.txt` files (`users.txt`, `namaz_log.txt`)
- **Concepts Used:**
  - `async/await` and Futures
  - Exception handling
  - File I/O (`dart:io`)
  - Modular Dart structure (`.dart` files)

---

## 🚀 Getting Started

### 1. Clone this repo

```bash
git clone https://github.com/YOUR_USERNAME/namaz_tracker_cli.git
cd namaz_tracker_cli
2. Run the app
Make sure Dart is installed. Then:

dart run main.dart

📂 Folder Structure

namaz_tracker_cli/
├── main.dart              # Entry point (CLI menu)
├── logger.dart            # Logic to record a Salah
├── viewer.dart            # View history + summary + filter by date
├── clear_logs.dart        # Clear user's logs
├── greetings.dart         # Greeting logic
├── users.dart             # Handles user login/signup
├── users.txt              # Registered users (auto-managed)
├── namaz_log.txt          # Salah logs (auto-managed)
└── .gitignore             # Hides logs from version control

🔐 Privacy Note

This CLI app uses local text files to store logs. The .gitignore ensures that namaz_log.txt and users.txt are not pushed to GitHub, preserving privacy.

🌟 Ideal For

Dart portfolio projects
Fiverr/Upwork CLI tool samples
Practicing file I/O, async, and clean modular code in Dart
Daily personal Salah tracking

📮 Contribute or Connect

Want to improve this? Add backup/export options?

Feel free to fork or suggest!

📧 Contact: Hamza.Dev391@gmail.com

📜 License

This project is free to use under the MIT License.
