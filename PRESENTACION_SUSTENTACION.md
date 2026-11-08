# Estructura de Presentación y Guión de Sustentación (Secciones 5.8 y 6)
## **ConectaDev — Proyecto Final de Ingeniería Web (2620)**

**Tiempo máximo reglamentario:** 20 minutos por equipo (bloques de 5 minutos para hasta 4 integrantes).

---

## 1. Distribución de Tiempos y Diapositivas por Integrante

### **Integrante 1 (Minutos 0:00 – 5:00): Problema, Fundamentación y Metodología UWE**
- **Diapositiva 1 (Portada):** Título del proyecto (*ConectaDev: Plataforma Web para Vinculación de Proyectos de Software, Diagnóstico de Brechas Técnicas y Rutas de Aprendizaje*), equipo y objetivo.
- **Diapositiva 2 (Problema y Justificación Web — 4.1):** Por qué un CRUD simple por palabras clave no resuelve el emparejamiento entre estudiantes, proyectos de software y cursos; los **3 perfiles de usuario** (`Desarrollador`, `LiderProyecto`, `MentorAcademico`) y las **6 funcionalidades**.
- **Diapositiva 3 (Fundamentación y Metodología UWE — 4.2 y 4.4):** Las 6 fuentes académicas (Koch & Kraus UWE, Horrocks OWL, Noy & McGuinness, Hogan Knowledge Graphs, Fielding/Kleppmann, Nielsen) y las 5 fases de UWE aplicadas.

### **Integrante 2 (Minutos 5:00 – 10:00): Arquitectura Web, Modelado y Demostración del Prototipo**
- **Diapositiva 4 (Arquitectura Web — 4.3):** Diagrama de Arquitectura Modular con Persistencia Políglota (PostgreSQL + Motor OWL + Neo4j) y cómo mantiene toda la complejidad semántica en el backend para entregar una interfaz limpia al usuario.
- **Diapositiva 5 (Modelado Conceptual y Navegacional UWE — 4.5):** Cómo las clases del dominio (`ProyectoSoftware`, `Desarrollador`, `HabilidadTecnica`, `CursoFormativo`) se conectan con los nodos navegacionales.
- **Diapositiva 6 (Demostración del Prototipo Navegable y Heurísticas de Nielsen — 4.5):** Abrir [`prototipo/index.html`](file:///C:/Users/Andres%20Hurtado/Documents/Ing%20Web/prototipo/index.html) y mostrar las 5 vistas reales (*Explorar Proyectos*, *Detalle y Ruta de Nivelación*, *Cursos y Rutas*, *Mi Perfil Técnico* y *Gestión de Líder*) explicando las 6 heurísticas de Nielsen aplicadas.

### **Integrante 3 (Minutos 10:00 – 15:00): Servicios Web (REST + SOAP) y Ontología en Protégé**
- **Diapositiva 7 (Servicios Web REST y SOAP/WSDL — 4.6):** Los 6 endpoints REST en [`servicios-web/openapi.yaml`](file:///C:/Users/Andres%20Hurtado/Documents/Ing%20Web/servicios-web/openapi.yaml) y el servicio SOAP/WSDL ([`servicios-web/validacion_academica.wsdl`](file:///C:/Users/Andres%20Hurtado/Documents/Ing%20Web/servicios-web/validacion_academica.wsdl)) para validar prerrequisitos y certificar cursos ante el Sistema de Registro Académico universitario.
- **Diapositiva 8 (Ontología del Dominio en Protégé — 4.7):** Presentación de [`ontologia/conectadev.owl`](file:///C:/Users/Andres%20Hurtado/Documents/Ing%20Web/ontologia/conectadev.owl) con sus 12 clases, 11 propiedades de objeto, 6 propiedades de datos, 4 restricciones y 15 individuos.
- **Diapositiva 9 (Ejecución del Razonador e Inferencias — 4.7):** Mostrar en Protégé cómo HermiT infiere automáticamente que `Dev_AnaSofia` es `DesarrolladorFullStack`, que `Proy_PlataformaTelemedicina` es `ProyectoListoParaIniciar`, y las relaciones transitivas `tienePrerrequisito` y `dependeDeTecnologia`.

### **Integrante 4 (Minutos 15:00 – 20:00): Grafo de Conocimiento Neo4j e Integración del Diseño**
- **Diapositiva 10 (Grafo de Conocimiento en Neo4j — 4.8):** Visualización de los 16 nodos y 26 relaciones creados con [`neo4j/conectadev_grafo.cypher`](file:///C:/Users/Andres%20Hurtado/Documents/Ing%20Web/neo4j/conectadev_grafo.cypher).
- **Diapositiva 11 (Consultas Cypher y Recomendaciones — 4.8):** Demostración de la Consulta 2 (Diagnóstico de brecha técnica para `Carlos Mario Restrepo` recomendando los cursos de `Node.js` y `PostgreSQL`) y Consulta 3 (Dupla complementaria `Carlos Mario + Mateo Fernández` para cubrir el 100% del proyecto).
- **Diapositiva 12 (Integración del Diseño — 4.9):** Cierre mostrando cómo el problema, modelo conceptual, navegación, ontología OWL, servicios web, grafo Neo4j y arquitectura se integran de forma coherente.

---

## 2. Preguntas Frecuentes del Jurado y Respuestas Clave

1. **¿Por qué este problema no se resuelve con un simple CRUD en SQL?**
   - **Respuesta:** Porque en Ingeniería de Software existen jerarquías conceptuales y dependencias transitivas: un CRUD no deduce por axiomas cuándo un estudiante pasa a ser `DesarrolladorFullStack`, ni deduce por transitividad toda la cadena de prerrequisitos de un curso avanzado (`Curso 3 -> Curso 2 -> Curso 1`), ni descubre en un grafo qué cursos exactos cierran la brecha entre las habilidades actuales de un estudiante y las exigidas por un proyecto.
2. **¿Cómo se refleja lo que hacen Protégé y Neo4j dentro del prototipo web sin confundir al usuario?**
   - **Respuesta:** Aplicando la heurística H2 de Nielsen (*Relación entre el sistema y el mundo real*): el motor OWL y Neo4j trabajan en la capa backend (a través de los servicios REST), mientras que el estudiante en la interfaz web solo ve resultados claros en su idioma: su barra de porcentaje de compatibilidad, su insignia de *Desarrollador FullStack*, las habilidades que le faltan resaltadas en ámbar y las tarjetas de los cursos recomendados.
3. **¿Por qué usar SOAP/WSDL para el servicio de Registro Académico y REST para el resto de la aplicación?**
   - **Respuesta:** El portal web interactivo usa **REST con JSON** por ligereza y velocidad en el navegador. En cambio, la acreditación oficial de cursos ante el **Sistema de Registro Académico Universitario** requiere un contrato estricto y tipado con validación XSD y manejo formal de fallos (`soap:Fault`), donde **SOAP/WSDL** es el estándar institucional.
