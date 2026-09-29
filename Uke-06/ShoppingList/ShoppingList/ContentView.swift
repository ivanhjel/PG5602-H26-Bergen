import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) private var modelContext
    
    @State private var showingAddItem = false
    
    @Query(
        sort: \ShoppingItem.createdAt,
        order: .reverse
    )
    private var items: [ShoppingItem]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(items) { item in
                    HStack {
                        Button {
                            item.isBought.toggle()
                        } label: {
                            Image(systemName: item.isBought ? "checkmark.circle.fill" : "circle")
                        }
                        .buttonStyle(.plain)
                        
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .strikethrough(item.isBought)
                            Text(item.category.rawValue)
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                        
                        Spacer()
                        
                        Text("\(item.quantity) stk")
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .navigationTitle("Handlelisten")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showingAddItem = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddItem) {
                AddItemView()
            }
        }
    }
    
    private func deleteItems(at offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(items[index])
        }
    }
}
