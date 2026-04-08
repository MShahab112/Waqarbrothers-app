# 💼 Waqar Brothers Daily Account Book

A modern desktop accounting application built with Flask, designed for daily business tracking.

---

## 🚀 Features

* 📊 Daily Recovery & Expense Tracking
* 💎 Modern UI (Glassmorphism + Animations)
* ⚡ Fast and simple workflow
* 📁 Export & reporting features
* 🖥️ Desktop installer (.exe)

---

## 🧠 Tech Stack

* Python (Flask)
* HTML, CSS (Custom UI)
* PyInstaller (EXE build)
* Inno Setup (Installer)

---

## 🛠️ Run Locally

```bash
pip install -r requirements.txt
python app.py
```

---

## ⚙️ Build EXE

```bash
pyinstaller --onefile --noconsole --name WaqarBrothers --add-data "templates;templates" --add-data "static;static" app.py
```

---

## 📦 Installer

Use Inno Setup with `installer.iss` to generate setup file.

---

## 🎯 Status

Currently under active development and testing.

---

## 👨‍💻 Author

Waqar & Brothers
