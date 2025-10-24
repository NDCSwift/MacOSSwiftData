//
    // Project: MacOSSwiftData
    //  File: ContentView.swift
    //  Created by Noah Carpenter
    //  🐱 Follow me on YouTube! 🎥
    //  https://www.youtube.com/@NoahDoesCoding97
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Fun Fact: Cats have five toes on their front paws, but only four on their back paws! 🐾
    //  Dream Big, Code Bigger
    

import SwiftUI
import SwiftData

/// The main SwiftUI view for listing, selecting, creating, and editing notes.
struct ContentView: View {
    /// SwiftData model context used for inserting, deleting, and saving notes.
    @Environment(\.modelContext) private var context
    /// Automatically-fetched list of notes, sorted by most recent first.
    @Query(sort: \Note.dateCreated, order: .reverse) private var notes: [Note]
    /// The note currently selected in the sidebar list.
    @State private var selectedNote: Note? = nil
    
    var body: some View {
        NavigationSplitView {
            // Sidebar: list of notes with selection driving the detail
            List(selection: $selectedNote) {
                ForEach(notes) { note in
                    // Show only a single line of the title to keep the list compact; tag enables selection
                    Text(note.title)
                        .lineLimit(1)
                        .tag(note)
                }
                .onDelete(perform: deleteNote)
            }
            .navigationTitle("Notes")
            .frame(minWidth: 200)
            .listStyle(.sidebar)
        } detail: {
            VStack(alignment: .leading, spacing: 10) {
                // Detail/editor area for the selected note
                if let note = selectedNote {
                    // Bind directly to the selected note's properties; saving on every change
                    // Title field; updates are persisted via `saveChanges()` in the setter
                    TextField("Title", text: Binding(
                        get: { note.title },
                        set: { note.title = $0; saveChanges() }
                    ))
                    .font(.headline)
                    
                    // Body editor; updates are persisted via `saveChanges()` in the setter
                    TextEditor(text: Binding(
                        get: { note.body },
                        set: { note.body = $0; saveChanges() }
                    ))
                    .frame(minHeight: 200)
                } else {
                    // Placeholder when no note is selected
                    Text("Select or create a note")
                        .foregroundColor(.gray)
                }
                
                HStack {
                    // Basic actions for creating and deleting notes
                    Button("New Note", action: addNote)
                    Button("Delete", action: deleteSelected)
                }
            }
            .padding()
        }
    }
}

extension ContentView {
    /// Creates a new note, inserts it into the store, saves, and selects it.
    func addNote() {
        let newNote = Note(title: "New Note", body: "")
        context.insert(newNote)
        try? context.save()
        selectedNote = newNote
    }
    
    /// Deletes notes at the given list offsets and saves the context.
    /// - Parameter offsets: The indices of notes to remove from the list.
    func deleteNote(at offsets: IndexSet) {
        for index in offsets {
            let note = notes[index]
            context.delete(note)
        }
        try? context.save()
    }
    
    /// Deletes the currently selected note (if any) and clears the selection.
    func deleteSelected() {
        if let note = selectedNote {
            context.delete(note)
            try? context.save()
            selectedNote = nil
        }
    }
    
    /// Persists any pending changes to the model context.
    func saveChanges() {
        try? context.save()
    }
}

#Preview {
    ContentView()
}

