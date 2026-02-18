# Microservices Order Management System

A scalable Microservices-based Order Management System built using Spring Boot and Spring Cloud.  
The project demonstrates service discovery, centralized routing, JWT-based authentication, inter-service communication, and Docker containerization.

---

## Tech Stack

- Java 17
- Spring Boot
- Spring Cloud (Eureka, Gateway)
- Spring Security + JWT
- Spring Data JPA
- MySQL / H2
- Maven

---

##  Architecture Overview

This project follows Microservices Architecture with the following components:

- **Eureka Server** – Service Discovery
- **API Gateway** – Centralized Routing
- **Auth Service** – JWT Token Generation & Validation
- **User Service** – User Registration & Management
- **Product Service** – Product Management
- **Order Service** – Order Processing
- **Payment Service** – Payment Handling

---
## API Endpoints (Via API Gateway)
http://localhost:8085

# Authentication APIs (Public)
   Register (Auth User)
POST /auth/register
Body
{
  "username": "admin",
  "password": "admin123"
}

 Login (Generate JWT Token)
POST /auth/login

Body

{
  "username": "admin",
  "password": "admin123"
}

 Response

{
  "token": "eyJhbGciOiJIUzI1NiJ9..."
}

 Save this token — required for all secured APIs.
 
 Authorization Header (IMPORTANT)

For all secured APIs, add this header:

Authorization: Bearer <JWT_TOKEN>
Content-Type: application/json

User Service APIs (Secured)
🔹 Create User
POST /users


Body

{
  "name": "Ravi",
  "email": "ravi@gmail.com"
}

🔹 Get All Users
GET /users

🔹 Get User By ID
GET /users/{id}


Example:

GET /users/1

4️⃣ Product Service APIs (Secured)
🔹 Create Product
POST /products


Body

{
  "name": "Laptop",
  "price": 55000,
  "stock": 10
}

🔹 Get All Products
GET /products

🔹 Get Product By ID
GET /products/{id}


Example:

GET /products/1

🔹 Reduce Product Stock (Internal / Order Service)
PUT /products/reduce/{id}?quantity=2


Example:

PUT /products/reduce/1?quantity=2


⚠️ Usually not called directly by client
Used internally by Order Service

5️⃣ Order Service APIs (Secured)
🔹 Place Order
POST /orders


Body

{
  "userId": 1,
  "productId": 1,
  "quantity": 2
}


✅ Process

Validates User

Checks Product Stock

Creates Order

Calls Payment Service

Reduces Stock

Updates Order Status

🔹 Get All Orders
GET /orders

🔹 Get Order By ID
GET /orders/{id}


Example:

GET /orders/1

6️⃣ Payment Service APIs
🔹 Make Payment (Called by Order Service)
POST /payments


Body

{
  "orderId": 1,
  "amount": 110000
}


⚠️ Normally NOT called directly by client
Triggered automatically when order is placed.
##  Base URL (API Gateway)
http://localhost:8085

Register User

POST /auth/register

Login

POST /auth/login

Create User

POST /users

Create Products

POST /products

Place Order

POST /orders

## Authentication Flow (JWT)
1.User registers or logs in via Auth Service
2.Auth Service returns a JWT Token
3.Token must be passed in Authorization Header
4.Secured services validate the token before processing requests
Authorization: Bearer <JWT_TOKEN>
##  Request Flow

1. Client sends request to API Gateway
2. API Gateway routes request to appropriate microservice
3. Services register themselves with Eureka Server
4. JWT token is validated for secure endpoints
5. Order Service communicates with Product & Payment services

---

##  Project Structure
microservices-project
│
├── eureka-server
├── api-gateway
├── auth-service
├── user-service
├── product-service
├── order-service
└── payment-service


---

##  Authentication Flow

- User registers via User Service
- Login via Auth Service
- JWT token generated
- Token required for secured APIs

---

##  Docker Support

Each service includes Docker configuration for containerized deployment.

---

##  How To Run (Local)
---
1.Start Eureka Server
2.Start API Gateway
3.Start all microservices:
   Auth Service
   User Service
   Product Service
   Order Service
4.Test APIs using Postman
---

##  Features

✔ User Registration & Login  
✔ JWT-Based Authentication  
✔ Product Management  
✔ Order Creation  
✔ Payment Processing  
✔ Service Discovery using Eureka  
✔ Centralized API Gateway  

---

##  Author

Boobathi Kumar N  
Backend Developer | Java | Spring Boot | Microservices
