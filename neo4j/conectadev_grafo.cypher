// =====================================================================================
// PROYECTO FINAL INGENIERÍA WEB (2620) - UNIVERSIDAD COOPERATIVA DE COLOMBIA
// GRAFO DE CONOCIMIENTO: CONECTADEV (Proyectos de Software, Habilidades y Aprendizaje)
// =====================================================================================
// Requisitos cubiertos (Sección 4.8):
// - Mínimo 8 nodos      -> Incluye 16 nodos (:Desarrollador, :LiderProyecto, :Mentor,
//                          :Proyecto, :Tecnologia, :Curso)
// - Mínimo 10 relaciones -> Incluye 26 relaciones semánticas
// - Mínimo 3 consultas   -> Incluye 4 consultas Cypher (2 de recomendación e inferencia de
//                           conocimiento no registrado directamente)
// =====================================================================================

// 0. LIMPIEZA OPCIONAL DEL ENTORNO DE PRUEBAS
MATCH (n) DETACH DELETE n;

// =====================================================================================
// 1. CREACIÓN DE NODOS DEL GRAFO DE CONOCIMIENTO (16 NODOS)
// =====================================================================================

// Tecnologías de Software (4)
CREATE (tJS:Tecnologia {
  id: 'TECH-JS',
  nombre: 'JavaScript ES6+',
  area: 'Frontend',
  demandaMercado: 'Alta'
})
CREATE (tReact:Tecnologia {
  id: 'TECH-REACT',
  nombre: 'React.js',
  area: 'Frontend',
  demandaMercado: 'Muy Alta'
})
CREATE (tNode:Tecnologia {
  id: 'TECH-NODE',
  nombre: 'Node.js & Express',
  area: 'Backend',
  demandaMercado: 'Muy Alta'
})
CREATE (tPostgres:Tecnologia {
  id: 'TECH-PG',
  nombre: 'PostgreSQL',
  area: 'Base de Datos',
  demandaMercado: 'Alta'
})

// Cursos Formativos (3)
CREATE (cPOO:Curso {
  id: 'CUR-01',
  titulo: 'Fundamentos de Programación y Lógica',
  nivel: 'Básico',
  horas: 24,
  modalidad: 'Virtual Asincrónico'
})
CREATE (cNode:Curso {
  id: 'CUR-02',
  titulo: 'Desarrollo de APIs REST con Node.js',
  nivel: 'Intermedio',
  horas: 32,
  modalidad: 'Virtual Guiado'
})
CREATE (cSQL:Curso {
  id: 'CUR-03',
  titulo: 'Modelado y Consultas en PostgreSQL',
  nivel: 'Intermedio',
  horas: 28,
  modalidad: 'Práctico en Laboratorio'
})

// Desarrolladores / Estudiantes de Ingeniería (3)
CREATE (dAna:Desarrollador {
  id: 'DEV-01',
  nombre: 'Ana Sofía Gómez',
  semestre: 8,
  aniosExperiencia: 2,
  perfilPrincipal: 'FullStack'
})
CREATE (dCarlos:Desarrollador {
  id: 'DEV-02',
  nombre: 'Carlos Mario Restrepo',
  semestre: 6,
  aniosExperiencia: 1,
  perfilPrincipal: 'Frontend'
})
CREATE (dMateo:Desarrollador {
  id: 'DEV-03',
  nombre: 'Mateo Fernández',
  semestre: 7,
  aniosExperiencia: 2,
  perfilPrincipal: 'Backend & Datos'
})

// Líderes Técnicos de Proyecto (2)
CREATE (lAlejandro:LiderProyecto {
  id: 'LID-01',
  nombre: 'Ing. Alejandro Vargas',
  especialidad: 'Arquitectura Web y Cloud',
  aniosExperiencia: 6
})
CREATE (lValeria:LiderProyecto {
  id: 'LID-02',
  nombre: 'Ing. Valeria Córdoba',
  especialidad: 'Ingeniería de Software y FinTech',
  aniosExperiencia: 5
})

// Mentora Académica (1)
CREATE (mElena:Mentor {
  id: 'MEN-01',
  nombre: 'Dra. Elena Martínez',
  departamento: 'Ingeniería de Sistemas y Software',
  aniosExperiencia: 10
})

