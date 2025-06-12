# 🌤️ Weather App

A clean and modern Weather App built using **Flutter** and **Dart**, providing real-time weather updates for any city. The app utilizes the **OpenWeatherMap API** to display essential weather information such as temperature, wind speed, humidity, and general weather conditions. The application features an aesthetic Light and Dark Mode to enhance the user experience.

---

## 📱 Preview

| Light Mode | Dark Mode |
|-----------|-----------|
| <img src="./weather%20APP%20light%20mode.png" width="400"/> | <img src="./weather%20APP%20dark%20mode.png" width="400"/> |

**🎬 Live Demo:**

| Light Mode | Dark Mode |
|-----------|-----------|
| <img src="./Weather%20APP%20gif.gif" width="400"/> | <img src="dark_weatherapp_recording.gif" width="400"/> |

---

## 🚀 Features

- 🔍 **Search City Weather**: Enter any city name to instantly get weather data.
- 🌡️ **Temperature Display**: Shows the current temperature in Celsius.
- 💧 **Humidity Level**: Displays the humidity percentage of the city.
- 🌬️ **Wind Speed Indicator**: Provides wind speed in meters per second.
- 🌥️ **Weather Condition Overview**: Brief description of the weather (e.g., "Clear", "Cloudy", "Rainy").
- 🌗 **Light & Dark Mode Toggle**: Allows users to switch between visually appealing Light and Dark themes.
- 🔄 **Real-time Data Fetch**: Weather information is updated instantly based on API calls.
- 📱 **Responsive UI**: Built with Flutter’s Material Design for smooth performance on Android and iOS.

---

## 🛠️ Technologies Used

- **Flutter** - Cross-platform UI toolkit
- **Dart** - Programming language
- **Material Design** - For clean and modern UI components
- **OpenWeatherMap API** - Weather data provider

---

## 🔑 API Key Setup

To make the app functional, obtain your API key from **OpenWeatherMap**:

1. Sign up at [OpenWeatherMap](https://openweathermap.org/api).
2. Generate your API key.
3. Open your Flutter project files.
4. Replace `'YOUR_API_KEY_HERE'` in the relevant Dart file with your API key:

```dart
const String apiKey = 'YOUR_API_KEY_HERE';
