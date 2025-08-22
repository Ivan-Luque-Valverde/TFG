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
  #first-letter[
    El presente documento titulado "_Simulación de un sistema de Pick and Place con un robot Braccio Tinkerkit de Arduino bajo ROS 2_" es el trabajo presentado para superar el Trabajo de Fin de Grado del Grado de Ingeniería Electrónica, Robótica y Mecatrónica.
  ]
  
  El consiguiente aborda la simulación y validación de un sistema de recolección, clasificación y colocación de elementos, basado en el kit educativo Braccio Tinkerkit, controlado por una placa Arduino UNO y coordinado desde ROS 2 Humble. 
  \
  La relevancia recae en el uso de los robots manipuladores en tareas de automatización y docencia, justificando el uso de plataformas de bajo coste para experimentar técnicas de percepción, planificación y control previas a la transferencia al robot físico. 
  Este incremento de la robótica en la educación ha demostrado un aumento en el interés de los estudiantes por la ingeniería y la tecnología, así como una mejora en su comprensión de conceptos complejos, la resolución de problemas, el trabajo en equipo y la creatividad @emb. 
  
  == Motivación del proyecto 
Este proyecto nace como una combinación de motivos personales, formativos y profesionales.
\
\
Desde un punto de vista personal, siempre he tenido un gran interés por la robótica y la automatización, fascinado por cómo las máquinas pueden interactuar con el mundo físico y realizar tareas complejas. Desde bien pequeño recuerdo el entusiasmo al desenvolver un regalo y descubrir un kit de construcción como el mostrado en la @fig-meccano, otorgándome horas innumerables de diversión y aprendizaje mientras ensamblaba y la enorme satisfacción al comprobar que, tras todo ese esfuerzo, había construido un robot que funcionaba. Finalmente, esos pequeños kits de construcciones, laboratorios o electrónica, fueron construyendo mi pasión por la robótica y la tecnología.
\
\
Desde un punto de vista formativo, este proyecto representa una oportunidad para aplicar y consolidar los conocimientos adquiridos a lo largo de la carrera, especialmente en áreas como la programación, la robótica y la percepción. Trabajar durante la asignatura _Laboratorio de Robótica_ con un robot ABB IRB 120 despertó mi entusiasmo por este tipo de robots manipuladores, enlazado con los conocimientos adquiridos durante las asignaturas _Sistemas de Percepción_ y _Ampliación de Robótica_ constituyeron la oportunidad ideal para unificar estos conocimientos bajo el mismo proyecto. 

#figure(image("template/figures/mecano.jpg", width: 50%), caption: [Juguete para niños, kit de construcción de un vehículo todo-terreno Meccano]) <fig-meccano>

Finalmente, desde un punto de vista profesional, la experiencia adquirida en este proyecto será un valioso activo en mi futura carrera. La entrada en un ecosistema como ROS 2, apenas explorado durante la carrera, representa una oportunidad para adquirir habilidades demandadas en el mercado laboral tales como la búsqueda e implementación de repositorios o el manejo de un sistema de nodos y publicaciones. La robótica es un campo en constante evolución y crecimiento, y contar con experiencia práctica en el desarrollo de sistemas robóticos me posicionará favorablemente en el mercado laboral.

  == Objetivos del Trabajo

Este trabajo tiene como objetivo principal el diseño y desarrollo de un sistema de simulación para un robot manipulador, utilizando el kit Braccio Tinkerkit y ROS 2. Se busca crear un entorno virtual que permita la experimentación y validación de algoritmos de control y percepción, facilitando la transferencia de estos al robot físico.
\
\
De forma complementaria, se pretende establecer un flujo de trabajo que integre la simulación con el robot físico, permitiendo la validación de los algoritmos en un entorno real. Esto incluye la creación de un repositorio completamente modular donde la adición de nuevos elementos se realice de forma sencilla e intuitiva, asegurando la escalabilidad y flexibilidad de ambos sistemas. 
Para ello, en primer lugar, se ha seleccionado un repositorio existente en GitHub como base inicial y funcional para el desarrollo del sistema @repo. A continuación, se ha modelado hacia el objetivo deseado, adaptando y ampliando las funcionalidades del repositorio original con nuevas características referenciadas en otros repositorios. Finalmente, se ha implementado y probado el sistema tanto en simulación como en el robot físico, evaluando su rendimiento y realizando ajustes según sea necesario.
= Estado del arte

  == Introducción
  Breve contexto sobre la importancia de las tareas pick‑and‑place en robótica, tanto en entornos industriales como educativos. Se define el alcance: simulación y validación de un Braccio Tinkerkit controlado desde Arduino y ROS 2, con foco en percepción, planificación y transferencia sim‑to‑real.

  == Robótica manipuladora y aplicaciones pick and place
  Tipos de manipuladores (seriales, paralelos), grados de libertad habituales y requisitos clave: precisión, repetibilidad, carga útil y velocidad. Revisión de aplicaciones: automatización industrial, logística ligera, ensamblaje y uso en docencia e investigación.

  == Braccio Tinkerkit, solución educativa
  Descripción técnica breve (arquitectura, servos, rango de movimiento, limitaciones de carga/peso). Ventajas como plataforma educativa y limitaciones prácticas para tareas industriales; ejemplos y trabajos previos que usan Braccio o robots similares.

