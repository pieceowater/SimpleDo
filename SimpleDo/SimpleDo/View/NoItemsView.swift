//
//  NoItemsView.swift
//  SimpleDo
//
//  Created by yury mid on 08.08.2022.
//


import SwiftUI

struct NoItemsView: View {
    
    @State var animate: Bool = false
    
    var body: some View {
        ScrollView{
            VStack(spacing: 10) {
                Image(systemName: "checkmark.circle")
                    .font(.system(size: 80))
                    .padding(.bottom, 5)
                Text("There are no items!")
                    .font(.title2)
                    .fontWeight(.semibold)
                Text("Are you a productive person? I think you should tap the Add button and add a bunch of items to your Todo list")
                    .padding(.bottom, 20)
                NavigationLink(destination: AddView()) {
                    Text("Add item")
                        .foregroundColor(.white)
                        .frame(height: 45)
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .background(animate ? Color.accentColor : Color.gray)
                        .cornerRadius(10)
                }
                .padding(.horizontal, 50)
            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(35)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation(){
        guard !animate else {return}
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
    
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            NoItemsView()
                .navigationTitle("Some title")
        }
        .previewInterfaceOrientation(.portrait)
    }
}
