# Guía de Ejecución y Evidencias en Neo4j (Sección 4.8 y Entregables 5 y 6)

Este archivo documenta la ejecución del script [`conectadev_grafo.cypher`](file:///C:/Users/Andres%20Hurtado/Documents/Ing%20Web/neo4j/conectadev_grafo.cypher) en **Neo4j Desktop** o **Neo4j AuraDB Free (Cloud)** para el proyecto **ConectaDev**.

---

## 1. Cumplimiento de Requisitos Mínimos (Sección 4.8)

| Requisito del PDF | Exigido | Implementado en `conectadev_grafo.cypher` |
| :--- | :---: | :---: |
| **Nodos en el grafo** | $\ge 8$ | **16 nodos** distribuidos en 6 etiquetas semánticas (`:Desarrollador`, `:LiderProyecto`, `:Mentor`, `:Proyecto`, `:Tecnologia`, `:Curso`) |
| **Relaciones en el grafo** | $\ge 10$ | **26 relaciones** dirigidas (`:DOMINA`, `:REQUIERE_TECNOLOGIA`, `:LIDERA`, `:POSTULA_A`, `:ENSENA_TECNOLOGIA`, `:TIENE_PRERREQUISITO`, `:SUPERVISA_CURSO`, `:DEPENDE_DE`) |
| **Consultas en Cypher** | $\ge 3$ | **4 consultas Cypher** completas orientadas a reglas de negocio del dominio de Ingeniería de Software |
| **Consulta de recomendación / conocimiento implícito** | $\ge 1$ | **2 consultas de inferencia de grafos** (Consulta 2: Diagnóstico de brechas técnicas y recomendación automática de cursos; Consulta 3: Conformación de duplas complementarias Frontend + Backend) |

---

## 2. Instrucciones Paso a Paso para Generar las Evidencias

1. Ingresa a [Neo4j Console / AuraDB Free](https://console.neo4j.io) o abre **Neo4j Desktop** y lanza **Neo4j Browser**.
2. Copia y pega las secciones **1 y 2** de [`conectadev_grafo.cypher`](file:///C:/Users/Andres%20Hurtado/Documents/Ing%20Web/neo4j/conectadev_grafo.cypher) (desde `MATCH (n) DETACH DELETE n;` hasta el final de las sentencias `CREATE`) y presiona `Play`.
3. **Captura 1 (Grafo General):**
   Ejecuta en la barra de comandos:
   ```cypher
   MATCH (n)-[r]->(m) RETURN n, r, m
   ```
   Toma captura de la vista visual de nodos y relaciones (`Graph View`).
4. **Captura 2 (Consulta 1 - Compatibilidad Desarrollador–Proyecto):**
   Ejecuta la **Consulta 1** del archivo y toma captura de la tabla resultante.
5. **Captura 3 (Consulta 2 - Recomendación Automática de Cursos para Cerrar Brechas):**
   Ejecuta la **Consulta 2** del archivo y toma captura de la recomendación generada.

---

## 3. Resultados Esperados de las Consultas

### Consulta 1: Índice de Compatibilidad Desarrollador–Proyecto
Calcula el porcentaje de cobertura del stack tecnológico de cada proyecto para cada desarrollador:

| Desarrollador | ProyectoCompatible | HabilidadesCumplidas | CoberturaStack | PorcentajeCompatibilidad |
| :--- | :--- | :--- | :---: | :---: |
| **Ana Sofía Gómez** | Sistema Web de Citas y Telemedicina Universitaria | `['React.js', 'Node.js & Express', 'PostgreSQL']` | 3 de 3 | **100.0%** |
| **Ana Sofía Gómez** | Billetera Digital y Pasarela de Pagos Estudiantil | `['Node.js & Express', 'PostgreSQL']` | 2 de 2 | **100.0%** |
| **Mateo Fernández** | Billetera Digital y Pasarela de Pagos Estudiantil | `['Node.js & Express', 'PostgreSQL']` | 2 de 2 | **100.0%** |
| **Carlos Mario Restrepo** | Portal Web de Monitoreo Ambiental Campus Inteligente | `['JavaScript ES6+', 'React.js']` | 2 de 3 | **66.7%** |
| **Mateo Fernández** | Sistema Web de Citas y Telemedicina Universitaria | `['Node.js & Express', 'PostgreSQL']` | 2 de 3 | **66.7%** |
| **Carlos Mario Restrepo** | Sistema Web de Citas y Telemedicina Universitaria | `['React.js']` | 1 de 3 | **33.3%** |

### Consulta 2: Recomendación de Cursos para Cerrar Brecha de Habilidades (Conocimiento Implícito)
Para `Carlos Mario Restrepo` (quien domina Frontend con `JavaScript` y `React`, pero quiere postularse al proyecto de `Telemedicina` o `Campus Inteligente`), el grafo detecta qué tecnologías del proyecto aún no domina (`Node.js & Express` y `PostgreSQL`) y le recomienda los cursos exactos para cubrir esa brecha:

| Desarrollador | ProyectoObjetivo | HabilidadFaltanteDetectada | CursoRecomendadoParaCerrarBrecha | HorasEstimadas | PrerrequisitoBase | MentorAsignado |
| :--- | :--- | :--- | :--- | :---: | :--- | :--- |
| **Carlos Mario Restrepo** | Sistema Web de Citas y Telemedicina Universitaria | `Node.js & Express` | **Desarrollo de APIs REST con Node.js** | 32 | Fundamentos de Programación y Lógica | Dra. Elena Martínez |
| **Carlos Mario Restrepo** | Sistema Web de Citas y Telemedicina Universitaria | `PostgreSQL` | **Modelado y Consultas en PostgreSQL** | 28 | Fundamentos de Programación y Lógica | Dra. Elena Martínez |

### Consulta 3: Recomendación de Duplas Complementarias (Conocimiento Implícito)
Descubre que `Carlos Mario Restrepo` (Frontend: `React.js`) y `Mateo Fernández` (Backend & Datos: `Node.js`, `PostgreSQL`), aunque no tienen relación directa entre sí, juntos cubren el **100% del stack** del proyecto `Sistema Web de Citas y Telemedicina Universitaria`.
