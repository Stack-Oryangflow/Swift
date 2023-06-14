import SwiftUI


struct ContentView: View {
    
    @State private var alertIsVisable = false
    @State private var sliderValue = 50.0
    @State private var game: Game = Game()
    
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            VStack {
                InstructionsView(game: $game)
                SliderView(sliderValue: $sliderValue)
                HitMeButton(alertIsVisable: $alertIsVisable, sliderValue: $sliderValue, game: $game)
            }
        }
    }
}

struct InstructionsView: View {
    
    @Binding var game: Game
    
    
    var body: some View {
        VStack {
            InstructionText(text: "🎯🎯🎯\nPut the bullseye as close you can\n😀It would not be easy😀")
                .padding(.leading, 30.0)
                .padding(.trailing, 30.0)
            BigNumberText(text: String(game.target))
        }
    }
}

struct SliderView: View {
    @Binding var sliderValue: Double
    
    
    var body: some View {
        HStack {
            SliderLabelText(text: "1")
            Slider(value: self.$sliderValue, in: 1.0...100.0)
            SliderLabelText(text: "100")
        }
        .padding()
    }
}
struct HitMeButton: View {
    @Binding var alertIsVisable: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game

    var body: some View {
        Button(action: {
            print("Welcome, Minauroht")
            self.alertIsVisable = true
        })  {
            Text("Hit me".uppercased())
                .bold()
                .font(.title3)
        }
        .padding(20.0)
        .background(
            ZStack {
                Color("ButtonColor")
                LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
            }
        )
        .foregroundColor(Color.white)
        .cornerRadius(21.0)
        .overlay(
            RoundedRectangle(cornerRadius: 21.0)
                .strokeBorder(Color.white, lineWidth: 2.0)
        )
        .alert("Hello there!", isPresented: $alertIsVisable) {
            Button("Awesome!") { }
        } message: {
            var roundedValue: Int = Int(self.sliderValue.rounded())
            Text("The slider's value is \(roundedValue).\n" + "Minauroht scored \(self.game.points(sliderValue: roundedValue)) points this round")
        }
    }
}


struct MyPreviewProvider_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .previewLayout(.fixed(width: 568, height: 320))
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .previewLayout(.fixed(width: 568, height: 320))
    }
} 
