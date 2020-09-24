import SwiftUI

struct Task: Identifiable {
    var id = UUID()
    var title: String
}

struct ContentView: View {
    @State var items: [Task] = []

    var body: some View {
        NavigationView {
            List {
                ForEach(items) { item in
                    TaskView(text: item.title)
                }.onDelete(perform: { indexSet in
                    items.remove(atOffsets: indexSet)
                })
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("To Do")
            .navigationBarItems(trailing: Button(action: {
                items.append(Task(title: ""))
            }) {
                Image(systemName: "plus")
            })
        }
    }
}

struct TaskView: View {
    @State var text: String = ""
    @State var done: Bool = false

    var body: some View {
        HStack {
            Button(action: {
                done = !done
            }) {
                Image(systemName: done ? "circle.fill" : "circle.dashed")
            }.foregroundColor(Color(UIColor.label))

            TextField("", text: $text)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(items: [Task(title: "take out trash")])
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView(text: "take out trash")
    }
}


