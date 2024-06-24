import SwiftUI

struct CustomCircle: View {
    var color: Color
    var size: CGFloat
    
    var body: some View {
        Rectangle()
            .fill(.green)
            .frame(width: 25, height: 20)
            .position(x: 10.0, y: 635)
            
        
        Circle()
            .fill(.purple)
            .frame(width: size, height: size)
           .position(x: 300, y: 5)

        
            
        Rectangle()
            .fill(color)
            .frame(width: size, height: size)
        
        
        Triangle()
            .fill(Color.blue)
            .frame(width: 200, height: 330)
        
        
        
    }
}


struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        return path
    }
}





struct ContentView: View {
    var body: some View {
        VStack {
            
            
           
            CustomCircle(color: .red, size: 56)
          // CustomCircle(color: .green, size: 75)
           // CustomCircle(color: .blue, size: 50)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



//import SwiftUI
//
//struct ContentView: View {
//    @State private var count = 0
//  //  @State private var count2 = 0
//    
//    
//    
//    var body: some View {
//        VStack {  //startof
//           
//            Button(action: {
//                count += 1
//            }) {
//                Text("Increment")
//                    .font(.headline)
//                    .padding()
//                    .background(Color.blue)
//                    .foregroundColor(.white)
//                    .cornerRadius(10)
//            }
//            
//           // Text("Count: \(count2)")
//
//            
//            Button(action: {
//               // count2 = count
//                count -= 1
//
//                
//            }) {
//                Text("Decrement")
//                    .font(.headline)
//                    .padding()
//                    .background(Color.red)
//                    .foregroundColor(.white)
//                    .cornerRadius(10)
//        
//            }
//            
//            Text("Count: \(count)")
//                .font(.largeTitle)
//            
//            //endof
//        }
//        
//        
//    }
//}
//
//struct CounterView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
