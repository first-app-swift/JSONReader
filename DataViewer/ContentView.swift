//
//  ContentView.swift
//  DataViewer
//
//  Created by Amey Ranade on 20/04/21.
//

import SwiftUI


struct ContentView: View {
    @ObservedObject var parseFile : ParseFile
    @State private var value1 = ParseFile.fileData()
    var body: some View {
        NavigationView{
            List{
                Section(header: HeaderView(symbolSystemName: "flag.circle", headerText: "CountryData"))
                {
                    
                    let taskIndices = value1.indices
                    let tasks = value1
                    let tasksPair = Array(zip(tasks, taskIndices))
                    ForEach(tasksPair, id: \.0.id, content: {
                        task, taskIndex in
                        let bindingObject = $value1
                        let newTask = bindingObject[taskIndex]
                        NavigationLink(destination: UpdateScreen(newResult: newTask),
                                       label: {
                                        ScreenData(data: task)
                                       })
                        
                    })
                }
                
            }.listStyle(GroupedListStyle())
            .navigationTitle("Home")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
        }
    }
}
struct HeaderView: View {
    let symbolSystemName : String
    let headerText : String
    var body: some View {
        
        HStack {
            Image(systemName : symbolSystemName)
            Text(headerText) }.font(.title3)
            .foregroundColor(.red)
    }
}


struct UpdateScreen: View {
    @Binding var newResult : Result
    var body: some View {
        Text(newResult.displayString)
        
    }
}

struct ScreenData: View {
    let data: Result
    var body: some View {
        Text(data.displayString)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let parseFile = ParseFile()
        ContentView(parseFile: parseFile)
    }
}


