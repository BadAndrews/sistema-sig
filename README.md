# Sistema de Gestión de Clientes, Campañas, Interacciones y Transacciones

Proyecto desarrollado para la asignatura **Sistemas de Información para la Gestión**, cuyo objetivo es diseñar e implementar un sistema CRUD completo utilizando **Python**, **PyQt5**, **Qt Designer** y **MySQL**.

---

##  1. Descripción General

El sistema permite gestionar cuatro módulos principales:

1. **Clientes**
2. **Campañas**
3. **Interacciones**
4. **Transacciones**

Cada módulo cuenta con operaciones **CRUD completas**:
- Agregar
- Leer (listar)
- Editar
- Eliminar

El software implementa interfaces gráficas en PyQt5 y comunicación directa con una base de datos MySQL.

---

##  2. Estructura del Proyecto

```
/proyecto-sig/
│
├── main.py
├── database/
│   ├── creacion_bd.sql
│   ├── datos_iniciales.sql
│
├── ui/
│   ├── clientes.ui
│   ├── campanias.ui
│   ├── interacciones.ui
│   ├── transacciones.ui
│
├── src/
│   ├── clientes.py
│   ├── campanias.py
│   ├── interacciones.py
│   ├── transacciones.py
│
├── resources/
│   ├── iconos/
│   ├── capturas/
│
└── README.md
```

---

##  3. Requisitos

### 🛠 Software Necesario
- Python 3.10+
- MySQL Server 8.0+
- Qt Designer
- Anaconda (opcional)

###  Librerías Python
Ejecutar:

```bash
pip install PyQt5 mysql-connector-python
```

---

##  4. Configuración de la Base de Datos

1. Abrir MySQL Workbench  
2. Ejecutar:

```sql
SOURCE database/creacion_bd.sql;
```

Si corresponde:

```sql
SOURCE database/datos_iniciales.sql;
```

3. Editar en `main.py` la sección de conexión:

```python
self.connection = mysql.connector.connect(
    host="localhost",
    user="root",
    password="TU_PASSWORD",
    database="sig"
)
```

---

##  5. Ejecución del Sistema

En la carpeta principal:

```bash
python main.py
```

---

##  6. Módulos del Sistema

### 6.1. Clientes
Permite gestionar:
- RUT
- Nombre completo
- Email
- Teléfono
- Rubro
- Fecha 1er contacto
- Canal de adquisición
- Estado
- Fechas de creación y actualización

### 6.2. Campañas
Incluye:
- Plan asociado
- Cliente
- Tipo de servicio
- Estado campaña
- Destinatarios enviados
- Asunto camapaña
- Tasas de apertura/click
- Fecha de creación y envío

### 6.3. Interacciones
Registra:
- Cliente
- Tipo de interacción
- Medio de contacto
- Responsable
- Fecha de interacción y creación
- Descripción

### 6.4. Transacciones
Permite guardar:
- Cliente
- Fecha de transacción y creación
- Monto
- Tipo de servicio
- Estado del pago
- Descripción
