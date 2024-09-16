//
//  ProductDetailView.swift
//  Shop App
//
//  Created by Fırat Ören on 10.09.2024.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

struct ProductDetailView: View {

    let product: Product
   // @StateObject var cartManager = CartManager()
    @Environment(\.dismiss) var dismiss
    let db = Firestore.firestore()

    @State var isFav = false
    @State var isAlert = false

    var body: some View {
        VStack(alignment: .leading){

            HStack{
                Button(action: {
                    dismiss()
                }, label: {
                    Image(systemName: "arrow.backward.circle")
                        .font(.title)
                        .foregroundStyle(Color.orange)
                })
                Spacer()
                Text("Product Detail")
                    .font(.title3)
                    .bold()
                Spacer()

                Button(action: {}, label: {
                    Image(systemName: "ellipsis.vertical.bubble")
                        .font(.title2)
                        .foregroundStyle(Color.black)
                })
            }.padding()
            
            AsyncImage(url: URL(string: product.image)) { img in
                img.resizable().frame(maxWidth: .infinity,maxHeight: 300)
            } placeholder: {
                ProgressView()
                    .frame(maxWidth: .infinity,maxHeight: 300)
            }
            
            
            HStack(alignment:.top){
                VStack(alignment:.leading,spacing: 12){
                    Text(product.description)
                        .font(.caption)
                    Text("⭐️\(String(format:"%.2f",product.rating.rate)) (\(product.rating.count) Reviews)")

                    Text(String(format:"$%.2f",product.price))
                        .font(.title2)
                        .bold()
                }
                
                Spacer()
                Button(action: {
                    if Auth.auth().currentUser != nil {


                        db.collection("favorite_products").whereField("id", isEqualTo: "\(product.id)").getDocuments { querySnap, err in
                           if err == nil {
                               if querySnap!.isEmpty {
                                   db.collection("favorite_products").document("\(product.id)").setData([
                                       "id": "\(product.id)",
                                       "title": "\(product.title)"

                                   ])
                                   isFav = true
                               } else {
                                   db.collection("favorite_products").document("\(product.id)").delete()
                                   isFav = false
                               }

                           }
                       }
                    } else {
                        isAlert.toggle()
                    }



                }, label: {
                    Image(systemName: isFav ? "heart.fill" : "heart")
                        .font(.title2)
                })

            }.padding()

            HStack{
                Button(action: {}, label: {
                    RoundedRectangle(cornerSize: CGSize(width: 10, height: 10), style: .circular).stroke(Color.orange,lineWidth: 1.0).frame(width: 120,height: 50).overlay {
                        Text("Add to Cart")
                            .foregroundStyle(Color.orange)
                    }
                })
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Buy Now")
                        .frame(width: 120,height: 50)
                        .background(Color.orange)
                        .foregroundStyle(Color.white)
                        .cornerRadius(12)
                })
            }.padding(.horizontal)


            Spacer()

        }.navigationBarBackButtonHidden()
            .onAppear {
                db.collection("favorite_products").whereField("id", isEqualTo: "\(product.id)").getDocuments { querySnap, err in
                   if err == nil {
                       if querySnap!.isEmpty {
                           self.isFav = false
                       } else {
                           self.isFav = true
                       }

                   }
               }
            }
            .alert("Sign In to add favorite", isPresented: $isAlert) {
                Button("OK",role: .cancel) {}
            }




    }
}



















#Preview {
    ProductDetailView(product: Product(id: 1, title: "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops", price: 109.95, description: "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday", category: "men's clothing", image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg", rating: Product.Rating(rate: 3.9, count: 120)))
}
