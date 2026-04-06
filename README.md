# 🗂️ macOS SwiftData — Getting Started

A beginner-friendly macOS SwiftUI app introducing SwiftData — Apple's modern persistence framework — with a simple note-taking UI for create, read, and delete operations.

---

## 🤔 What this is

MacOSSwiftData is a minimal macOS app that teaches the core SwiftData concepts from scratch. It covers the `@Model` macro, the `.modelContainer` scene modifier, `@Query` for fetching and observing data, and `ModelContext` for inserting and deleting records — everything you need to add SwiftData persistence to a macOS app.

## ✅ Why you'd use it

- **`@Model` macro** — define your data model with a single annotation, no Core Data schema editor needed
- **`.modelContainer` modifier** — one-line persistent store setup in the `App` entry point
- **`@Query`** — auto-fetches and refreshes your view whenever the data changes
- **`ModelContext`** — insert and delete `@Model` objects with simple method calls
- **macOS-first** — SwiftData wired up in a macOS `WindowGroup`, not just iOS

## 📺 Watch on YouTube

[![Watch on YouTube](https://img.shields.io/badge/YouTube-Watch%20the%20Tutorial-red?style=for-the-badge&logo=youtube)](https://youtu.be/xbzAfXmdpcY)

> This project was built for the [NoahDoesCoding YouTube channel](https://www.youtube.com/@NoahDoesCoding97).

---

## 🚀 Getting Started

### 1. Clone the Repo
```bash
git clone https://github.com/NDCSwift/MacOSSwiftData.git
cd MacOSSwiftData
```

### 2. Open in Xcode
Double-click `MacOSSwiftData.xcodeproj`.

### 3. Set Your Development Team
TARGET → Signing & Capabilities → Team

### 4. Update the Bundle Identifier
Change `com.example.MyApp` to a unique identifier.

---

## 🛠️ Notes
- Requires macOS 14+ for SwiftData.
- For sorting and filtering with `#Query`, see the companion repo `MacOS-SwiftData-QueryAndSort`.

## 📦 Requirements
- Xcode 16+
- macOS 14+

📺 [Watch the guide on YouTube](https://youtu.be/xbzAfXmdpcY)
