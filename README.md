# TagFlow 🚀

TagFlow es una red social multiplataforma (web y móvil) basada en un sistema de tags jerárquicos, desarrollada como Trabajo de Fin de Grado (TFG) del ciclo de Desarrollo de Aplicaciones Multiplataforma (DAM).

El proyecto tiene como objetivo ofrecer una plataforma moderna donde los usuarios puedan crear publicaciones, interactuar entre ellos y descubrir contenido a través de categorías y etiquetas organizadas de forma estructurada.

![TFG](https://img.shields.io/badge/Proyecto-TFG-blue)
![Status](https://img.shields.io/badge/Estado-En%20desarrollo-yellow)
![Backend](https://img.shields.io/badge/Backend-Symfony-black?logo=symfony)
![Database](https://img.shields.io/badge/Database-MySQL-blue?logo=mysql)
![Frontend](https://img.shields.io/badge/Frontend-React%20%2F%20React%20Native-61dafb?logo=react)
![API](https://img.shields.io/badge/API-REST-green)
![Auth](https://img.shields.io/badge/Auth-JWT-orange)
![License](https://img.shields.io/badge/Licencia-Educativa-lightgrey)

---

## 🧠 Concepto del proyecto

TagFlow se inspira en las principales redes sociales actuales, combinando:

- Publicación de contenido por parte de los usuarios
- Interacción social (comentarios, reacciones y seguidores)
- Sistema de etiquetas (tags) como eje central de organización
- Tags jerárquicos (categorías padre/hijo)

El sistema está diseñado siguiendo buenas prácticas de ingeniería del software, con una arquitectura escalable, modular y mantenible.

---

## 🏗️ Arquitectura general

El proyecto sigue una arquitectura cliente-servidor:

Frontend (React / React Native)  
↓ Axios (HTTP / JSON)  
Backend (Symfony - API REST)  
↓  
Base de datos MySQL  

---

## 🔧 Tecnologías utilizadas

### Backend
- Symfony (PHP) – API REST
- MySQL – Base de datos relacional
- Doctrine ORM – Acceso a datos
- JWT – Autenticación y autorización
- Swagger (NelmioApiDocBundle) – Documentación de la API
- Cloudinary – Almacenamiento de imágenes

### Frontend
- React – Aplicación web
- React Native – Aplicación móvil
- Axios – Comunicación con la API
- React Context y Hooks – Gestión del estado

---

## 🗄️ Base de datos

La base de datos sigue un modelo lógico relacional normalizado e incluye:

- Usuarios
- Publicaciones
- Tags jerárquicos
- Comentarios
- Reacciones
- Seguidores
- Mensajes privados
- Notificaciones
- Publicaciones guardadas

El esquema completo y los datos iniciales se encuentran en el fichero SQL del proyecto.

---

## 📂 Estructura del repositorio

tagflow/
├── backend/
├── frontend/
├── database/
│   └── tagflow_full.sql
├── docs/
│   ├── memoria/
│   └── anexo/
└── README.md

---

## 🚀 Instalación (entorno local)

### Base de datos
mysql -u usuario -p < tagflow_full.sql

### Backend
cd backend  
composer install  
symfony server:start  

### Frontend
cd frontend  
npm install  
npm start  

---

## 🔐 Autenticación

La API utiliza JSON Web Tokens (JWT).  
El token se incluye en las peticiones protegidas mediante la cabecera:

Authorization: Bearer <token>

---

## 📘 Documentación

- Documentación interna: incluida en el anexo del TFG
- Documentación externa: orientada al uso de la aplicación
- Documentación de la API: accesible mediante Swagger

---

## 📈 Posibles mejoras

- Sistema de roles (usuario / administrador)
- Moderación de contenido
- Recomendaciones basadas en tags
- Notificaciones en tiempo real
- Publicaciones patrocinadas

---

## 👤 Autor

Ignacio Montero  
Estudiante de Desarrollo de Aplicaciones Multiplataforma (DAM)  
Trabajo de Fin de Grado
![TFG](https://img.shields.io/badge/Proyecto-TFG-blue)
![Status](https://img.shields.io/badge/Estado-En%20desarrollo-yellow)
![Backend](https://img.shields.io/badge/Backend-Symfony-black?logo=symfony)
![Database](https://img.shields.io/badge/Database-MySQL-blue?logo=mysql)
![Frontend](https://img.shields.io/badge/Frontend-React%20%2F%20React%20Native-61dafb?logo=react)
![API](https://img.shields.io/badge/API-REST-green)
![Auth](https://img.shields.io/badge/Auth-JWT-orange)
![License](https://img.shields.io/badge/Licencia-Educativa-lightgrey)


---

## 📄 Licencia

Proyecto desarrollado con fines educativos como Trabajo de Fin de Grado.
