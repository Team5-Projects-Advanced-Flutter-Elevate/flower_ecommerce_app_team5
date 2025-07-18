# 🌸 Flowery E-Commerce App

**Flowery** is a beautifully designed, full-featured Flutter e-commerce application tailored for flower shopping. It includes **API-based payments**, **live order tracking**, and a companion **driver tracking app**. Built using **clean architecture** and **Cubit** state management, Flowery delivers a smooth, scalable experience for both customers and delivery logistics.

---

## 📱 Features

### 🔐 Authentication
- **Login** & **Register** with email/password
- **Forgot Password** with email verification
- Validation and error handling for all auth flows

---

### 🏠 Home Tab
- Browse curated flower **categories**
- Explore featured **best sellers**
- Discover seasonal promotions

---

### 🔍 Search Feature
- Search flowers and arrangements via a **remote API**
- Filters based on name, occasion, or price
- Real-time suggestions and product results

---

### 🛒 Cart & Checkout
- Add and remove products from cart
- Modify quantities
- View pricing, taxes, and delivery info
- Checkout and trigger **secure payment via backend API**
  - No reliance on SDKs like Stripe or PayPal

---

### 📦 Orders & Tracking
- View **all past and current orders**
- Track your order in **real-time**
  - Status updates: *Placed → Preparing → Out for Delivery → Delivered*
- Integrated with a **separate Tracking App** used by drivers
  - Enables live GPS-based tracking and ETA
  - Visual **timeline UI** for progress

---

### 👤 Profile Tab
- View & edit personal details:
  - Name, Email, Mobile
- Access the **Saved Addresses** screen

---

### 🏠 Address Management
- Add, update, or delete multiple delivery addresses
- Addresses saved locally and remotely
- Used during checkout and for calculating delivery fees

---

### 🛍 Best Sellers Section
- Replaces the typical "Favourites" tab
- Displays top-selling products based on analytics and trends
- Continuously updated via backend API

---

## 🛠 Architecture & Tech Stack

### ✅ Clean Architecture Layers
- **Core Layer**: Shared utilities, themes, and constants
- **Data Layer**: Models, repositories, and API integration
- **Domain Layer**: Use cases and business logic
- **Presentation Layer**: UI components and state management

### 🧠 State Management
- **Cubit** from `flutter_bloc`
  - Simple, predictable, and testable state updates
  - Cubits used per feature/module

### 🧪 Networking
- Built using `Dio` for API requests
- Error handling and token management built into API layer
- All data fetched from backend (no local DB)

---

## 🎯 Use Cases Covered

- Register and login user with profile data
- Add items to cart and place an order
- Pay securely using backend payment flow
- Search for flowers using a keyword
- Track live order status linked with driver app
- Manage multiple delivery addresses
- View past order history and details

---

## 🖼 Screens Overview

1. **Splash Screen** – App boot-up
2. **Login/Register** – Auth flow with validation
3. **Home** – Categories, banners, best sellers
4. **Search** – Search bar with suggestions and results
5. **Product Details** – Add to cart, view info
6. **Cart** – Modify, remove, checkout
7. **Payment** – Handled through secure backend API
8. **Orders** – View all orders and details
9. **Live Order Tracking** – Map & status tracking
10. **Profile** – Update info and logout
11. **Address Book** – Add/edit/delete saved addresses

---   
## 🎥 Demo & Presentation
- [Live Demo](https://drive.google.com/drive/folders/1G2Ht7E__2bcbDnanEG2mGLoQbLZgYMR-?usp=sharing)
- [Project Presentation Slides](https://gamma.app/docs/FlowerE-commerce-App-lbvv58uloloiyrp)
