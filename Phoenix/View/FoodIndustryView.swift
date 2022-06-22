//
//  FoodIndustryView.swift
//  Phoenix
//
//  Created by Korakot Phaearaya on 21/5/2565 BE.
//

import Foundation
import SwiftUI
import CoreData


struct FoodIndustryView: View {
    
    @Environment(\.presentationMode) private var presenttationMode: Binding<PresentationMode>
    
    private var util = Util()
    
    @State var startPos : CGPoint = .zero
    @State var isSwipping = true
    
    
    var body: some View {
        NavigationView{
            VStack{
                if #available(iOS 15.0, *) {
                    AsyncImage(
                        url: URL(string: "https://content.talpha.co/payroll/imagemap_retirement.png")
                    )
                    .frame(maxWidth: 100, maxHeight: 100)
                        
                } else {
                    Image(uiImage: util.loadImg(imageUrl: "https://content.talpha.co/payroll/imagemap_retirement.png"))
                        .resizable()
                        .frame(width: 100, height: 100)
                }
                
                Button(action: {
                    presenttationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Text("Back")
                            .font(.system(size: 30))
                            .foregroundColor(Color.blue)
                    }
                }
                .padding(.top,20)
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight: .infinity, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .gesture(DragGesture()
                    .onChanged { gesture in
                        if self.isSwipping {
                                        self.startPos = gesture.location
                                        self.isSwipping.toggle()
                                    }
                    }
                    .onEnded { gesture in
                        let xDist =  abs(gesture.location.x - self.startPos.x)
                                    let yDist =  abs(gesture.location.y - self.startPos.y)
                        if self.startPos.x < gesture.location.x && yDist < xDist {
                            presenttationMode.wrappedValue.dismiss()
                        }
                    }
                 )
            
        }
        .navigationBarHidden(true)
    }
}

struct FoodIndustryView_Previews: PreviewProvider {
    static var previews: some View {
        FoodIndustryView()
    }
}
