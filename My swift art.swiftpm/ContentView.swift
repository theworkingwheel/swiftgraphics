
import SwiftUI

struct CustomShapes: View {
    @Binding var color: Color
    @Binding var size: CGFloat
    @State private var offset: CGSize = .zero
    @State private var velocity: CGSize = .zero
    @State private var isDragging = false
    @State private var gravity: CGFloat = 1.0
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(.green)
                .frame(width: 25, height: 20)
                .offset(y: 20)
            
            Circle()
                .fill(.purple)
                .frame(width: size, height: size)
                .offset(offset)
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            isDragging = true
                            offset = gesture.translation
                        }
                        .onEnded { gesture in
                            isDragging = false
                            velocity = CGSize(width: gesture.predictedEndTranslation.width / 10,
                                              height: gesture.predictedEndTranslation.height / 10)
                        }
                )
            
            Rectangle()
                .fill(color)
                .frame(width: size, height: size)
                .offset(offset)
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            isDragging = true
                            offset = gesture.translation
                        }
                        .onEnded { gesture in
                            isDragging = false
                            velocity = CGSize(width: gesture.predictedEndTranslation.width / 10,
                                              height: gesture.predictedEndTranslation.height / 10)
                        }
                )
            
            Triangle()
                .fill(Color.blue)
                .frame(width: 100, height: 330)
                .offset(x:70 ,y: 20)
        }
        .onAppear {
            startFalling()
        }
    }
    
    private func startFalling() {
        Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { timer in
            guard !isDragging else { return }
            
            // Apply gravity
            velocity.height += gravity
            
            // Apply velocity to offset
            offset.width += velocity.width
            offset.height += velocity.height
            
            // Check bounds and stop if at the bottom
            if offset.height + size / 2 >= UIScreen.main.bounds.height / 2 {
                offset.height = UIScreen.main.bounds.height / 2 - size / 2
                velocity = .zero
                timer.invalidate()
            }
            
            // Apply friction
            velocity.width *= 0.99
            velocity.height *= 0.99
        }
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}

struct ContentView: View {
    @State private var count = 0
    @State private var color: Color = .red
    @State private var size: CGFloat = 56
    
    var body: some View {
        VStack {
            HStack {
                Button(action: { count += 1 }) {
                    Text("Increment")
                        .font(.headline)
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                
                Button(action: { color = .green }) {
                    Text("Change Color")
                        .font(.headline)
                }
                .padding()
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            
            Text("Count: \(count)")
            
            Slider(value: $size, in: 20...100, step: 1)
                .padding()
            
            CustomShapes(color: $color, size: $size)
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
