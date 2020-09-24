//
//  ContentView.swift
//  SearchFilter
//
//  Created by Tom Terado on 21/9/20.
//  Copyright © 2020 Tom Terado. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var searchTerm  = ""
    @State var isSearching = false
    
    var body: some View {
        NavigationView {
            ScrollView {
            
                HStack{
                    HStack{
                        TextField("Search", text: $searchTerm)
                            .padding(.leading, 24)
                    }
                    .padding()
                    .background(Color(.systemGray5))
                    .cornerRadius(6)
                    .onTapGesture(perform: {
                        self.isSearching = true
                    })
                    .padding(.horizontal)
                    .overlay(
                        HStack {
                            Image(systemName: "magnifyingglass")
                            Spacer()
                            if(self.isSearching){
                                Button(action: {self.searchTerm = ""}, label: {
                                    Image(systemName: "xmark.circle.fill")
                                        .padding(.vertical)
                                })
                            }
                        }.padding(.horizontal, 32)
                            .foregroundColor(.gray)
                    )
                    
                    if(self.isSearching){
                        Button(action: {
                            self.isSearching = false
                            self.searchTerm = ""
                            
                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)

                            
                        }, label: {
                            Text("Cancel")
                                .padding(.trailing)
                        })
                            .transition(.move(edge: .trailing))
                            .animation(.spring())
                    }
                }
                
                ForEach((0..<20).filter({"\($0)".contains(self.searchTerm) || searchTerm.isEmpty }), id: \.self) { num in
                    
                    HStack {
                        Text("\(num)")
                        Spacer()
                    }.padding()
                    
                }
            }
            .navigationBarTitle("Search")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            ContentView()
//            ContentView().colorScheme(.dark)
        }
    }
}
