# 🧪 Proyecto de Automatización API con Karate

## 📌 Descripción

Este proyecto es una **automatización de pruebas (testing)** para una API llamada **Serverest**.

👉 En palabras simples:
Este proyecto **prueba automáticamente** que una aplicación funcione correctamente sin necesidad de hacerlo manualmente.

Por ejemplo:

* Crear un usuario
* Buscar un usuario
* Actualizar datos
* Listar usuarios
* Eliminar usuarios

---

## 🎯 ¿Para qué sirve?

Sirve para verificar que el sistema funciona bien y evitar errores.

💡 Ejemplo:
En lugar de probar manualmente una API cada vez, este proyecto lo hace automáticamente en segundos.

---

## 🧰 Tecnologías usadas

* ☕ Java → lenguaje de programación
* 🥋 Karate → herramienta para pruebas de API
* 📦 Maven → gestor de dependencias y ejecución
* 🧪 JUnit → framework de pruebas

---

## 📁 Estructura del proyecto

```bash
DesafioBack/
│
├── src/
│   └── test/
│       ├── java/
│       │   ├── bdd/
│       │   │   ├── features/
│       │   │   │   ├── 01_registerUser.feature
│       │   │   │   ├── 02_updateUser.feature
│       │   │   │   ├── 03_searchUser.feature
│       │   │   │   ├── 04_listUser.feature
│       │   │   │   └── 05_deleteUser.feature
│       │   │
│       │   └── karate-config.js
│       │
│       └── resources/
│           ├── requests/
│           ├── schemas/
│           └── errors/
│
├── pom.xml
└── README.md
```

---

## 🧪 ¿Qué pruebas incluye?

Este proyecto prueba diferentes funcionalidades:

| Archivo         | Qué hace           |
| --------------- | ------------------ |
| 01_registerUser | Crear usuario      |
| 02_updateUser   | Actualizar usuario |
| 03_searchUser   | Buscar usuario     |
| 04_listUser     | Listar usuarios    |
| 05_deleteUser   | Eliminar usuario   |

---

## ⚙️ Configuración del proyecto

El archivo:

```
karate-config.js
```

Define la URL base de la API:

```javascript
baseUrl = 'https://serverest.dev'
```

👉 Esto permite no repetir la URL en todos los tests.

---

## ▶️ ¿Cómo ejecutar el proyecto?

### 1. Instalar requisitos

Necesitas tener instalado:

* Java (JDK 11 o superior)
* Maven

---

### 2. Ejecutar pruebas

Abre la terminal en la carpeta del proyecto y ejecuta:

```bash 
  mvn test
``` 

---

## 📊 Resultados de las pruebas

Después de ejecutar, se genera un reporte en:

```
target/karate-reports
```

👉 Abre el archivo `.html` en el navegador para ver los resultados.

---

## 🧠 ¿Cómo funcionan los tests?

Ejemplo simple:

```gherkin
Scenario: Registrar un usuario
  Given path '/usuarios'
  When method post
  Then status 201
```

👉 Traducción:

* Ir a `/usuarios`
* Hacer una petición POST
* Esperar que responda con código 201

---

## 💡 Ventajas del proyecto

✔ Automatiza pruebas
✔ Reduce errores humanos
✔ Ahorra tiempo
✔ Fácil de mantener
✔ Escalable

---

## 🚀 Buenas prácticas usadas

* Uso de schemas para validar respuestas
* Separación de requests y datos
* Uso de configuración central (karate-config)
* Generación de datos dinámicos (emails únicos)

---

## 📌 Conclusión

Este proyecto demuestra cómo automatizar pruebas de una API de forma profesional usando Karate.

👉 Es ideal para:

* QA testers
* Automatización de APIs
* Aprender testing moderno

---

## 👨‍💻 Autor

QA José Eduardo Chipana Cáceres

---
