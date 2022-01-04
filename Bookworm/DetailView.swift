//
//  DetailView.swift
//  Bookworm
//
//  Created by Brandon Glenn on 1/4/22.
//

import SwiftUI

struct DetailView: View {
    let book: Book
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    @State private var showingAlert = false
    
    
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        
        guard let date = book.date  else {
            return "Unknown Date"
        }
        return formatter.string(from: date)
    }
    
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                Image (book.genre ?? "Fantasy")
                    .resizable()
                    .scaledToFit()
                
                Text(book.genre?.uppercased() ?? "FANTASY")
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundColor(.white)
                    .background(.black.opacity(0.75))
                    .clipShape(Capsule())
                    .offset(x: -5, y: -55)
                
            }
            
            Text(book.author ?? "Unknown Author")
                .font(.title)
                .foregroundColor(.secondary)
            
            Text(book.review ?? "No Review")
            
            RatingView(rating: .constant(Int(book.rating)))
                .font(.largeTitle)
            
            Text("Book Added: \(formattedDate)")
                .font(.subheadline)
                .fontWeight(.light)
            
            
        }
        .navigationTitle(book.title ?? "Unknown Book")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Delete Book?", isPresented: $showingAlert) {
            Button("Delete", role:.destructive) { deleteBook() }
            Button("Cancel", role: .cancel) {}
        } message: {
            Text("Cofirm Deletion?")
        }
        
        .toolbar {
            Button {
                showingAlert = true
            } label: {
                Label("Delete Books", systemImage: "trash")
            }
        }
        
        
    }
    
    func deleteBook() {
        moc.delete(book)
        try? moc.save()
        dismiss()
    }
    
}

