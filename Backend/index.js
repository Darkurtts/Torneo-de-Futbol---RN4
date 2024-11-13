// backend/index.js
const express = require('express');
const cors = require('cors');
const { sequelize } = require('./models'); // Importa sequelize de tu archivo de configuración de modelos
const authRoutes = require('./routes/authRoutes'); // Rutas de autenticación (ejemplo)
const equipoRoutes = require('./routes/equipoRoutes'); // Rutas para equipos
const jugadorRoutes = require('./routes/jugadorRoutes'); // Rutas para jugadores

const app = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use(cors());
app.use(express.json());

// Rutas
app.use('/auth', authRoutes); // Rutas para autenticación
app.use('/equipos', equipoRoutes); // Rutas para equipos
app.use('/jugadores', jugadorRoutes); // Rutas para jugadores

// Conectar a la base de datos y arrancar el servidor
sequelize.authenticate()
  .then(() => {
    console.log('Conexión a la base de datos exitosa');
    app.listen(PORT, () => {
      console.log(`Servidor en funcionamiento en el puerto ${PORT}`);
    });
  })
  .catch(err => {
    console.error('Error al conectar a la base de datos:', err);
  });
