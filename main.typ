#import "template/lib.typ": tfg_etsi_us_template, pre-content, main-content, post-content, index,first-letter

#set text(font: ("Times New Roman", "Tinos"))

#show: tfg_etsi_us_template.with(
  // El título del TFG
  "Simulación de un sistema de Pick and Place con un robot Braccio Tinkerkit de Arduino bajo ROS 2",
  // El grado de la titulación, e.g. Ingeniería Industrial
  "Ingeniería Electrónica, Robótica y Mecatrónica",
  // Nombre y apellidos del autor
  "Iván Luque Valverde",
  // Nombre y apellidos del tutor (o tutores)
  "Federico Cuesta Rojo",
  // Título del tutor, p.ej. Profesor Asociado
  "Profesor Titular",
  // Nombre del departamento asociado
  "Dpto. Ingeniería de Sistemas y Automática",
  // Año del TFG (Por defecto el año de compilación del archivo)
  // year: 2024
  // Activar el modo de desarrollo o no, por ahora sólo muestra la fecha del documento en la esquina superior derecha de la cubierta.
  dev-mode: true
  )


#pre-content[
  // El contenido de aquí usa numeración romana de páginas y los títulos
  // definidos no están numerados. Usado para índice, agradecimientos,
  // introducción, abstracto/resumen, ...
  = Agradecimientos
  #lorem(100)
  #pagebreak(to: "odd")

  = Resumen
  #lorem(100)
  #pagebreak(to: "odd")


  = Abstract
  #lorem(100)
  #pagebreak(to: "odd")

  // Ejemplo de uso de Índices personalizados
  #index(title:[Índice reducido hasta nivel 2],target:(heading.where(level: 1).or(heading.where(level: 2))))
  #pagebreak(to: "odd")

  #index(title:[Índice reducido hasta nivel 3],target:(heading.where(level: 1).or(heading.where(level: 2)).or(heading.where(level: 3))))
  #pagebreak(to: "odd")

  #index(title:[Índice sin reducir],target:(heading))
  #pagebreak(to: "odd")
]
#main-content[
  // Las páginas de aquí junto a los títulos definidos usan numeración arábiga
  // comenzando desde 1. Usado para el contenido principal del TFG
  = Introducción
  // Ejemplo de uso de la función first-letter
  #first-letter([#lorem(50)])
  #pagebreak(to: "odd")

  == Motivación del proyecto
  #lorem(50)
  #pagebreak(to: "odd")

  == Objetivos del Trabajo
  #lorem(50)
  // Simulación, puesta a punto, repositorio a funcionar...
  
  #figure(table(
  columns: (auto, auto, auto),
  inset: 10pt,
  align: horizon,
  [A], [A], [A],
  [B], [B], [B],
  ),caption:  "Tabla de prueba")
  == Enfoque y metodología


  = Estado del arte

  == Introducción
  Breve contexto sobre la importancia de las tareas pick‑and‑place en robótica, tanto en entornos industriales como educativos. Se define el alcance: simulación y validación de un Braccio Tinkerkit controlado desde Arduino y ROS 2, con foco en percepción, planificación y transferencia sim‑to‑real.

  == Robótica manipuladora y aplicaciones pick and place
  Tipos de manipuladores (seriales, paralelos), grados de libertad habituales y requisitos clave: precisión, repetibilidad, carga útil y velocidad. Revisión de aplicaciones: automatización industrial, logística ligera, ensamblaje y uso en docencia e investigación.

  == Braccio Tinkerkit, solución educativa
  Descripción técnica breve (arquitectura, servos, rango de movimiento, limitaciones de carga/peso). Ventajas como plataforma educativa y limitaciones prácticas para tareas industriales; ejemplos y trabajos previos que usan Braccio o robots similares.

  = Plataformas de desarrollo y simulación
    Comparativa de herramientas relevantes: ROS 2 (comunicación DDS, ecosistema), MoveIt2 (planificación), Gazebo / Ignition, Webots, PyBullet (simulación física), MATLAB/Simulink (modelado). Ventajas y limitaciones de cada una para proyectos de bajo coste.
  = Diseño del sistema
    == Modelado del robot: URDF/SDF y recursos
  Cómo describir un manipulador en URDF/SDF: articulaciones, eslabones, masas/inercia y meshes. Buenas prácticas: simplificar colisiones, documentar parámetros dinámicos y mantener congruencia entre modelo visual y de colisión.

    == Simulación física y fidelidad
  Motores físicos comunes (ODE, Bullet, DART, Chrono) y su tratamiento de contactos, fricción y servos. Impacto de la fidelidad en planificación y en la transferencia sim‑to‑real; necesidad de identificación de parámetros dinámicos para validar la simulación.

   == Repositorio ROS2 referencia
  Estructura del repositorio, principales nodos y paquetes, y su relación con el hardware y la simulación. Ejemplos de uso y pruebas.

