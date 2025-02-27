//
//  DestinationSearchView.swift
//  AirbnbClone
//
//  Created by Abdurrahman Arıcan on 25.02.2025.
//

import SwiftUI

enum DestinationSearchOptions{
    case location
    case dates
    case guests
}


struct DestinationSearchView: View {
    
    @Binding var show : Bool
    @State private var destination = ""
    @State private var selectedOption: DestinationSearchOptions = .location
    
    var body: some View {
       
        VStack(alignment : .leading){
            Button {
                withAnimation(.snappy){
                    show.toggle()
                }
            } label: {
                Image(systemName: "xmark.circle")
                    .imageScale(.large)
                    .foregroundStyle(.black)
                
            }
            .padding()

            VStack(alignment:.leading){
                
                if selectedOption == .location {
                    Text("Where to?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .imageScale(.small)
                        
                        TextField("Search destinations", text : $destination)
                            .font(.subheadline)
                    }
                    .frame(height:44)
                    .padding(.horizontal)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 1)
                            .foregroundStyle(Color(.systemGray4))
                        
                    }}
                else{
                    CollapsedPickerView(title: "Where to?", description: "Add locations")
                }
            }
            .padding()
            .frame(height: selectedOption == .location ? 120 : 64)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding()
            .shadow(radius: 10)
            .onTapGesture {
                selectedOption = .location
                }
           
           
            
            VStack{
                if selectedOption == .dates {
                    HStack{
                        
                    }
                }
                else{
                    CollapsedPickerView(title: "When", description: "Add dates")
                }
            }
            .padding()
            .frame(height: selectedOption == .dates ? 120 : 64)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding()
            .shadow(radius: 10)
            .onTapGesture {
                    selectedOption = .dates
                }
            
    
            VStack{
                if selectedOption == .guests {
                    Text("Show Expanded View")
                }
                else{
                    CollapsedPickerView(title: "Who", description: "Add guests")
                }
            }
            .padding()
            .frame(height: selectedOption == .guests ? 120 : 64)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding()
            .shadow(radius: 10)
            .onTapGesture {
                selectedOption = .guests
            }
            
        }
    
    }
}

#Preview {
    DestinationSearchView(show:.constant(false))
}

struct CollapsedPickerView: View {
    let title : String
    let description : String
    var body: some View {
        VStack{
            HStack{
                Text(title)
                    .foregroundStyle(.gray)
                
                Spacer()
                
                Text(description)
            }
            
            .font(.subheadline)
            .fontWeight(.semibold)
        }
    }
}