= Plataformas de desarrollo y simulación
  El manipulador Braccio Tinkerkit forma parte del ecosistema Arduino, tal como se ha mencionado previamente. Debido a esta característica, puede ser simulado y controlado a través de diversas plataformas y herramientas; siendo Matlab y ROS las más destacadas en el ámbito académico y de investigación.

  == Matlab
  Matlab/Simulink es un entorno de computación numérica y programación que ofrece un ecosistema integrado para el diseño, la simulación y la implementación de sistemas, incluyendo aplicaciones de robótica. A través de toolboxes específicos como _Robotics System Toolbox_ y _Simscape_ proporciona un entorno gráfico y basado en scripts para modelar y simular robots @simscape.

  == ROS
  ROS (Robot Operating System) es un framework de código abierto caracterizado por ser el estándar para la investigación y el desarrollo en robótica. Facilita la comunicación y la gestión de procesos en un robot a través de un modelo de "nodos" que se comunican de forma centralizada @melodic.

  == ROS 2
  ROS2 (Robot Operating System 2) es la nueva generación de ROS, diseñada para abordar las limitaciones de la primera versión y adaptarse a las necesidades actuales de la robótica. Está pensada para aplicaciones industriales, sistemas multi-robot y sistemas en tiempo real, mediante una arquitectura de comunicación descentralizada @repo.


== Comparativa 

  #figure(table(
    columns: (auto, auto, auto, auto),
    inset: 6pt,
    align: horizon,
    [Característica], [MATLAB], [ROS], [ROS2],

    [Curva de Aprendizaje], [Baja. Entorno gráfico muy intuitivo, visual y didáctico.], [Media. Requiere aprender conceptos (nodos, tópicos, servicios), la compilación catkin y el uso de la terminal.], [Alta. Similar a ROS1 pero con herramientas y conceptos más modernos.],

    [Coste], [Comercial: Requiere licencias para Matlab, Simulink y algunos toolboxes.], [Gratuito y Código Abierto.], [Gratuito y Código Abierto.],

    [Arquitectura de Comunicación], [Monolítica e integrada, simple y directa.], [Centralizada: Depende de un nodo maestro (roscore), que actúa como servidor de nombres.], [Descentralizada: Usa el protocolo DDS (Data Distribution Service); sin nodo maestro y mayor robustez y flexibilidad.],

    [Simulación], [Simscape Multibody para simulación dinámica y 3D. Buena pero no tan realista.], [Gazebo para física realista.], [Gazebo/Ignition y otros simuladores modernos.],

    [Planificación de Movimiento], [Robotics System Toolbox.], [MoveIt: estándar maduro y con gran comunidad.], [MoveIt2: versión para ROS2 en desarrollo activo.],

    [Soporte para Braccio], [Requiere importar URDF y configurar comunicación con Arduino. Escasos proyectos disponibles.], [Excelente: variedad de paquetes y tutoriales disponibles.], [Correcto: menor variedad de paquetes, con posibilidad de portar código de ROS1.],

    [Comunidad], [Fuerte soporte oficial (MathWorks) y comunidad académica.], [Inmenso pero en declive: muchos paquetes obsoletos; sin nuevas versiones principales.], [En crecimiento y activo: foco de la nueva investigación y desarrollo.],
  ), caption: "Tabla comparativa entre MATLAB, ROS y ROS2 como opciones para la simulación y control del manipulador.")


