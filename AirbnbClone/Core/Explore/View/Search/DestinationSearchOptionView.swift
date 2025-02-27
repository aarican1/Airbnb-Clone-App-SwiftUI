//
//  DestinationSearchOptionView.swift
//  AirbnbClone
//
//  Created by Abdurrahman Arıcan on 25.02.2025.
//

import SwiftUI

struct DestinationSearchOptionView: View {
    @Binding var selectedOption : DestinationSearchOptions
    let selfOption : DestinationSearchOptions
    let collapsedTitle : String
    let collapsedDescription : String
    let componentHeight : CGFloat
    var showView : AnyView
    
    var body: some View {
        VStack(alignment:.leading){
            
            if selectedOption == selfOption {
                showView
            }
            else{
                CollapsedPickerView(title: collapsedTitle, description: collapsedDescription)
            }
        }
        .padding()
        .frame(height: selectedOption == selfOption ? componentHeight : 64)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding()
        .shadow(radius: 10)
        .onTapGesture {
            withAnimation(.snappy) {
                selectedOption = selfOption
                }
            }
    }
}

#Preview {
    DestinationSearchOptionView(selectedOption: .constant(.location), selfOption: .dates,
                                collapsedTitle: "TEst", collapsedDescription: "test",
                                componentHeight: 120,
                                showView: AnyView(Text("Test")))
}
