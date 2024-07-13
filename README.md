# quick_weather_app



To setup or run this project on emulator or real device please follow those instructions:

1. Install android studio.
2. Clone this project to your local directory or directly clone it from android studio
3. Open this project into Android Studio IDE.
4. Then in the android studio build in terminal run this command "flutter pub get"
5. If android studio throws any issues then please run this command "flutter upgrade" & "flutter pub get"
6. then open a emulator or connect real phone using cable and hit run
7. Hopefully it should run this on emulator or real phone
8. Thats all.


Project Structure:

I always love to follow MVVM design pattern because it is easy to maintain and any developer can easily understand this.

My Approach:

1. I have some structures for different type of state management like GetX, Bloc, Provider, Riverpod etc. so for this project I think GetX will be easier so I clone my GetX structure.
2. Then I open google chrome and search OpenWeatherMap for weather API.
3. After register new account I have got a new API key for fetching weather data but I have to wait 1-2 hours for activating my newly created API key so I wait.
4. Then I add the API in my project and fetch weather data.
5. Then just do some focus on design so that it looks little bit good.
6. I don't have need to rewrite the error handling because my previously created all structures are already error handled for any typed.
7. Then I hit run and its works fine in my real device.
8. Thats all.