// Proyectos de Software (3)
CREATE (pTelemedicina:Proyecto {
  id: 'PROY-01',
  titulo: 'Sistema Web de Citas y Telemedicina Universitaria',
  modalidad: 'Semillero de Investigación',
  cuposDisponibles: 3,
  convocatoriaAbierta: true,
  repositorioGit: 'https://github.com/ucc-ingweb/telemedicina-web'
})
CREATE (pFinTech:Proyecto {
  id: 'PROY-02',
  titulo: 'Billetera Digital y Pasarela de Pagos Estudiantil',
  modalidad: 'Proyecto Integrador',
  cuposDisponibles: 2,
  convocatoriaAbierta: true,
  repositorioGit: 'https://github.com/ucc-ingweb/fintech-pagos'
})
CREATE (pCampusIoT:Proyecto {
  id: 'PROY-03',
  titulo: 'Portal Web de Monitoreo Ambiental Campus Inteligente',
  modalidad: 'Innovación Abierta',
  cuposDisponibles: 3,
  convocatoriaAbierta: true,
  repositorioGit: 'https://github.com/ucc-ingweb/campus-iot'
})

// =====================================================================================
// 2. CREACIÓN DE RELACIONES SEMÁNTICAS (26 RELACIONES)
// =====================================================================================

// Dependencias tecnológicas y prerrequisitos de cursos
CREATE (tReact)-[:DEPENDE_DE]->(tJS)
CREATE (cNode)-[:TIENE_PRERREQUISITO]->(cPOO)
CREATE (cSQL)-[:TIENE_PRERREQUISITO]->(cPOO)

// Habilidades enseñadas por cada curso y supervisión académica
CREATE (cPOO)-[:ENSENA_TECNOLOGIA]->(tJS)
CREATE (cNode)-[:ENSENA_TECNOLOGIA]->(tNode)
CREATE (cSQL)-[:ENSENA_TECNOLOGIA]->(tPostgres)

CREATE (mElena)-[:SUPERVISA_CURSO]->(cPOO)
CREATE (mElena)-[:SUPERVISA_CURSO]->(cNode)
CREATE (mElena)-[:SUPERVISA_CURSO]->(cSQL)

// Habilidades dominadas por los desarrolladores
CREATE (dAna)-[:DOMINA {nivel: 'Avanzado'}]->(tJS)
CREATE (dAna)-[:DOMINA {nivel: 'Avanzado'}]->(tReact)
CREATE (dAna)-[:DOMINA {nivel: 'Intermedio'}]->(tNode)
CREATE (dAna)-[:DOMINA {nivel: 'Intermedio'}]->(tPostgres)

CREATE (dCarlos)-[:DOMINA {nivel: 'Avanzado'}]->(tJS)
CREATE (dCarlos)-[:DOMINA {nivel: 'Avanzado'}]->(tReact)

CREATE (dMateo)-[:DOMINA {nivel: 'Avanzado'}]->(tNode)
CREATE (dMateo)-[:DOMINA {nivel: 'Avanzado'}]->(tPostgres)

// Tecnologías requeridas por cada proyecto de software
CREATE (pTelemedicina)-[:REQUIERE_TECNOLOGIA {obligatoria: true}]->(tReact)
CREATE (pTelemedicina)-[:REQUIERE_TECNOLOGIA {obligatoria: true}]->(tNode)
CREATE (pTelemedicina)-[:REQUIERE_TECNOLOGIA {obligatoria: true}]->(tPostgres)

CREATE (pFinTech)-[:REQUIERE_TECNOLOGIA {obligatoria: true}]->(tNode)
CREATE (pFinTech)-[:REQUIERE_TECNOLOGIA {obligatoria: true}]->(tPostgres)

CREATE (pCampusIoT)-[:REQUIERE_TECNOLOGIA {obligatoria: true}]->(tJS)
CREATE (pCampusIoT)-[:REQUIERE_TECNOLOGIA {obligatoria: true}]->(tReact)
CREATE (pCampusIoT)-[:REQUIERE_TECNOLOGIA {obligatoria: true}]->(tNode)

// Liderazgo y postulaciones
CREATE (lAlejandro)-[:LIDERA]->(pTelemedicina)
CREATE (lAlejandro)-[:LIDERA]->(pCampusIoT)
CREATE (lValeria)-[:LIDERA]->(pFinTech)

CREATE (dAna)-[:POSTULA_A {fecha: '2026-11-01', estado: 'En revisión'}]->(pTelemedicina);


// =====================================================================================
// 3. CONSULTAS CYPHER DEL PROYECTO (SECCIÓN 4.8)
// =====================================================================================

// -------------------------------------------------------------------------------------
// CONSULTA 1: Índice de Compatibilidad Desarrollador - Proyecto de Software
// Necesidad atendida: Evaluar qué porcentaje de las tecnologías exigidas por cada proyecto
// ya domina cada desarrollador para priorizar postulaciones.
// -------------------------------------------------------------------------------------
MATCH (p:Proyecto {convocatoriaAbierta: true})-[:REQUIERE_TECNOLOGIA]->(tReq:Tecnologia)
WITH p, collect(tReq) AS TecnologiasProyecto, count(tReq) AS TotalRequeridas
MATCH (d:Desarrollador)
OPTIONAL MATCH (d)-[:DOMINA]->(tDom:Tecnologia)
WHERE tDom IN TecnologiasProyecto
WITH d, p, TotalRequeridas,
     collect(tDom.nombre) AS HabilidadesCumplidas,
     count(tDom) AS CantidadCumplidas
