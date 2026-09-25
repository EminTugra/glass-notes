import SwiftUI

struct ContentView: View {
    @State private var notes: [String] = ["Material Expressive Fikirleri", "GitHub Actions Notu"]
    @State private var newNote: String = ""

    var body: some View {
        ZStack {
            // Arka Plan (Gradiyent & Sıvı/Cam Efekti Derinliği)
            LinearGradient(
                colors: [.black, Color(white: 0.15), .black],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(spacing: 20) {
                // Başlık
                Text("Liquid Notes")
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .padding(.top)

                // Input Alanı (Cam Efektli Kart)
                HStack {
                    TextField("Yeni not ekle...", text: $newNote)
                        .foregroundColor(.white)
                        .placeholder(when: newNote.isEmpty) {
                            Text("Yeni not ekle...").foregroundColor(.white.opacity(0.4))
                        }

                    Button(action: addNote) {
                        Image(systemName: "plus.circle.fill")
                            .font(.title2)
                            .foregroundColor(.white)
                    }
                }
                .padding()
                .background(.ultraThinMaterial) // Apple'ın Liquid/Frosted Glass malzemesi
                .cornerRadius(16)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.white.opacity(0.2), lineWidth: 1)
                )
                .padding(.horizontal)

                // Not Listesi
                ScrollView {
                    VStack(spacing: 12) {
                        ForEach(notes, id: \.self) { note in
                            HStack {
                                Text(note)
                                    .foregroundColor(.white)
                                Spacer()
                            }
                            .padding()
                            .background(.thinMaterial)
                            .cornerRadius(12)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.white.opacity(0.15), lineWidth: 1)
                            )
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
    }

    func addNote() {
        guard !newNote.isEmpty else { return }
        notes.append(newNote)
        newNote = ""
    }
}

// Placeholder Yardımcısı
extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}