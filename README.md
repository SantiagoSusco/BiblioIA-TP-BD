# 📚 BiblioIA: Sistema de Gestión de Biblioteca con IA

Trabajo Práctico Integrador para la materia **Base de Datos** - UTN FRCU (2026).
Este proyecto integra una base de datos relacional MySQL con un Agente de Inteligencia Artificial (LLM) capaz de traducir preguntas en lenguaje natural a consultas SQL y ejecutarlas en tiempo real.

## 👥 Integrantes del Grupo
* [Carricarte Lautaro]
* [Fiorotto Emir]
* [Ramirez Franco]
* [Susco Santiago]
* [Telli Benjamin]

## 🛠️ Tecnologías Utilizadas
* **Base de Datos:** MySQL (Aiven / Local)
* **Lenguaje:** Python 3.10+
* **Inteligencia Artificial:** Modelo Llama 3 (vía API de Groq)
* **Entorno:** Jupyter Notebook
* **Librerías:** pandas, sqlalchemy, mysql-connector-python, openai

## ⚙️ Instalación y Configuración

Sigue estos pasos para configurar y ejecutar el proyecto en tu computadora:

### 1. Clonar el repositorio
Abre tu terminal y ejecuta:

git clone https://github.com/SantiagoSusco/BiblioIA-TP-BD
cd BiblioIA-TP-BD

### 2. Instalar dependencias
pip install mysql-connector-python pandas openai python-dotenv jupyter sqlalchemy

###3. Configurar Variables de Entorno
Crea un archivo llamado .env en la raíz del proyecto. (Este archivo no se sube a GitHub por seguridad). Pega el siguiente formato y reemplaza con tus credenciales:


# Conexión a la Base de Datos MySQL
DB_HOST=tu_host_aqui
DB_PORT=tu_puerto
DB_NAME=TP_FINAL
DB_USER=tu_usuario
DB_PASSWORD=tu_contraseña

# API Key para el Agente de IA (Groq)
LLM_API_KEY=gsk_tu_clave_de_groq_aqui

###💡 Ejemplos de Uso del Agente
Una vez ejecutado el sistema, puedes hacerle preguntas como:

"¿Cuáles son los 5 libros más prestados?"

"¿Qué socios tienen actualmente el estado suspendido?"

"¿Cuántos ejemplares de Harry Potter tenemos disponibles?"