// seguir por aqui, hablar mas a fondo de moveit2 y ros2, asi como una conclusion final de lo mejor (mirar google ai studio).



  Simulación física, planificación y visualización — herramientas clave
  - MoveIt2: framework de planificación de agarres y trayectorias compatible con ROS 2 y `ros2_control`; central para generar movimientos pick‑and‑place reproducibles.
  - Gazebo / Ignition: simulador físico completo con tratamiento de contactos, sensores y plugins; apropiado cuando la fidelidad física (fricción, choques) es importante para la transferencia sim‑to‑real.
  - RViz: herramienta de visualización y depuración (TF, tópicos, planes). No realiza simulación física pero es imprescindible para interpretar el comportamiento del sistema en ROS.
  - PyBullet / Bullet: simulador ligero y rápido, útil para prototipado y algoritmos de aprendizaje; menos integrado con el ecosistema ROS pero muy eficiente en iteraciones rápidas.
  - Webots / CoppeliaSim: entornos todo‑en‑uno con ejemplos educativos y buenas capacidades de scripting; convenientes si se busca rapidez de arranque y facilidad de uso.

  Criterios de elección
  La selección entre estas opciones debe basarse en: fidelidad física requerida (contactos, fricción), integración con ROS 2/MoveIt2, velocidad de iteración, disponibilidad de modelos y sensores, y recursos (licencias, tiempo). Para pruebas orientadas a sim‑to‑real la combinación MoveIt2 + Gazebo/Ignition proporciona un buen balance entre integración y fidelidad; para experimentos rápidos o aprendizaje por refuerzo, PyBullet es una alternativa eficaz.

  Recomendación práctica para este TFG
  Se sugiere adoptar un flujo centrado en ROS 2: usar MoveIt2 para planificación de agarres y trayectorias, Gazebo/Ignition para pruebas físicas detalladas y RViz para depuración y visualización. Emplear PyBullet solo como complemento para prototipado rápido o pruebas de algoritmos. Para la conexión con Arduino, `rosserial` es adecuado en prototipos iniciales; si se requiere mayor integración con ROS 2 o restricciones embebidas, valorar `micro-ROS`. Cuando sea necesario realizar identificación de parámetros o diseño de control avanzado, MATLAB/Simulink puede emplearse de forma complementaria.

  Esta combinación ofrece un equilibrio entre reproducibilidad, fidelidad y velocidad de desarrollo, y facilita la transferencia de algoritmos desde la simulación al robot físico Braccio Tinkerkit.

    





  = Diseño del sistema
     == Repositorio ROS2 referencia
  Estructura del repositorio, principales nodos y paquetes, y su relación con el hardware y la simulación. Ejemplos de uso y pruebas.

    == Modelado del robot: URDF/SDF y recursos
  Cómo describir un manipulador en URDF/SDF: articulaciones, eslabones, masas/inercia y meshes. Buenas prácticas: simplificar colisiones, documentar parámetros dinámicos y mantener congruencia entre modelo visual y de colisión.

    == Simulación física y fidelidad
  Motores físicos comunes (ODE, Bullet, DART, Chrono) y su tratamiento de contactos, fricción y servos. Impacto de la fidelidad en planificación y en la transferencia sim‑to‑real; necesidad de identificación de parámetros dinámicos para validar la simulación.

  == Spawner de objetos



= Percepción y localización de objetivos
  Sensores habituales: cámaras RGB, RGB‑D y marcadores fiduciales. Técnicas: detección y segmentación de objetos (OpenCV, redes CNN), estimación de pose 6‑DoF, uso de PCL para nubes de puntos. Conjuntos de datos y benchmarks (YCB, etc.).
  == Detección de objetos

  == Matriz de transformación y calibración

  == Matriz de homografía

= Planificación de agarre y manipulación
  Algoritmos y herramientas: OMPL, MoveIt2 para planificación de trayectorias; GraspIt!, Dex‑Net y enfoques basados en aprendizaje para planificación de agarres. Métricas de calidad del agarre y problemas prácticos (contactos, incertidumbre en fricción).
  == Cinemática directa e inversa
  == Repositorio atach/detach

= Control mediante PS4 controller
= Integración hardware–software y control
  Conexión Arduino ↔ ROS 2: rosserial, micro‑ROS, drivers custom; uso de ros2_control y controladores en tiempo real. Retos: latencias, interpolación de servos hobby, límites de torque y seguridad en lazo cerrado.

  == Transferencia sim‑to‑real y validación experimental
  Técnicas para reducir la brecha: domain randomization, calibración de cámara y brazo, system identification y HIL. Diseño experimental para comparar simulación y prototipo real, incluyendo métricas y repetibilidad.

= Montaje del robot físico


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
  #bibliography("referencias.bib")
  //#pagebreak(to: "odd")
  // Recordar usar la función bibliography para la bibliografía.
  // Para mantener la lista de referencias se puede usar software como Mendeley.
  // #bibliography("referencias.bib")
]


