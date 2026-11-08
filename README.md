# 🚀 ConectaDev — Proyecto Final Ingeniería Web (2620)

**Plataforma Web Inteligente para Vinculación de Proyectos de Software, Diagnóstico de Brechas Técnicas y Rutas de Aprendizaje**

- **Asignatura:** Ingeniería Web (Código: 2620) — Periodo Académico 2026-10
- **Programa:** Ingeniería de Sistemas — Departamento de Sistemas, Facultad de Ingeniería
- **Institución:** Pontificia Universidad Javeriana

---

## 📋 Resumen del Proyecto

**ConectaDev** es una plataforma web diseñada para conectar desarrolladores y estudiantes de Ingeniería de Sistemas con proyectos reales de software (semilleros de investigación, proyectos de grado, laboratorios y emprendimientos universitarios). 

A diferencia de los portales de vacantes tradicionales basados en coincidencia léxica de palabras clave, **ConectaDev** integra:
1. **Modelado Semántico (OWL 2 DL + Razonador HermiT):** Inferencia automática de elegibilidad de candidatos (`CandidatoElegible`), clasificación de proyectos (`ProyectoAltaComplejidad`, `ProyectoValidado`) y equivalencia semántica entre tecnologías y competencias.
2. **Base de Datos de Grafos (Neo4j + Cypher):** Descubrimiento de rutas óptimas de aprendizaje (cursos cortos que cierran brechas técnicas entre el perfil del estudiante y las vacantes objetivo) y conformación de duplas complementarias de desarrollo (*Frontend + Backend*).
3. **Arquitectura Híbrida de Servicios Web (REST + SOAP):** API RESTful (OpenAPI 3.0.3) para la operación ágil del portal web y servicio SOAP 1.1 / WSDL 1.1 para la verificación formal de certificados académicos ante el Sistema de Registro Académico Universitario.

---

## 📂 Estructura del Repositorio y Entregables

| # | Entregable Oficial (Guía IW 2620) | Archivos en el Repositorio | Descripción |
|---|---|---|---|
| **1** | **Informe Técnico Completo (PDF y Markdown)** | [`Informe_Tecnico_Proyecto_Final_IW_2620_ConectaDev.pdf`](./Informe_Tecnico_Proyecto_Final_IW_2620_ConectaDev.pdf)<br>[`DOCUMENTO_TECNICO_PROYECTO_FINAL.md`](./DOCUMENTO_TECNICO_PROYECTO_FINAL.md) | Documento técnico completo (Secciones 4.1 a 4.9): Planteamiento del problema, Arquitectura en capas, Ingeniería Web (UWE), Servicios REST/SOAP, Ontología OWL, Grafo Neo4j, Atributos de Calidad (ISO/IEC 25010) y Reflexión Crítica. |
| **2** | **Prototipo Funcional Web (5 Pantallas)** | [`prototipo/index.html`](./prototipo/index.html) | Aplicación web interactiva de 5 vistas de usuario: *(1) Explorador de Vacantes con Compatibilidad, (2) Mi Perfil Técnico y Verificación Académica, (3) Postulación y Diagnóstico de Brechas, (4) Rutas de Aprendizaje y Equipos Sugeridos, (5) Panel de Líder de Proyecto*. |
| **3** | **Ontología OWL 2 DL (Protégé 5.x)** | [`ontologia/conectadev.owl`](./ontologia/conectadev.owl)<br>[`ontologia/GUIA_PROTEGE.md`](./ontologia/GUIA_PROTEGE.md) | Ontología formal en sintaxis RDF/XML con 12 clases, 11 propiedades de objeto, 6 propiedades de datos, 4 axiomas/restricciones DL, 15 individuos y 5 preguntas de competencia verificables con **HermiT**. |
| **4** | **Base de Datos de Grafos (Neo4j)** | [`neo4j/conectadev_grafo.cypher`](./neo4j/conectadev_grafo.cypher)<br>[`neo4j/GUIA_NEO4J.md`](./neo4j/GUIA_NEO4J.md) | Script Cypher con constraints de unicidad, 16 nodos en 5 etiquetas (`Desarrollador`, `ProyectoSoftware`, `VacanteRol`, `HabilidadTecnica`, `CursoAprendizaje`), 26 relaciones y 4 consultas Cypher avanzadas de recomendación. |
| **5** | **Contratos de Servicios Web (REST + SOAP)** | [`servicios-web/openapi.yaml`](./servicios-web/openapi.yaml)<br>[`servicios-web/validacion_academica.wsdl`](./servicios-web/validacion_academica.wsdl) | Especificación **OpenAPI 3.0.3** (6 endpoints REST JSON) y contrato **WSDL 1.1 / SOAP 1.1** (`VerificarCertificacionCurso` con validación XSD estricta). |
| **6** | **Presentación de Sustentación** | [`PRESENTACION_SUSTENTACION.md`](./PRESENTACION_SUSTENTACION.md) | Guion estructurado para sustentación de 20 minutos (15 min exposición + 5 min preguntas) distribuido equitativamente para 4 integrantes. |
| **7** | **Enunciado Oficial del Proyecto** | [`Proyecto Final IW 2620.pdf`](./Proyecto%20Final%20IW%202620.pdf) | Documento de lineamientos oficiales de la asignatura Ingeniería Web (2620). |

---

## 🛠️ Instrucciones Rápidas de Ejecución

### 1. Prototipo Web Interactivo
Abra directamente el archivo [`prototipo/index.html`](./prototipo/index.html) en cualquier navegador web moderno (Chrome, Edge, Firefox). No requiere servidor de compilación adicional.

### 2. Ontología en Protégé
1. Abra **Protégé 5.5+** y seleccione `File -> Open...` -> [`ontologia/conectadev.owl`](./ontologia/conectadev.owl).
2. En el menú `Reasoner`, seleccione **HermiT** y haga clic en `Start reasoner`.
3. Consulte la guía paso a paso en [`ontologia/GUIA_PROTEGE.md`](./ontologia/GUIA_PROTEGE.md) para ejecutar las expresiones DL Query de validación.

### 3. Grafo de Conocimiento en Neo4j
1. Cree una instancia en **Neo4j Desktop** o **Neo4j AuraDB** y abra **Neo4j Browser**.
2. Copie y ejecute el contenido de [`neo4j/conectadev_grafo.cypher`](./neo4j/conectadev_grafo.cypher).
3. Consulte las 4 consultas analíticas y de recomendación documentadas en [`neo4j/GUIA_NEO4J.md`](./neo4j/GUIA_NEO4J.md).

### 4. Contratos de Servicios Web (Swagger / SoapUI)
- **REST:** Importe [`servicios-web/openapi.yaml`](./servicios-web/openapi.yaml) en [Swagger Editor](https://editor.swagger.io/) o Postman.
- **SOAP:** Importe [`servicios-web/validacion_academica.wsdl`](./servicios-web/validacion_academica.wsdl) en **SoapUI** o Postman para inspeccionar la operación `VerificarCertificacionCurso`.
