# Go Metro App 🚇

**Go Metro** is a Flutter application designed to simplify commuting via the Cairo Metro. The app provides users with the nearest station, fastest routes, ticket prices, and trip details, ensuring a smooth navigation experience through Egypt's underground network.

<p align="center">
  <a href="https://github.com/yousefa7med/Go_Metro/releases/download/go_metro.apk/go.metro.apk">
    <img src="https://img.shields.io/badge/Download-APK-green?style=for-the-badge&logo=android&logoColor=white" alt="Download APK">
  </a>
</p>

---

## 💡 Core Idea

The app acts as a smart companion for Cairo Metro commuters by:
- identifying the nearest station based on user location.
- Calculating the best route between two stations.
- Providing essential trip data (Time, Cost, Interchanges).
- Offering save favorite routes and metro maps.

---

## 📱 App Overview

| Home & Route Finder | Trip Details |
|:---:|:---:|
| <img src="https://github.com/user-attachments/assets/784fe3a9-d369-4472-928c-5ac5baac21b4" width="450"> | <img src="https://github.com/user-attachments/assets/ba3704d1-2e25-4311-8560-f0698a33289a" width="450"> |
| *Station Selection & Favorites* | *Route Analysis* |

| Metro Lines Explorer | App Settings |
|:---:|:---:|
| <img src="https://github.com/user-attachments/assets/b00ad1e1-7fb4-44fc-8756-0d131b7ab4be" width="450"> | <img src="https://github.com/user-attachments/assets/6dc79a7f-8eac-4c9d-a3bc-89dd80a475aa" width="450"> |
| *Interactive Map & Station Lists* | *Language & Dark Mode Toggle* |


---

## ✨ Key Features

### 1. Smart Route Finder
- Select start and end stations to get the optimal path.
- Built using the **BFS (Breadth-First Search)** algorithm to guarantee finding the shortest path between stations in the metro network.
- **Auto-Detect Location:** Uses **Geolocator** to automatically set the nearest metro station as your starting point based on your current coordinates.

### 2. Comprehensive Trip Details
After finding a route, the app displays:
- **Estimated Trip Time:** Calculation of the expected duration of your journey.
- **Station Count:** Total number of stations you will pass through.
- **Ticket Pricing:** Automatically calculated based on the current metro pricing tiers.
- **Interchange Info:** Detailed guidance on transfer stations (e.g., switching between Line 1 and Line 2) and which lines they connect.
- **Full Path View:** A step-by-step breakdown of the entire route.
- 
### 3. Favorites & Quick Access
- Save your frequent trips (e.g., Home to Work) to the **Favorites list** for one-tap access.
- **Enhanced UX:** Designed to save time by eliminating the need to manually re-enter start and destination stations for your daily commutes.
- **Local Persistence:** Powered by **ObjectBox**, ensuring your favorite routes are securely stored and instantly available on your device.
- 
### 4. Interactive Metro Lines & Maps
- **Full Map:** High-resolution Cairo Metro map with **smooth zoom** functionality.
- **Line Directories:** Dedicated expandable lists for Line 1, Line 2, and Line 3 to explore all stations.

### 5. Customization & Localization
- **Multi-language Support:** Easily switch between **Arabic** and **English**.
- **Theme Support:** Toggle between **Dark Mode** and **Light Mode** for a better user experience.

---

## 🛠 Tech Stack

- **Flutter**: UI Framework.
- **Bloc/Cubit**: Lightweight and efficient state management.
- **ObjectBox**: High-performance NoSQL database for local caching.
- **Geolocator**: location services.
- **Photo View**: For providing a seamless zoomable map experience.

---



## 🚀 Getting Started

To get a local copy up and running, follow these steps:

1. **Clone the repo:**
   ```bash
   git clone [https://github.com/yousefa7med/Go_Metro.git](https://github.com/yousefa7med/Go_Metro.git)

---

## 📬 Let's Connect!

<div align="center">


**Always learning. Always building.**
*Don’t hesitate to contact me:*

<br>

<a href="https://www.linkedin.com/in/1youssef-ahmed/" target="_blank">
  <img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" alt="LinkedIn">
</a>
&nbsp;&nbsp;&nbsp;&nbsp;
<a href="mailto:youssefahmedserag@gmail.com">
  <img src="https://img.shields.io/badge/Gmail-D14836?style=for-the-badge&logo=gmail&logoColor=white" alt="Gmail">
</a>

</div
