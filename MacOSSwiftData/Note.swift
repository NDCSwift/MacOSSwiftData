//
    // Project: MacOSSwiftData
    //  File: Note.swift
    //  Created by Noah Carpenter
    //  🐱 Follow me on YouTube! 🎥
    //  https://www.youtube.com/@NoahDoesCoding97
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Fun Fact: Cats have five toes on their front paws, but only four on their back paws! 🐾
    //  Dream Big, Code Bigger
    


import SwiftData
import Foundation

/// A SwiftData-backed note model representing a simple text note.
/// Contains a title, body, creation date, and a unique identifier.
@Model
final class Note {
    /// Stable unique identifier for the note.
    var id: UUID
    /// Short, human-readable title displayed in the sidebar.
    var title: String
    /// Main text content of the note.
    var body: String
    /// Timestamp for when the note was created; used for sorting.
    var dateCreated: Date
    
    /// Creates a new note with the given title and body.
    /// - Parameters:
    ///   - title: The note's title.
    ///   - body: The note's body text.
    init(title: String, body: String) {
        self.id = UUID()
        self.title = title
        self.body = body
        self.dateCreated = Date()
    }
}
