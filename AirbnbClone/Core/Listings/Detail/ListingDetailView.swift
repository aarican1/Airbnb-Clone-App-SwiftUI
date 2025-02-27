//
//  ListingDetailView.swift
//  AirbnbClone
//
//  Created by Abdurrahman Arıcan on 25.02.2025.
//

import SwiftUI
import MapKit

struct ListingDetailView: View {
    
    let images : [String]
    let placaeTitle : String
    let score  : String
    let reviews : String
    let location : String
    let hostPerson : String
    let placeFeatures : String
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView{
            ZStack(alignment:.topLeading) {
                ListingImageCarouselView(images: images)
                    .frame(height : 320)
                
                Button {
                    dismiss()
                } label: {
                    Images.chevronLeft
                        .foregroundStyle(.black)
                        .background{
                            Circle()
                                .fill(.white)
                                .frame(width: 32, height: 32)
                        }
                        .padding(32)
                }

            }
            
            VStack(alignment: .leading, spacing: 8){
                Text("Miami Villa")
                    .font(.title)
                    .fontWeight(.semibold)
                VStack(alignment: .leading){
                    HStack(spacing:2){
                        Images.favorite
                        
                        Text("4.8")
                        Text(" - ")
                        Text("28 reviews")
                            .underline()
                            .fontWeight(.semibold)
                        
                    }
                    .foregroundStyle(.black)
                    
                    Text("Miami, Florida")
                }
                .font(.caption)
            }
            .padding(.leading)
            .frame(maxWidth : .infinity, alignment: .leading)
            
            Divider()
            
            HStack{
                VStack(alignment: .leading, spacing: 4){
                    Text("Entire villa hosted by John Smith")
                        .font(.headline)
                        .frame(width: 250,alignment: .leading)
                    
                   
                        Text("4 guests - 4 bedrooms - 4 beds - 3 baths")
                        .font(.caption)
                }
                .frame(width:300, alignment: .leading)
                
                Spacer()
                
                Image("profile-woman")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 64,height: 64)
                    .clipShape(Circle())
            }
            .padding()
            
            Divider()
            
            VStack(alignment : .leading, spacing: 16){
                ForEach(0 ..< 2,id: \.self){feature in
                    HStack(spacing:12){
                        Image(systemName: "medal")
                        
                        
                        VStack(alignment: .leading){
                            Text("SuperHosts")
                                .font(.footnote)
                                .fontWeight(.semibold)
                            
                            Text("Description for hosts")
                                .font(.caption2)
                                .foregroundStyle(.gray)

                            
                        }
                        Spacer()
                    }
                }
            }
            .padding()
            
            Divider()
            
            VStack(alignment : .leading, spacing: 16){
                Text("Where you'll sleep")
                    .font(.headline)
                
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        ForEach(0 ... 3, id: \.self ){bedroom in
                            VStack(spacing: 8){
                                Image(systemName: "bed.double")
                                Text("Bedroom \(bedroom)")
                            }
                            .frame(width: 132,height: 100)
                            .overlay{
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(lineWidth: 1)
                                    .foregroundStyle(.gray)
                            }
                        }
                    }
                    .scrollTargetBehavior(.paging)
                }
                
                Divider()
                
                VStack(alignment :.leading ,spacing:16){
                    Text("What this place offers")
                        .font(.headline)
                    
                    ForEach(0..<5){ feature in
                        HStack{
                            Image(systemName: "wifi")
                            Text("Wifi")
                                .font(.footnote)
                            Spacer()
                        }
                        
                    }
                    
                }
            
                
                Divider()
                
                VStack(alignment: .leading){
                    Text("Where you'll be ")
                        .font(.headline)
                    
                    Map()
                        .frame(height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                }
                
            }
            .padding()
            
        }
        .ignoresSafeArea()
        .padding(.bottom, 64)
        .overlay(alignment: .bottom){
            VStack{
                Divider()
                    .padding(.bottom)
                
                HStack{
                    VStack(alignment :.leading ){
                        
                        Text("$500")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                        Text("Total before taxes")
                            .font(.footnote)
                        
                        Text("Oct 15 - 20")
                            .underline()
                            .font(.footnote)
                            .fontWeight(.semibold)
                            
                        
                    }
                    
                    Spacer()
                    
                    Button{
                        
                    } label: {
                        Text("Reserve")
                            .foregroundStyle(.white)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width:140, height:44)
                            .background(Color.pink)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
                .padding(.horizontal, 32)
            }
            .background(.white)
        }
    }
}

#Preview {
    ListingDetailView(images:  [
        "house-1",
        "house-2",
        "house-3",
        "house-4",
    ],
                      placaeTitle: "",
                      score: "",
                      reviews: "",
                      location: ""

    
    )
}
