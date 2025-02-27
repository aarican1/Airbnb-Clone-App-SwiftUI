//
//  DestinationOptionView.swift
//  AirbnbClone
//
//  Created by Abdurrahman Arıcan on 25.02.2025.
//

import SwiftUI

struct DestinationOptionView: View {
    @Binding var selectedOption : DestinationSearchOptions
    var body: some View {
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
            withAnimation(.snappy) {
                selectedOption = .location
                }
            }
    }
}

#Preview {
    DestinationOptionView()
}