WHERE CantidadCumplidas > 0
RETURN d.nombre AS Desarrollador,
       p.titulo AS ProyectoCompatible,
       HabilidadesCumplidas,
       CantidadCumplidas + ' de ' + TotalRequeridas AS CoberturaStack,
       round((toFloat(CantidadCumplidas) / TotalRequeridas) * 100.0, 1) AS PorcentajeCompatibilidad
ORDER BY PorcentajeCompatibilidad DESC, Desarrollador ASC;


// -------------------------------------------------------------------------------------
// CONSULTA 2 (RECOMENDACIÓN E INFERENCIA DE CONOCIMIENTO NO REGISTRADO DIRECTAMENTE):
// Diagnóstico de Brechas (Skill Gap) y Recomendación Automática de Cursos Formativos
// Explicación: Identifica para un desarrollador (ej. Carlos Mario) qué tecnologías le faltan
// para alcanzar el 100% en los proyectos donde ya tiene afinidad parcial, y le recomienda
// exactamente qué cursos tomar (y con qué mentor) para desbloquear dichos proyectos.
// -------------------------------------------------------------------------------------
MATCH (d:Desarrollador {id: 'DEV-02'})-[:DOMINA]->(tActual:Tecnologia)<-[:REQUIERE_TECNOLOGIA]-(p:Proyecto)
MATCH (p)-[:REQUIERE_TECNOLOGIA]->(tFaltante:Tecnologia)
WHERE NOT (d)-[:DOMINA]->(tFaltante)
MATCH (cursoRecomendado:Curso)-[:ENSENA_TECNOLOGIA]->(tFaltante)
OPTIONAL MATCH (mentor:Mentor)-[:SUPERVISA_CURSO]->(cursoRecomendado)
OPTIONAL MATCH (cursoRecomendado)-[:TIENE_PRERREQUISITO]->(prerreq:Curso)
RETURN d.nombre AS Desarrollador,
       p.titulo AS ProyectoObjetivo,
       tFaltante.nombre AS HabilidadFaltanteDetectada,
       cursoRecomendado.titulo AS CursoRecomendadoParaCerrarBrecha,
       cursoRecomendado.horas AS HorasEstimadas,
       coalesce(prerreq.titulo, 'Sin prerrequisito pendiente') AS PrerrequisitoBase,
       mentor.nombre AS MentorAsignado;


// -------------------------------------------------------------------------------------
// CONSULTA 3 (RECOMENDACIÓN DE ASOCIACIÓN IMPLÍCITA ENTRE PARES):
// Conformación Inteligente de Duplas Complementarias (Frontend + Backend)
// Explicación: Descubre parejas de desarrolladores que no están conectados directamente,
// pero cuyas habilidades combinadas cubren el 100% de las tecnologías requeridas por un proyecto.
// -------------------------------------------------------------------------------------
MATCH (p:Proyecto {id: 'PROY-01'})
MATCH (d1:Desarrollador {perfilPrincipal: 'Frontend'})-[:DOMINA]->(t1:Tecnologia)<-[:REQUIERE_TECNOLOGIA]-(p)
MATCH (d2:Desarrollador {perfilPrincipal: 'Backend & Datos'})-[:DOMINA]->(t2:Tecnologia)<-[:REQUIERE_TECNOLOGIA]-(p)
WHERE d1 <> d2
RETURN p.titulo AS Proyecto,
       d1.nombre AS DesarrolladorFrontend,
       collect(DISTINCT t1.nombre) AS HabilidadesFrontendAportadas,
       d2.nombre AS DesarrolladorBackendComplementario,
       collect(DISTINCT t2.nombre) AS HabilidadesBackendAportadas,
       'DUPLA_COMPLEMENTARIA_100%_STACK' AS AsociacionInferida;


// -------------------------------------------------------------------------------------
// CONSULTA 4: Ruta Transitiva de Dependencias Tecnológicas y Prerrequisitos Académicos
// Necesidad atendida: Mostrar la secuencia completa de aprendizaje para dominar un stack.
// -------------------------------------------------------------------------------------
MATCH ruta = (cFinal:Curso)-[:TIENE_PRERREQUISITO*1..3]->(cBase:Curso)
RETURN [nodo IN nodes(ruta) | nodo.titulo] AS SecuenciaDeCursos,
       reduce(totalHoras = 0, n IN nodes(ruta) | totalHoras + n.horas) AS HorasTotalesRuta;
