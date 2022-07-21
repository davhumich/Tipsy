//
//  ContentView.swift
//  TipsyHelper
//
//  Created by David Harrell on 7/15/22.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct ContentView: View {
    @State var ABV = ""
    @State var brand = ""
    @State var country = ""
    @State var description = ""
    @State var drink_type = ""
    @State var secondary_drink_type = ""
    @State var name = ""
    @State var region = ""
    @State var url = ""
    @State var file_name = ""
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    Group{
                    TextField("ABV", text: $ABV)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                    TextField("Brand", text: $brand)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                    TextField("Country", text: $country)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                    TextField("description", text: $description)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                    TextField("drink_type", text: $drink_type)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                    TextField("secondary_drink_type", text: $secondary_drink_type)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                    TextField("Name", text: $name)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                    TextField("region", text: $region)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                    TextField("URL", text: $url)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                    TextField("File name", text: $file_name)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                    }
                    Button{
                        let db = Firestore.firestore()
                        
                        db.collection("drinks").document(file_name).setData([
                            "ABV": Double(ABV) ?? 0,
                            "brand": brand,
                            "country": country,
                            "description": description,
                            "drink_type": drink_type,
                            "region": region,
                            "secondary_drink_type": secondary_drink_type,
                            "name": name,
                            "url": url,
                            "reviews": [0, 0, 0, 0, 0]
                        ])
                        
                        ABV = ""
                        brand = ""
                        country = ""
                        description = ""
                        drink_type = ""
                        secondary_drink_type = ""
                        region = ""
                        name = ""
                        url = ""
                        file_name = ""

                    }label:{
                        Text("Submit")
                            .foregroundColor(Color.white)
                            .frame(width: 200, height: 50)
                            .background(Color.blue)
                            .cornerRadius(8)
                    }
                }
        }
        .navigationTitle("Submit Drink")
        }
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
