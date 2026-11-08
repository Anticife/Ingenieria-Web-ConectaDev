# Guía de Ejecución y Evidencias en Protégé (Sección 4.7 y Entregable 6)

Este documento explica cómo validar la ontología [`conectadev.owl`](file:///C:/Users/Andres%20Hurtado/Documents/Ing%20Web/ontologia/conectadev.owl) en **Protégé 5.5 / 5.6** y cómo capturar las evidencias requeridas para la entrega y sustentación del proyecto **ConectaDev**.

---

## 1. Cumplimiento de Requisitos Mínimos (Sección 4.7)

| Requisito del PDF | Exigido | Implementado en `conectadev.owl` |
| :--- | :---: | :---: |
| **Clases (`owl:Class`)** | $\ge 8$ | **12 clases** (incluyendo 2 clases definidas mediante `owl:equivalentClass`: `DesarrolladorFullStack` y `ProyectoListoParaIniciar`) |
| **Propiedades de Objeto (`owl:ObjectProperty`)** | $\ge 10$ | **11 propiedades de objeto** (con 3 pares `owl:inverseOf` y 2 propiedades `owl:TransitiveProperty`) |
| **Propiedades de Datos (`owl:DatatypeProperty`)** | $\ge 5$ | **6 propiedades de datos** (`semestreActual`, `aniosExperiencia`, `horasDuracionCurso`, `cuposDisponibles`, `repositorioGitUrl`, `convocatoriaAbierta`) |
| **Dominios y Rangos** | Sí | Definidos en todas las propiedades (`rdfs:domain` y `rdfs:range`) |
| **Restricciones Lógicas (`owl:Restriction`)** | $\ge 3$ | **4 restricciones** (`someValuesFrom`, `hasValue`, intersecciones `intersectionOf`) |
| **Individuos (`owl:NamedIndividual`)** | $\ge 8$ | **15 individuos** (desarrolladores, líder de proyecto, mentora, tecnologías Frontend/Backend/BD, proyectos y cursos) |
| **Preguntas de Competencia** | $\ge 3$ | **5 preguntas de competencia** con sus expresiones DL Query y SPARQL |
| **Inferencias derivadas explicadas** | $\ge 2$ | **4 inferencias automáticas** comprobables con el razonador HermiT / Pellet |

---

## 2. Paso a Paso para Ejecutar el Razonador y Tomar Capturas

1. Abre **Protégé Desktop** y selecciona `File -> Open...` cargando el archivo [`ontologia/conectadev.owl`](file:///C:/Users/Andres%20Hurtado/Documents/Ing%20Web/ontologia/conectadev.owl).
2. Ve al menú superior `Reasoner -> HermiT` (o `Pellet`) y haz clic en **`Start reasoner`** (`Ctrl+R`).
3. Verifica que en la esquina inferior derecha aparezca `Reasoner active` sin errores de inconsistencia.
4. **Captura 1 (Inferencia sobre Desarrolladores):**
   - Ve a la pestaña **Entities -> Individuals by class** y selecciona `Dev_AnaSofia`.
   - En el panel `Description` verás resaltado en amarillo (inferido por el razonador):
     - `Types (inferred): DesarrolladorFullStack`
5. **Captura 2 (Inferencia sobre Proyectos y Relaciones Inversas):**
   - Selecciona el individuo `Proy_PlataformaTelemedicina`. Verás resaltado en amarillo:
     - `Types (inferred): ProyectoListoParaIniciar`
     - `Property assertions (inferred): tienePostulante Dev_AnaSofia` y `esLideradoPor Lider_IngAlejandro`
6. **Captura 3 (Inferencia Transitiva de Prerrequisitos y Tecnologías):**
   - Selecciona `Curso_ArquitecturaFullStack`. Verás en amarillo:
     - `tienePrerrequisito Curso_FundamentosPOO` (deducido por transitividad a través de `Curso_APIsREST_NodeJS`).
   - Selecciona `Tech_NextJS`. Verás en amarillo:
     - `dependeDeTecnologia Tech_JavaScript` (deducido por transitividad a través de `Tech_React`).

---

## 3. Explicación Técnica de las Inferencias Derivadas

1. **Inferencia 1 — Clasificación Automática de `DesarrolladorFullStack`:**
   - **Axioma (`owl:equivalentClass`):** `Desarrollador and (dominaHabilidad some TecnologiaFrontend) and (dominaHabilidad some TecnologiaBackend)`.
   - **Resultado:** `Dev_AnaSofia` fue registrada únicamente como `Desarrollador`. Al dominar `Tech_React` (`TecnologiaFrontend`) y `Tech_NodeJS` (`TecnologiaBackend`), el razonador la clasifica automáticamente como `DesarrolladorFullStack`. En cambio, `Dev_CarlosMario` (que solo domina `Tech_JavaScript` y `Tech_React`) permanece únicamente como `Desarrollador`.
2. **Inferencia 2 — Clasificación Automática de `ProyectoListoParaIniciar`:**
   - **Axioma (`owl:equivalentClass`):** `ProyectoSoftware and (tienePostulante some Desarrollador) and (convocatoriaAbierta value true)`.
   - **Resultado:** Dado que `Dev_AnaSofia postulaAProyecto Proy_PlataformaTelemedicina` (lo que infiere la inversa `tienePostulante`) y el proyecto tiene `convocatoriaAbierta = true`, el razonador lo clasifica dentro de `ProyectoListoParaIniciar`. Por el contrario, `Proy_PasarelaPagosFinTech` (`convocatoriaAbierta = false`) no clasifica.
3. **Inferencia 3 — Transitividad de Prerrequisitos Académicos (`tienePrerrequisito`):**
   - **Axioma:** `tienePrerrequisito rdf:type owl:TransitiveProperty`.
   - **Resultado:** Si el curso 3 (`Curso_ArquitecturaFullStack`) requiere el curso 2 (`Curso_APIsREST_NodeJS`), y el curso 2 requiere el curso 1 (`Curso_FundamentosPOO`), el razonador deduce automáticamente que el curso 3 tiene como prerrequisito al curso 1.
4. **Inferencia 4 — Propiedades Inversas (`esDominadaPor`, `esLideradoPor`, `tienePostulante`):**
   - **Axioma:** `dominaHabilidad owl:inverseOf esDominadaPor`.
   - **Resultado:** Al consultar la tecnología `Tech_React`, el razonador infiere automáticamente quiénes la dominan (`Dev_AnaSofia` y `Dev_CarlosMario`) sin haberlo escrito manualmente en el nodo de la tecnología.

---

## 4. Preguntas de Competencia y Consultas en Protégé (DL Query / SPARQL)

Activa la pestaña **DL Query** (`Window -> Tabs -> DL Query`), marca las casillas `Subclasses` e `Instances` y ejecuta:

### Pregunta de Competencia 1 (PC1)
*¿Qué desarrolladores cumplen simultáneamente con el dominio de tecnologías Frontend y Backend para desempeñarse como Desarrolladores FullStack?*
```text
DesarrolladorFullStack
```
**Respuesta esperada del razonador:** `Dev_AnaSofia`.

### Pregunta de Competencia 2 (PC2)
*¿Qué proyectos de software tienen su convocatoria abierta y cuentan ya con desarrolladores postulados listos para iniciar?*
```text
ProyectoListoParaIniciar
```
**Respuesta esperada del razonador:** `Proy_PlataformaTelemedicina`.

### Pregunta de Competencia 3 (PC3)
*¿Qué cursos formativos tienen directa o indirectamente como prerrequisito el curso de Fundamentos de Programación?*
```text
CursoFormativo and (tienePrerrequisito value Curso_FundamentosPOO)
```
**Respuesta esperada del razonador:** `Curso_APIsREST_NodeJS`, `Curso_ArquitecturaFullStack`.

### Pregunta de Competencia 4 (PC4)
*¿Qué tecnologías dependen directa o transitivamente del lenguaje JavaScript?*
```text
HabilidadTecnica and (dependeDeTecnologia value Tech_JavaScript)
```
**Respuesta esperada del razonador:** `Tech_React`, `Tech_NextJS`.

### Pregunta de Competencia 5 (PC5 - Consulta SPARQL)
*¿Cuáles son los proyectos de software registrados con su URL de repositorio Git y número de cupos disponibles?*
```sparql
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX dev: <http://www.ingweb2620.edu.co/ontologias/conectadev#>

SELECT ?proyecto ?repoUrl ?cupos ?abierto
WHERE {
  ?proyecto rdf:type dev:ProyectoSoftware .
  ?proyecto dev:repositorioGitUrl ?repoUrl .
  ?proyecto dev:cuposDisponibles ?cupos .
  ?proyecto dev:convocatoriaAbierta ?abierto .
}
ORDER BY DESC(?cupos)
```