= Percepción y localización de objetivos
  Sensores habituales: cámaras RGB, RGB‑D y marcadores fiduciales. Técnicas: detección y segmentación de objetos (OpenCV, redes CNN), estimación de pose 6‑DoF, uso de PCL para nubes de puntos. Conjuntos de datos y benchmarks (YCB, etc.).
  == Detección de objetos

  == Matriz de transformación y calibración

  == Matriz de homografía

= Planificación de agarre y manipulación
  Algoritmos y herramientas: OMPL, MoveIt2 para planificación de trayectorias; GraspIt!, Dex‑Net y enfoques basados en aprendizaje para planificación de agarres. Métricas de calidad del agarre y problemas prácticos (contactos, incertidumbre en fricción).
  == Cinemática directa e inversa

= Integración hardware–software y control
  Conexión Arduino ↔ ROS 2: rosserial, micro‑ROS, drivers custom; uso de ros2_control y controladores en tiempo real. Retos: latencias, interpolación de servos hobby, límites de torque y seguridad en lazo cerrado.

  == Transferencia sim‑to‑real y validación experimental
  Técnicas para reducir la brecha: domain randomization, calibración de cámara y brazo, system identification y HIL. Diseño experimental para comparar simulación y prototipo real, incluyendo métricas y repetibilidad.

= Evaluación y métricas
  Métricas recomendadas: tasa de éxito del pick‑and‑place, error de posicionamiento, tiempo por ciclo, repetibilidad y robustez ante variaciones de objeto/escenario. Protocolo de pruebas y análisis estadístico básico.
= Huecos detectados y oportunidades para el TFG
  Resumen de cuestiones poco cubiertas en la literatura: modelos dinámicos de alta fidelidad para robots educativos, pipelines integrados Arduino+micro‑ROS+MoveIt2, datasets para piezas educativas; propuestas: modelado URDF/SDF del Braccio, pipeline RGB‑D para pose, integración y validación sim‑to‑real.

  // Referencias sugeridas para Bibliografía:
  // - Documentación: ROS 2, MoveIt2, Gazebo/Ignition, PyBullet
  // - Herramientas/Artículos: Dex‑Net, GraspIt!, surveys sobre sim‑to‑real, papers sobre ros2_control y micro‑ROS















  
  #lorem(50)
  #figure(image("template/figures/Logo.svg",width: 16%),caption:"Imagen de prueba")

  #pagebreak(to: "odd")
]
#post-content[
  // El contenido de aquí continúa con la numeración de páginas anterior, pero

  // Ejemplo de uso de Índice personalizados para figuras y tablas
  #index(title:[Índice de Figuras],target:(figure.where(kind:image)))
  #pagebreak(to: "odd")

  #index(title:[Índice de Tablas],target:(figure.where(kind:table)))
  #pagebreak(to: "odd")

  // los títulos definidos no están numerados. Usado para glosario,
  // bibliografía, índice de figuras...
  = Bibliografía
  #lorem(100)
  #pagebreak(to: "odd")
  // Recordar usar la función bibliography para la bibliografía.
  // Para mantener la lista de referencias se puede usar software como Mendeley.
  // #bibliography("referencias.bib")
]


