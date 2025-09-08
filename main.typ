#import "template/lib.typ": tfg_etsi_us_template, pre-content, main-content, post-content, index,first-letter
#let col2 = grid.with(columns: (0.5fr, 0.5fr), gutter: 5pt)
#let col2_1 = grid.with(columns: (0.35fr, 0.7fr), gutter: 5pt)
#let col3 = grid.with(columns: (0.5fr, 0.5fr, 0.5fr), gutter: 2pt)
#set text(font: ("Times New Roman"))

#show: tfg_etsi_us_template.with(
  // El título del TFG
  "Sistema Pick and Place para el robot Braccio Tinkerkit de Arduino bajo ROS 2",
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
  En primer lugar, quiero expresar mi más sincero agradecimiento a mi familia, mis padres y hermano que no han dudado nunca de mí y me han apoyado incondicionalmente en cada paso de mi vida académica y personal. Sin ese empujón para luchar por aquello que deseaba desde pequeño, no estaría aquí hoy.
\ \
#linebreak()
  A continuación, me gustaría agradecer a mi tutor, Federico Cuesta Rojo, por abrirme las puertas a embarcarme en este proyecto increíble que enlaza la robótica manipuladora con la percepción y control. Gracias por su orientación, experiencia y apoyo a lo largo de este proyecto. 
\ \
 #linebreak()
  Una ingeniería es un camino largo y muy complicado. Cómo no agradecer a todos aquellos compañeros, amigos, que me llevo de este viaje y que han hecho de la universidad un hogar, un lugar mucho más ameno donde las risas y los buenos momentos han sido la tónica dominante incluso en las largas sesiones de estudio. Sin duda, me llevo un pedacito de cada uno de vosotros.
\ \
  #linebreak()
  Finalmente, agradecer a todas aquellas personas que, de una forma u otra, han aportado su granito de arena para que este proyecto haya sido posible. Desde aquellos maestros que me enseñaron las bases de la tecnología, matemáticas y física en el instituto, hasta la propia universidad de Sevilla por darme la oportunidad de formarme y crecer como persona y ahora, como ingeniero.
  
\ \ \
  
  #align(right, text([_Iván Luque Valverde_]))
\
  #align(right, text([_Sevilla, 2025_]))

  #pagebreak(to: "odd")

  = Resumen
  
  Este Trabajo de Fin de Grado diseña, simula y valida un sistema de pick‑and‑place de bajo coste con el manipulador educativo Braccio Tinkerkit, controlado por Arduino y coordinado en ROS 2 Humble. Se parte de un repositorio modular al que se incorporan paquetes propios para la teleoperación con gamepad, percepción y calibración y transferencia al entorno real. En simulación, el entorno integra Gazebo, MoveIt2 y RViz2, con una cámara cenital y objetos cúbicos. La percepción aplica segmentación por color, extracción de centroides y una calibración por homografía para convertir píxeles a coordenadas del mundo. La planificación se basa en una cinemática inversa específica del Braccio (con manejo de simetrías y alturas) y en la ejecución de trayectorias con ros2_control; el agarre se simula mediante el plugin gazebo_link_attacher.


  \ La fase sim‑to‑real replica el escenario con una cámara de un teléfono móvil, enlazada al ordenador mediante DroidCam; y marcadores adicionales, reajustando umbrales de visión. Los resultados muestran una ejecución impecable en simulación y un desempeño aceptable en el robot real, limitado por la rigidez del hardware, la apertura de la pinza y la sensibilidad a la iluminación, entre otros factores. El proyecto entrega un repositorio abierto, documentado y extensible para docencia e investigación, con utilidades de prueba y configuración reproducible, dedicado a la comunidad de ROS 2 y robótica educativa.




  
  #pagebreak(to: "odd")


  = Abstract
  
  This Final Degree Project designs, simulates, and validates a low‑cost pick‑and‑place system using the educational Braccio Tinkerkit manipulator, controlled by Arduino and coordinated in ROS 2 Humble. It builds on a modular repository augmented with custom packages for gamepad teleoperation, perception and calibration, and transfer to the real setup. In simulation, the stack integrates Gazebo, MoveIt2, and RViz2, with an overhead camera and cubic objects. The perception pipeline applies color segmentation, centroid extraction, and a homography based calibration to convert pixel data into world coordinates. Motion planning is based on a custom inverse kinematics solution for the Braccio arm (handling symmetries and height adjustments) and trajectory execution via ros2_control; grasping is simulated with the gazebo_link_attacher plugin.

  \ The sim-to-real phase replicates the setup using a mobile phone camera linked to the computer via DroidCam, requiring additional markers and recalibration of vision thresholds. Results show flawless execution in simulation and acceptable performance on the real robot, limited by hardware rigidity, gripper aperture, and lighting sensitivity, among other factors. The project provides an open, documented, and extensible repository for education and research, with test utilities and reproducible configuration, dedicated to the ROS 2 and educational robotics community.

  #pagebreak(to: "odd")

  /* Ejemplo de uso de Índices personalizados
  #index(title:[Índice reducido hasta nivel 2],target:(heading.where(level: 1).or(heading.where(level: 2))))
  #pagebreak(to: "odd")

  #index(title:[Índice reducido hasta nivel 3],target:(heading.where(level: 1).or(heading.where(level: 2)).or(heading.where(level: 3))))
  #pagebreak(to: "odd")
*/

  #index(title:[Índice],target:(heading))
  #pagebreak(to: "odd")
]
#main-content[
  // Las páginas de aquí junto a los títulos definidos usan numeración arábiga
  // comenzando desde 1. Usado para el contenido principal del TFG
  = Introducción
  #first-letter[
    El presente documento titulado "_Sistema Pick and Place para el robot Braccio Tinkerkit de Arduino bajo ROS 2_" es el trabajo presentado para superar el Trabajo de Fin de Grado del Grado de Ingeniería Electrónica, Robótica y Mecatrónica.
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

  == Introducción a la robótica
  
  La robótica se define como la técnica que aplica la informática al diseño y empleo de aparatos que, en sustitución de personas, realizan operaciones o trabajos, por lo general en instalaciones industriales (RAE).

  #linebreak()
  El término “robot” fue acuñado por el escritor checo Karel Čapek en su obra de teatro “Rossum’s Universal Robots” en 1921 en el Teatro Nacional de Praga, en la cual se creaban humanos sintéticos para aligerar la carga de trabajo de los humanos.
  Cabe destacar que este término fue realmente ideado por el hermano del autor, el cual se basó en la palabra checa _robota_, que significa trabajo, en general, de la servidumbre @checa.


  #linebreak()
  De forma similar al descrito en la obra teatral, en un principio, los robots fueron concebidos como herramientas para sustituir a los humanos en tareas específicas debido a peligrosidad, precisión o repetitividad. Este hecho, unido con el auge de otros campos como la electrónica y la informática, ha permitido el desarrollo de robots cada vez más sofisticados y capaces de realizar tareas complejas, siendo éstos prácticamentente indispensables en la automatización industrial moderna.

  #linebreak()
#figure(image("template/figures/Capek.jpg", width: 70%), caption: [Representación original de la obra teatral de Karel Čapek, donde se observan un hombre junto a una mujer y tres robots.]) 


  == Tipos de robots
  Los robots son máquinas programables capaces de realizar tareas de forma autónoma o semiautónoma. Según la norma ISO (International Organization for Standardization) 8373 @iso, se clasifican en tres grandes grupos en función de su uso. Los robots industriales son robots necesarios en tareas de automatización industrial, los de servicio realizan tareas útiles para las personas o los equipos; y los médicos están destinados a ser utilizados como equipo electromédico o sistema electromédico.

  === Robots industriales
La ISO define un robot industrial como un manipulador multipropósito reprogramable, controlado automáticamente, programable en tres o más ejes, que puede estar fijo en un lugar o fijado a una plataforma móvil para su uso en aplicaciones de automatización en un entorno industrial. 

\ En base a ello, la IFR (International Federation of Robotics) clasifica estos según su estructura mecánica.

#linebreak()

#figure(
  table(
    columns: (auto, 2fr, 1fr),
    inset: 6pt,
    align: horizon,
    [*Nombre*], [*Estructura mecánica*], [*Imagen*],

    [Robot cartesiano], [Manipulador que tiene tres articulaciones prismáticas, cuyos ejes forman un sistema de coordenadas cartesianas.], [#align(image("template/figures/cartesiano.png", width: 80%), center)],
    [Robot SCARA], [Manipulador que tiene dos articulaciones rotatorias paralelas para proporcionar flexibilidad en un plano seleccionado.], [#align(image("template/figures/Scara.png", width: 80%), center)],
    [Robot articulado], [Manipulador con tres o más articulaciones rotatorias.], [#align(image("template/figures/articular.png", width: 80%), center)],
    [Robot paralelo / Delta], [Manipulador cuyos brazos tienen enlaces que forman una estructura de bucle cerrado.], [#align(image("template/figures/paralelo.png", width: 80%), center)],
    [Robot cilíndrico], [Manipulador con al menos una articulación rotatoria y una prismática, cuyos ejes forman un sistema de coordenadas cilíndrico.], [#align(image("template/figures/cilindrico.png", width: 80%), center)],
    [Robot polar / esférico], [Manipulador con dos articulaciones rotatorias y una articulación prismática, cuyos ejes forman un sistema de coordenadas polares.], [#align(image("template/figures/Polar.png", width: 80%), center)],
  ),
  caption: [Clasificación de los robots industriales en función de su estructura mecánica @ifr_industrial.]
)
#pagebreak()
=== Robots de servicios
La IFR define un robot de servicio como un mecanismo accionado programable en dos o más ejes, que se mueve dentro de su entorno, para realizar tareas útiles para humanos o equipos, excluyendo aplicaciones de automatización industrial. Según su definición en la norma ISO, requieren de cierto grado de autonomía, yendo desde una autonomía parcial hasta una total autonomía, es decir, con cierto grado de interacción con un operador @ifr_service.

#linebreak()
Esta institución distingue dos categorías de robots de servicio:
\
\
- Robots de servicio para el consumidor: destinados a ser utilizados por particulares en entornos domésticos. No requieren de formación específica para su uso. Algunos ejemplos son los robots de limpieza domésticos, las sillas de ruedas automatizadas o los robots de interacción social.

- Robots de servicio profesional: diseñados para realizar tareas específicas en entornos industriales o comerciales. Requieren de un operador con formación profesional. Algunos ejemplos son los robots de limpieza para espacios públicos, los robots de reparto o los robots de extinción de incendios. En la @fig-service se puede observar un mayor catálogo del uso de éstos.

#linebreak()
#figure(image("template/figures/service.png", width: 80%), caption: [Representación gráfica del número de productores de robots de servicio por grupo de aplicación y origen en 2024 @ifr_conference .])<fig-service>

=== Robots médicos
Los robots médicos constituyen ahora una tercera área de aplicación, catagorizándose anteriormente como una categoría especializada de robots de servicio. Sin embargo, tal como se documenta en este reportaje constituido por varias organizaciones sanitarias de Polonia @medical, su definición aún se muestra un poco confusa si se considera la ofertada por la ISO.

#linebreak()
Pese a eso, basándose en la definición oficial, los robots médicos están diseñados para asistir en la atención médica y quirúrgica, pudiendo realizar tareas como la cirugía asistida, la rehabilitación de pacientes y la entrega de suministros médicos. Su uso en entornos clínicos requiere un alto grado de precisión y fiabilidad, así como la capacidad de interactuar de manera segura con pacientes y profesionales de la salud.

  == Estudio de mercado
En la actualidad, la presencia de robots industriales en el mercado está en constante crecimiento, impulsada por la demanda de automatización en diversos sectores. Según la @fig-upgrade, más de 4 millones de robots industriales se encuentran operando en todo el mundo. Este crecimiento se debe a la adopción de tecnologías avanzadas, como la inteligencia artificial y la robótica colaborativa, que permiten a las empresas mejorar su eficiencia y competitividad.

#linebreak()
#figure(image("template/figures/upgrade_rob.png", width: 80%), caption: [Representación gráfica del crecimiento en la cantidad de robots industriales operando en el mercado durante los últimos 10 años según World Robotics en 2024 @ifr_conference.])<fig-upgrade>

#linebreak()
Este incremento en la aplicación robótica se traduce en una oportunidad de mercado para aprender y desarrollar nuevas soluciones en el ámbito de la automatización y la robótica. En concreto, la versatilidad y funcionalidad que ofrecen los robots articulares, comúnmente llamados `brazos robóticos` ha impulsado a miles de estudiantes y profesionales del sector a contribuir en el desarrollo. Gracias a ello, se ha dado lugar a la creación de nuevas plataformas donde los usuarios pueden colaborar y compartir sus experiencias, enriqueciendo aún más el aprendizaje y la innovación en este campo.

#linebreak()
#figure(col3(align(image("template/figures/a1.png", width: 98%,), right), align(image("template/figures/a2.png", width: 78%), center), align(image("template/figures/a3.png", width: 101%), center)), caption: [Proyectos compartidos por la comunidad de Autodesk Instructables, donde se explica mediante tutoriales y documentación cómo construir brazos robóticos @instructables.])

#linebreak()
#figure(col3(align(image("template/figures/b1.png", width: 98%,), center), align(image("template/figures/b3.png", width: 78%),center), align(image("template/figures/b2.png", width: 101%), center)), caption: [Proyectos compartidos por la comunidad de Arduino Project Hub, donde se explica mediante tutoriales y documentación la construcción y control de brazos robóticos mediante Arduino @project_hub.])

#linebreak()
Con la proliferación de estas plataformas y la creciente demanda de soluciones robóticas, se ha generado un ecosistema vibrante y colaborativo que impulsa la innovación y el desarrollo en el campo de la robótica. Estas alternativas manuales también han servido como base para el desarrollo de kits educativos y plataformas de bajo coste, que permiten a estudiantes y entusiastas aprender sobre robótica y automatización de manera accesible y práctica, como el Braccio Tinkerkit de Arduino.

#pagebreak()
  == Braccio Tinkerkit
  El Braccio Tinkerkit es un manipulador educativo de sobremesa diseñado para aprendizaje, prototipado y experimentación con control de robots manipuladores a bajo coste. Este kit de montaje ofrece una introducción versátil a la robótica, la mecánica y la electrónica, permitiendo a los usuarios ensamblar y programar el brazo para una variedad de tareas, como la manipulación de objetos, programación de trayectorias o control de articulaciones.

  #linebreak()
  Destaca por su flexibilidad y enfoque educativo, constando de las siguientes características:
  - Control por Arduino: Se integra perfectamente con el ecosistema de Arduino, lo que facilita su programación y control. Pese a que esta placa no se encuentre incluida en el kit, existen ofertas donde se incluye la placa junto con el kit a un precio competitivo.
  - Múltiples Ejes de Movimiento: El brazo robótico cuenta con seis ejes controlados por servomotores, lo que le confiere una gran amplitud de movimiento y precisión. 
  - Diseño Versátil: Puede ser ensamblado de diversas maneras para realizar distintas funciones. Además de la pinza incluida, se le pueden acoplar otros elementos como una cámara, un teléfono o incluso un panel solar para seguir el movimiento del sol.
  - Kit de Montaje completo: el kit incluye la estructura mecánica del brazo, un conjunto de servomotores de tipo hobby que actúan como actuadores para cada articulación, una pinza/gripper simple, la electrónica de control basada en una placa Arduino y el cableado y tornillería necesarios para su montaje.

 #linebreak()
#figure(image("template/figures/Montajes.png", width: 90%), caption: [Montajes posibles del Braccio Tinkerkit, incluyendo algunos sustitutos de la pinza.])

#linebreak()
A continuación, se presentan las especificaciones técnicas del Braccio Tinkerkit:
#linebreak()
\
  #figure(
    table(
      columns: (auto, 0.5fr),
      inset: 5pt,
      align: horizon + center,
      stroke: (x: none, y: 0.75pt),

      [Peso], [792 g],
      [Rango máximo de distancia de operación], [80 cm],
      [Altura máxima], [52 cm],
      [Anchura de la base], [14 cm],
      [Anchura de la pinza], [9 cm],
      [Longitud del cable], [40 cm],
      [Peso máximo a una distancia de funcionamiento de 32 cm], [150 g],
      [Peso máximo en la configuración mínima del Braccio], [400 g],
    ),
    caption: [Especificaciones técnicas principales del Braccio Tinkerkit, obtenidas directamente de la web oficial de compra de arduino @braccio.]
  )

#linebreak()
#col2(align(text[
La estructura del robot se compone por: 
- Una base circular que se mueve sobre un eje vertical, permitiendo la rotación completa del robot.
- Una articulación "hombro" que une la base con la pieza siguiente "brazo".
- Una articulación "codo", la cual enlaza dos piezas semiidénticas: "brazo" y "antebrazo".
- Una articulación "muñeca vertical", que une "antebrazo" con una pequeña pieza que contiene la estructura de la pinza.
- Una articulación "muñeca rotatoria", donde se acopla la pinza permitiendo una rotación sobre un eje en dirección de la garra.
- La pinza o "gripper" encargada de la sujeción de objetos, cuyos valores toman 10 grados cuando está completamente abierta y de 73 grados cuando se encuentra cerrada.
], left),
 figure(image("template/figures/braccio.png", width: 100%), caption: [Estructura del Braccio Tinkerkit.]))

 #linebreak()
 El movimiento de cada articulación es controlado por un servomotor de tipo hobby, los cuales son controlados mediante señales PWM (Pulse Width Modulation) generadas por la placa Arduino. 
 \ Los servomotores se encuentran catalogados por número ascendente desde la base hasta la pinza, siendo el SR 431 el encargado de mover las primeras cuatro articulaciones y el SR 311 los dos últimos, tal como se muestra en la @tab-servos. 
 

  #linebreak()
  #figure(
    table(
      columns: (0.5fr, 0.5fr, 0.6fr, 0.5fr),
      inset: 5pt,
      align: horizon + center,
      stroke: (x: none, y: 0.75pt),

      [*Servomotor*], [*Articulación*],
      [*Rango de movimiento (°)*], [*Modelo*],
      [M1], [Base], [0-180], [SR 431],
      [M2], [Hombro], [15-165], [SR 431],
      [M3], [Codo], [0-180], [SR 431],
      [M4], [Muñeca vertical], [0-180], [SR 431],
      [M5], [Muñeca rotatoria], [0-180], [SR 311],
      [M6], [Pinza], [10-73], [SR 311]
    ),
    caption: [Asignación de servomotores a las articulaciones del Braccio Tinkerkit, junto al rango de movimiento admisible de cada uno.]
  )<tab-servos>

   \ Las características de éstos se muestran en la @tab-servos2, mostrando un mayor torque en el modelo dedicado a las zonas de mayor carga del dispositivo robot.

  #linebreak()
  #figure(
    table(
      columns: (1.2fr, 0.8fr, 0.8fr),
      inset: 5pt,
      align: horizon + center,
      stroke: (x: none, y: 0.75pt),

    [*Característica*], [*SR 431*], [*SR 311*],
    [Voltaje operativo (V)], [4.8–6.0], [4.8–6.0],
    [Torque (kg-cm) a 6 V], [14.5], [3.8],
    [Torque (kg-cm) a 4.8 V], [12.2], [3.1],
    [Peso (g)], [62], [27],
    [Dimensiones (mm)], [42 × 20.5 × 39.5], [31.3 × 16.5 × 28.6],
    [Velocidad (s/60°) a 6 V], [0.18], [0.14],
    [Velocidad (s/60°) a 4.8 V], [0.20], [0.12],

    ),
    caption: [Especificaciones comparativas de los servomotores utilizados en el Braccio Tinkerkit @braccio.]
  )<tab-servos2>


 #pagebreak()
 Adicionalmente a ello, en el kit se incluye una placa de expansión (shield) que permite conectar los servomotores y otros componentes electrónicos de manera sencilla y ordenada. Esta placa se conecta a una placa Arduino Uno y proporciona los pines necesarios para la conexión de los servos, así como una interfaz para la alimentación y el control de los mismos. Sus características técnicas se describen en la @tab-shield.

  #linebreak()
  #figure(
    table(
      columns: (0.5fr, 0.5fr),
      inset: 5pt,
      align: horizon + center,
      stroke: (x: none, y: 0.75pt),
      [Versión], [V4],
      [Voltaje de funcionamiento], [5 V],
       [Consumo de potencia], [20 mW],
      [Corriente Máxima (M1-M4)], [1.1 A],
       [Corriente Máxima (M5-M6)], [750 mA],
    ),
    caption: [Especificaciones técnicas de la placa mostrada en la Figura 2.8.]
  )<tab-shield>

#col2(
    figure(align(image("template/figures/shield.jpeg", width: 100%), center), caption: [Placa de expansión (shield) utilizada para la conexión de los servomotores. En ella se puede visualizar la disposición de los pines naranjas etiquetados con la numeración correspondiente]),
    figure(align(image("template/figures/Arduino_Uno.jpg", width: 72%), center), caption: [Placa Arduino Uno utilizada como controlador principal del robot Braccio Tinkerkit.]
  ),
)

#linebreak()
La placa Arduino UNO es la base del sistema y encargada de la comunicación entre los diferentes componentes del robot. Esta placa se conecta a la shield y proporciona la interfaz necesaria para enviar las órdenes de los motores. Sus especificaciones técnicas se describen en la @tab-arduino.


  #linebreak()
  #figure(
    table(
      columns: (0.5fr, 0.5fr),
      inset: 5pt,
      align: horizon + center,
      stroke: (x: none, y: 0.75pt),
[Microcontrolador],  [Microchip ATmega328P],
[Voltaje de funcionamiento], [5 V],
[Voltaje de entrada], [7-12 V],
[Pines de E/S digitales], [14 (6 proporcionan salida PWM)],
[Pines de entrada analógica], [6],
[Corriente DC por Pin de E/S], [20 mA],
[Corriente CC para Pin de 3.3V], [50 mA],
[Memoria Flash], [32 KB],
[SRAM], [2 KB],
[EEPROM], [1 KB],
[Velocidad del reloj], [16 MHz],
[Longitud], [68.6mm],
[Ancho], [53,4mm],
[Peso], [25g]
    ),
    caption: [Especificaciones técnicas de la placa mostrada en la Figura 2.9 @arduino.]
  )<tab-arduino>


= Plataformas de desarrollo y simulación
  El manipulador Braccio Tinkerkit forma parte del ecosistema Arduino, tal como se ha mencionado previamente. Debido a esta característica, puede ser simulado y controlado a través de diversas plataformas, destacando Matlab y ROS; siendo Gazebo, MoveIt y PyBullet las principales herramientas de simulación a destacar.
  == Plataformas de desarrollo
  === Matlab
  Matlab/Simulink es un entorno de computación numérica y programación que ofrece un ecosistema integrado para el diseño, la simulación y la implementación de sistemas, incluyendo aplicaciones de robótica. A través de toolboxes específicos como _Robotics System Toolbox_ y _Simscape_ proporciona un entorno gráfico y basado en scripts para modelar y simular robots @simscape.

  === ROS
  ROS (Robot Operating System) es un framework de código abierto caracterizado por ser el estándar para la investigación y el desarrollo en robótica. Facilita la comunicación y la gestión de procesos en un robot a través de un modelo de "nodos" que se comunican de forma centralizada @melodic.

  === ROS 2
  ROS2 (Robot Operating System 2) es la nueva generación de ROS, diseñada para abordar las limitaciones de la primera versión y adaptarse a las necesidades actuales de la robótica. Está pensada para aplicaciones industriales, sistemas multi-robot y sistemas en tiempo real, mediante una arquitectura de comunicación descentralizada @repo.

  #figure(image("template/figures/2024 ROS Metrics Report.png", width: 70%), caption: [Tabla comparativa del incremento de descargas de ROS 2, siendo Humble y Jazzy sus exponentes, frente a la decadencia de las distribuciones anteriores, destacando Noetic como última versión de ROS 1 @ros_metrics.]) <fig-ros2>

=== Comparativa de las plataformas

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
#linebreak()
Tras comparar estas tres vertientes y en función de los objetivos formativos y profesionales planteados, la elección recomendada es ROS 2.
El mayor problema del mismo recae en su complejidad, pues requiere de una mayor inversión inicial de tiempo para aprender sus herramientas y conceptos, así como de la instalación de un sistema operativo (Ubuntu) y los paquetes necesarios para su funcionamiento (ROS 2 Humble, Gazebo, RViz, MoveIt2, etc). 
\ Sin embargo, aporta ventajas claras como su arquitectura descentralizada, un mejor soporte para requisitos de fiabilidad y tiempo real, integración con MoveIt2 y un ecosistema creciente orientado a la robótica profesional y de investigación.




  == Simuladores, planificadores y visores en ROS 2

  A continuación se ofrece una comparativa práctica y orientada a decisiones entre las herramientas más relevantes del ecosistema ROS 2 en tres áreas: simulación física, planificación y visualización.

  === Simuladores físicos
  - Gazebo: simulador con soporte para SDF/URDF, tratamiento de contactos y sensores, plugins en C++/Python y buena integración con ROS 2. Destaca por su alta fidelidad física y un ecosistema maduro de plugins y sensores, ideal para pruebas sim‑to‑real. Su principal limitación es una instalación y configuración más compleja, con un coste computacional mayor.

  - PyBullet: motor ligero y rápido, fácil de usar desde Python, muy útil para prototipado rápido, simulación de grandes lotes y experimentos de aprendizaje por refuerzo. Destaca por su velocidad y simplicidad, pero con una integración con ROS 2 menos directa y una simulación de sensores más limitada.

  - Webots: entorno todo‑en‑uno con fuerte enfoque educativo y ejemplos listos. Destaca por su rápido arranque y buen soporte de sensores. Su mayor limitante es constar de un modelo de licencias para ciertas características, con un ecosistema menor optimizado para investigación avanzada.

  === Planificación
  - MoveIt2: framework principal para planificación de movimiento en ROS 2, integra OMPL, planificación de trayectoria, planificación de agarres y soporte para _ros2_control_. Pese a ser un sistema complejo, la integración directa con ROS 2 y sus herramientas para planificación y ejecución lo posicionan como una opción robusta para aplicaciones robóticas, mejorando a su predecesor.

  - OMPL (Open Motion Planning Library): librería de planificadores sampling‑based (RRT, PRM, etc.) usada por MoveIt2. Ofrece una amplia gama de algoritmos, siendo muy configurable. Sin embargo, requiere de un framework que gestione escenas y la ejecución de planes, por lo que se usa típicamente junto a MoveIt2.

  === Visualización y depuración
  - RViz2: visor 3D estándar en ROS 2; muestra TF, tópicos, nubes, planes y estados del robot. Su principal ventaja es la integración nativa, siendo extensible mediante displays y plugins. Sin embargo, no ofrece grandes diferencias frente a Rviz, compartiendo su interfaz clásica. 

  - Foxglove Studio: herramienta moderna de visualización basada en web/desktop con soporte para ROS 2. Ofrece una interfaz moderna, con trazado de datos y vistas configurables. Se encuentra peor integrada en MoveIt2, pero su popularidad está en aumento y se están desarrollando más tutoriales y recursos para su uso.

  === Elección de herramientas

En base a las características y limitaciones de cada herramienta, se puede diseñar un mapa de flujos de trabajo estratégicos para el desarrollo en la robótica moderna. El ecosistema ROS2 se nutre de una caja de herramientas modular donde la elección correcta depende directamente de la fase y el objetivo del proyecto.
\
\
Para un desafío como el "pick and place" del Braccio Tinkerkit, utilizar un prototipo rápido en PyBullet puede ser útil para la validación de un nuevo algoritmo de agarre en minutos, así como la familiarización con el entorno de los robots manipuladores.
Una vez validado, la simulación de alta fidelidad en Gazebo garantiza que la trayectoria es físicamente coherente y que los sensores responderían correctamente, construyendo la confianza necesaria para el paso al hardware.
Finalmente, la abstracción que provee ros2_control actúa como el puente crucial que permite que el mismo código, planificado con MoveIt2, opere de forma idéntica en el simulador y en el robot físico.
Este enfoque, visualizado con la claridad de RViz2 y las herramientas de GUI que nos ofrece, completa un sistema perfectamente integrado en el entorno de la robótica industrial, pudiendo amplificar horizontes con la potencia de datos de Foxglove Studio. 
\
\
No obstante, para el proyecto actual, se ha optado por la combinación de Gazebo, MoveIt2 y RViz2, dada su integración nativa y comodidad, dejando la puerta abierta a Foxglove para futuras iteraciones. En la @fig-diagram se muestra un ejemplo del flujo de datos y herramientas relevantes durante el desarrollo del sistema.


#figure(image("template/figures/diagrama.png"), caption: [Diagrama de flujo del sistema ROS2 con MoveIt2, Gazebo y el resto de herramientas utilizadas para la simulación y control del proyecto.]) <fig-diagram>


= Diseño del sistema
  El sistema propuesto integra un robot manipulador Braccio Tinkerkit, controlado por una placa Arduino UNO, con un entorno de simulación en ROS 2 Humble. El flujo de datos y control se estructura en varios nodos ROS 2 que gestionan la percepción, planificación y ejecución de movimientos, tanto en simulación como en el robot físico.
     
== Repositorio ROS2 Braccio
El repositorio base seleccionado para el desarrollo del sistema es el creado por el usuario jaMulet @repo, debido principalmente a su estructura modular y funcional para la simulación y control del Braccio Tinkerkit en ROS 2. 

Está organizado en varios paquetes que gestionan diferentes aspectos del sistema, siendo éstos: 
+ Braccio_bringup: Paquete principal para lanzar los nodos necesarios para controlar el robot, tanto en simulación como en el hardware real.

+ Braccio_description: Contiene la descripción del robot en formato URDF, lo que permite su visualización y uso en herramientas como RViz.

+ Braccio_hardware: Define la interfaz de hardware para la comunicación con el robot real. Se basa en la comunicación serie USB para enviar mensajes a la plataforma Arduino y controlar el robot físico.

+ Braccio_moveit_config: Configuración para el uso de MoveIt2, mediante la implementación de los controladores del brazo y la pinza.

+ Braccio_ROS_Arduino: Contiene la biblioteca para implementar la interfaz de hardware del robot, basada en comunicación serial. Para el control de tareas se encuentra implementado un programador de éstas basado en la biblioteca TaskScheduler @task.

#linebreak()

#figure(
  col2(
    align(image("template/figures/Rviz_sim.png", width: 113%), left),
    align(image("template/figures/Gazebo_sim.png", width: 80%), right)
  ),
  caption: [Ilustración de la simulación en RViz y Gazebo del robot manipulador realizando una trayectoria. En la izquierda, se puede observar el brazo en sus posiciones inicial, actual y final. A su derecha, la representación de Gazebo mostrando esa posición actual junto al entorno simulado.]
)



#pagebreak()

El repositorio está diseñado para funcionar con dos modos, seleccionables en el lanzamiento del sistema:
- Simulación: Utiliza Gazebo para crear un entorno virtual con el robot Braccio. Esto permite probar la lógica de control y la planificación de movimientos sin necesidad del hardware físico. Se activa con el argumento "sim:=true".
- Hardware Real: Se comunica directamente con el robot Braccio a través de una conexión serie con una placa Arduino. El paquete _braccio_hardware_ gestiona esta comunicación, mediante el argumento "sim:=false". Adicionalmente incluye una opción para probar la comunicación con el hardware, mediante "hw_test:=true".



== Extensiones y mejoras implementadas
  El repositorio original ha sido modificado y ampliado para incluir las nuevas funcionalidades que permitan lograr los objetivos propuestos, mejorar la experiencia de usuario y mantener esa modularidad característica, reflejando ese trabajo en el siguiente repositorio @my_repo. 

  Se han añadido dos nuevos paquetes principales:

+ Braccio_gamepad_teleop: Permite el control del robot mediante un mando conectado a través del puerto serie. Se ha implementado el mapeo de los botones y joysticks del mando a comandos específicos para mover las articulaciones del robot, tanto en simulación como en el hardware real, utilizando un mando de PlayStation 4 para las pruebas.


+ Braccio_vision: Incluye los nodos y scripts necesarios para tareas de visión por computadora y control. En éste se abordan aspectos como la detección de objetos, calibración de cámaras y aplicaciones de "pick and place".

+ Sim-to-real: Contiene los scripts necesarios para la transferencia de la simulación a la realidad, permitiendo que los modelos y controladores desarrollados en Gazebo se apliquen al robot físico. Se nutre de la mayoría de scripts de visión y los complementa con adaptaciones específicas para el hardware.

Estas implementaciones se tratarán en detalle en las siguientes secciones, explicando su diseño, integración con el sistema y los beneficios que aportan al proyecto global.


== Entorno de simulación
El entorno donde el robot opera se define en el archivo _braccio.world_, ubicado en la carpeta _gazebo_ de _braccio_description_. Este archivo actúa como el escenario virtual en el que el robot Braccio interactúa con otros objetos y el entorno. Su función es establecer todo lo que existe en el mundo antes de que el manipulador aparezca.

En el siguiente se especifican varios elementos clave:
- Define la gravedad del mundo, estableciendo el terreno y la luminosidad del mismo a través de un modelo de sol. 
- Incluye dos modelos estáticos de forma hexagonal de colores verde y azul, como superficies para el depósito de los objetos.
- Registra los plugins _gazebo_ros_state_ y _gazebo_link_attacher_,  necesarios para la obtención de la posición de cada objeto en tiempo real y para la simulación del agarre de los objetos, respectivamente.

=== Robot manipulador 

El robot manipulador Braccio se describe principalmente en la carpeta _braccio_description_ comentada previamente. En el interior de la misma se encuentra una carpeta llamada _urdf_, que contiene el archivo _braccio.urdf.xacro_, entre otros. Éste es el archivo de configuración principal y se nutre del resto de archivos, donde se definen las diferentes partes del robot, como los enlaces y las articulaciones, así como sus propiedades físicas y visuales. 
\
\
Adicionalmente, se encuentra _braccio.ros2_control.xacro_, quién apunta a _braccio_controllers.yml_, donde se especifican los controladores PID para cada articulación del robot, así como la configuración de los actuadores y sensores. 

#figure(
  col2(
    align(image("template/figures/Rob_frontal.png", width: 100%), center),
    align(image("template/figures/Rob_lateral.png", width: 100%), center)
  ),
  caption: [Representación del robot Braccio Tinkerkit en Gazebo, mostrando dos perspectivas diferentes del manipulador.]
)

=== Spawner de Cámara y Cubos <camera-spawn>
  Para la simulación de tareas de percepción y manipulación, se han añadido varios elementos al entorno de Gazebo. El ejecutable encargado de esta acción es _vision_simulation.launch.py_, ubicado en la carpeta _launch_ del paquete _braccio_vision_. Este ejecutable lanza el mundo junto al robot y, pasado un tiempo, inicia el spawner de la cámara y los cubos.
#linebreak()
\
   En primer lugar, se ha implementado un nodo que simula una cámara ubicada en el centro del mundo, a 0.6m de altura, proporcionando una vista cenital del entorno. Las físicas y plugins de ésta se encuentran definidas mediante _overhead_camera.urdf.xacro_, quien, junto a _camera_spawner.py_, se encarga de su inicialización en el mundo y de la publicación de los datos de la cámara en los tópicos correspondientes.

#linebreak()
  Posteriormente, se han creado varios modelos de cubos de diferentes colores (rojo, verde y azul) y un tamaño de 3cm que actúan como objetos a manipular. Estos modelos están definidos mediante una plantilla SDF y se pueden instanciar en el mundo a través de _object_spawner.py_. Los cubos tienen propiedades físicas realistas, como masa y fricción, para asegurar una interacción coherente con el robot.


#linebreak()
  Estos elementos permiten simular escenarios de pick‑and‑place donde el robot debe identificar, agarrar y mover los cubos a ubicaciones específicas dentro del entorno simulado.

#linebreak()

#figure(
  col2(
    align(image("template/figures/Vision_sim.png", width: 100%), right),
    align(image("template/figures/Debug_cam.png", width: 110%), left)
  ),
  caption: [Representación completa del entorno de simulación, incluyendo el robot, los recipientes, la cámara y los objetos manipulables. A la derecha, la vista cenital de la cámara simulada 0.6m sobre el suelo, mostrando los cubos de diferentes colores.]
)<fig-spawn>


= Control mediante mando de PS4
El sistema actual propone la implementación de un sistema de control basado en la retroalimentación visual, utilizando la cámara simulada para ajustar dinámicamente los comandos de movimiento del robot.
Sin embargo, previa a ésta, se ha optado por un sistema de control manual mediante un mando de PS4, con el objetivo de familiarizarse con el entorno y realizar las pruebas pertinentes que verifiquen el correcto funcionamiento del mismo. 
En la carpeta _braccio_gamepad_teleop_ se encuentra el nodo principal encargado de esta tarea, _gamepad_teleop.py_, y un launch que arranca el sistema.

 == Arquitectura y filosofía de control
Para la realización de este sistema de teleoperación se ha optado por una filosofía basada en el control incremental directo en el espacio de articulación. Este sistema implica dos acciones fundamentales:
\
\
+ Los joysticks no controlan el movimiento de la pinza en un eje XYZ, sino que controlan directamente la velocidad de rotación de las articulaciones individuales del robot. En @joystick, se explica la diferencia entre utilizar este control directo (JointJog), frente al uso de un sistema basado en la cinemática inversa (TwistStamped).

+ El nodo mantiene una variable interna, _self.current_joint_positions_, que almacena la posición objetivo actual de cada articulación. De este modo, cada vez que se mueve el joystick, el nodo no establece una posición fija, sino que añade o resta un pequeño incremento a la posición actual, permitiendo un movimiento del robot mucho más fluido y suave. En la @fig-base se muestra dicho incremento de una forma mucho más clara.

\
De este modo, la arquitectura del sistema es muy sencilla, teniendo un único nodo encargado de:
+ Recibir los datos crudos del gamepad.
+ Interpretar los movimientos de los joysticks y los botones.
+ Mantener un registro del estado de las articulaciones del robot.
+ Calcular los nuevos comandos de posición para cada articulación.
+ Gestionar la lógica de "pick and place" interactuando con los servicios de Gazebo.
+ Publicar los comandos directamente a los controladores del robot.
\
#figure(
    align(image("template/figures/incremento_base.png", width: 100%), center),
  caption: [Lectura del terminal de Ubuntu. Representa el incremento en la posición de la articulación base al mantener el joystick inclinado hacia la izquierda durante unos segundos, siendo LX el valor del joystick izquierdo y el primer término de POS, la posición angular de la base del robot en radianes. El resto de valores nulos corresponden al estado de los botones que no se han pulsado.]
)<fig-base>


== Mapeo de botones y joysticks
El control de las acciones del robot se realiza mediante un mapeo de los botones y joysticks del mando de PS4 a los comandos de movimiento del robot, tal como se puede observar en la @fig-mapeo.

=== Joysticks
Se encuentran habitualmente dos joysticks en el mando, el stick izquierdo y el derecho, cada uno con los ejes horizontal y vertical.
 La asignación de los ejes a las articulaciones del robot es la siguiente:
- Stick izquierdo:
  - Eje X: Joint_base (base)
  - Eje Y: Joint_1 (hombro)
- Stick derecho:
  - Eje X: Joint_3 (antebrazo)
  - Eje Y: Joint_2 (codo)

A esta configuración se incluye un deadzone para evitar movimientos no deseados por pequeñas variaciones en la posición de los joysticks.
=== Botones 
La cantidad de botones en el mando es ampliamente superior, decidiendo destinar los gatillos para el control de la pinza y articulación restante, y los botones frontales para acciones específicas de "pick and place":
- Gatillos L1 y R1: incrementan y decrementan Joint_4 (muñeca).
- Gatillos L2 y R2: abren y cierran Gripper_Joint (pinza).
- Triángulo: realiza la acción de "pick", intentando agarrar el objeto más cercano.
- Cruz: realiza la acción de "place", intentando soltar el objeto agarrado.
 \ \
Asimismo, se ha configurado una variable global, llamada _velocity_factor_, que permite ajustar la velocidad de movimiento del robot, afectando a la suavidad y sensibilidad de los movimientos.

#figure(
  align(image("template/figures/mando.png", width: 100%), center),
  caption: [Diagrama del mando de PS4 con el mapeo de los botones y joysticks a las articulaciones y acciones del robot mencionadas previamente.]
) <fig-mapeo>

== Flujo de datos y control <attach-detach>
Tal como se ha comentado previamente, esta implementación prioriza la sencillez y respuesta inmediata. De este modo, a continuación se detalla el flujo de datos con el fin de comprender adecuadamente su funcionamiento: 
+ El launch arranca el nodo _joy_node_ @joy_linux, encargado de la publicación de datos en crudo del gamepad en _/joy_ y _gamepad_teleop.py_ se suscribe a este tópico.
+ El nodo principal:
  - Recibe los datos del gamepad a través del tópico, la lista de modelos en simulación de _/gazebo/model_states_ y obtiene de las TF la posición del gripper para calcular posteriormente su proximidad a los objetos.
  - Calcula y publica los comandos para los 5 joints del brazo y el gripper en los tópicos correspondientes. Sin embargo, previo a ello, verifica que ninguna de las posiciones objetivo calculadas exceda los límites definidos para cada articulación.
  - Conecta con los servicios de Gazebo para la lógica de "pick and place", llamando a los servicios de _attach_ y _detach_ del plugin _libgazebo_link_attacher.so_. Éstos:
    - Detectan el objeto más cercano utilizando la información de los sensores y la posición del gripper.
    - Comprueban que la distancia entre el gripper y el objeto es adecuada, inferior a 15 cm.
    - Si ambas condiciones se cumplen, envía la petición de _attach/detach_ al servicio correspondiente, mostrado en la @fig-attach
+ El sistema _ros2_control_ recibe estas trayectorias y las ejecuta en el robot simulado o real.
#linebreak()
Este control proporciona una vía rápida y segura para validar la arquitectura de control, probar el mapeo de ejes y calibrar parámetros como el velocity_factor antes de automatizar. 
Es una herramienta útil para detectar límites de articulación, comprobar la comunicación con Gazebo/ros2_control y afinar la experiencia de teleoperación, previa a la implementación 
de un sistema de control basado en visión del manipulador real.
\
\
#figure(
  align(image("template/figures/atach.png", width: 100%), center),
  caption: [Servicio de Gazebo para el pick and place de objetos mediante el plugin gazebo_link_attacher. En la imagen se observa la petición de attach al servicio, el cálculo de las distancias respecto la posición del gripper y los cubos; y tras la verificación del umbral de cercanía, la ejecución de la acción entre la pinza y el blue_cube1.]
) <fig-attach>


= Percepción y localización de objetivos
La percepción y detección de objetos es un componente elemental en el sistema de pick‑and‑place, ya que proporciona la información necesaria para que el robot identifique y localice los objetos a manipular sin necesidad de intervención humana directa, de forma automática. Ante ello, se ha investigado la metodología empleada por Will Stedden en su proyecto @chef, basado en un flujo de trabajo modular y reproducible. Sin embargo, debido al enfoque de calibración manual, se ha optado por la implementación de un sistema de calibración automática basado en homografía, similar al explicado por Nathan Naerts @aruco, donde se han utilizado arucos para delimitar el espacio de trabajo y la conversión de coordenadas. No obstante, en este caso, se ha optado por sustituir sus arucos por cubos rojos referenciales.

//#figure(align(image("template/figures/aruco.png", width: 70%), center), caption: [Imagen obtenida del vídeo explicativo de Nathan Naerts, donde implementa un sistema de calibración automática basada homografía utilizando arucos para delimitar el espacio de trabajo y la conversión de coordenadas. En él se observa el manipualdor, situado en una mesa de trabajo, agarrando un objeto situado en el interior del recinto; reconocido por el sistema de visión de la imagen inferior derecha @aruco.]) <fig-aruco>

#linebreak()
El sistema de percepción sigue el flujo modular mostrado en la @fig-flujo donde se facilita la validación en simulación y la transferencia al robot real. Todos estos archivos se encuentran en la carpeta _braccio_vision_.

- Los parámetros intrínsecos del sensor de la cámara, así como la configuración de los umbrales de detección se almacenan en  _vision_config.yaml_.
- El sensor de la cámara publica las imágenes, pudiendo visualizar la imagen desde _camera_viewer.py_.
- El detector de objetos procesa las imágenes detectando contornos por color y calculando centroides en píxeles. Luego, publica la información en la imagen debug para su visualización y en un tópico con las coordenadas de los objetos detectados.
- Mediante la posición de los objetos detectados en píxeles y los objetos de referencia en metros, se realiza el cálculo de la matriz de homografía, que se almacena en _camera_calibration.json_.
- Esta matriz se utiliza para convertir las coordenadas de píxeles a coordenadas del mundo real de aquellos nuevos objetos que el sistema desconoce su posición.

#linebreak()
#figure(align(image("template/figures/Percepcion.png", width: 80%), center), caption: [Esquema del flujo de percepción y detección de objetos para el sistema de pick-and-place.]) <fig-flujo>

  
  == Sensor de la cámara
  El sensor de la cámara se configura para simular una cámara RGB convencional, con parámetros ajustables como resolución, campo de visión (FOV), tasa de frames y posición fija en el entorno. Tal como se describió en la @camera-spawn, la configuración principal se realiza en _overhead_camera.urdf.xacro_ mediante _camera_spawner.py_. 
  
  #linebreak()
  Esta configuración se complementa con _vision_config.yaml_, donde se definen los siguientes parámetros clave del sensor: 

  - Resolución: 640x480 px.
  - FOV: 80º.
  - Tasa de frames: 30 FPS.
  - Posición: fija en el entorno.
  - Altura: 0.6 metros.
  De los cuales se obtienen algunos valores como las distancias focales: fx=381.96 y fy=381.96 o el centro de la cámara cx=320 y cy=240.

#linebreak()
  La cámara simulada, por su parte, publica imágenes en el tópico _/overhead_camera/image_raw_ e información de la misma en _/overhead_camera/camera_info_. Estas imágenes son consumidas por el nodo de detección de objetos para su procesamiento y por el subsistema de visualización _camera_viewer.py_. Esta última permite la visualización de la imagen en tiempo real y la imagen procesada con la información de los objetos detectados, mostrado en la @fig-cam.

#linebreak()
  #figure(
  col2(
    align(image("template/figures/Cam_principal.png", width: 100%), left),
    align(image("template/figures/Cam_debug.png", width: 98%), right)
  ),
  caption: [Representación de las cámaras simuladas, mostrando la vista del sensor raw y la vista de depuración tras la detección de los objetos. En esta última, se puede observar el marcador de cada objeto detectado junto con las coordenadas de su centro en sus respectivos colores.]
)<fig-cam>

== Detección de objetos

El subsistema de detección de objetos tiene por objetivo localizar los cubos presentes en el área de trabajo y publicar su posición en un formato utilizable por el resto de la cadena de control y por las herramientas de visualización empleadas en el proyecto.
\ El sistema recibe información de la cámara simulada y de su configuración, así como los umbrales HSV y parámetros de filtrado de área definidos en _vision_config.yaml_. El procesamiento de las imágenes sigue un flujo clásico de visión por computadora basado en OpenCV, que incluye:
- Conversión BGR → HSV y aplicación de rangos colorimétricos definidos en el archivo de configuración mencionado, detectando así los cubos rojos, verdes y azules.
- Operaciones morfológicas y filtrado por área para eliminar ruido y detecciones espurias.
- Detección de contornos y cálculo del centroide en píxeles (cx, cy) para cada objeto relevante.
- Conversión píxel → mundo mediante la función `pixel_to_world`. Esta conversión se apoya en un modelo geométrico simple, @fig-pixel, pudiendo ser sustituido posteriormente por la homografía calibrada almacenada en _camera_calibration.json_ para aumentar la precisión.
#linebreak()
#figure(col2(block(
  stack(
    dir: ttb,
    spacing: 1.5em, 
    math.equation(block: true, $  X_norm = ("pixel"_x - "c"_x)/ "f"_x  #h(1.5cm)   Y_norm = ("pixel"_y - "c"_y) / "f"_y $),
    math.equation(block: true, $ X_"world" = X_norm dot.op "Z" #h(1.5cm)  Y_"world" = Y_norm dot.op "Z" $), )),
    align(image("template/figures/UV_XY.png", width: 50%), top)),
  caption: [Ecuaciones para el cálculo de las coordenadas normalizadas y su proyección al plano, basadas en el modelo geométrico mostrado en la derecha @pixel_world. Los parámetros utilizados se corresponden con la posición del objeto en píxeles (pixel#sub[x], pixel#sub[y]), el centro de la cámara (c#sub[x], c#sub[y]), las distancias focales (f#sub[x], f#sub[y]) y la altura de la cámara (Z).],
  kind: image, )<fig-pixel> 

#linebreak()
  Tras esto, el nodo publica la siguiente información:
  - _/vision/debug_image_: imagen anotada con máscaras y centroides, destinada a diagnóstico y visualización.
  - _/vision/object_markers_: marcadores para representación en RViz.
  - _/detected_object_coords_: coordenadas en el sistema de referencia del mundo para cada detección.

#linebreak()
  Esta información proporcionada permite al usuario depurar discrepancias entre el simulador y el hardware, y actuar como enlace entre la detección de objetos y los subsistemas de planificación y ejecución MoveIt2 o teleop. Por otra parte, mantener una separación clara entre canales de diagnóstico (debug_image, markers) y canales de decisión (detected_object_coords) reduce el acoplamiento entre componentes y facilita las pruebas.

#linebreak()
  #figure(align(image("template/figures/Object_detector.png", width: 100%), center), caption: [Lectura del terminal de Ubuntu tras la ejecución de _object_detector.py_. Representa la cantidad de objetos detectados, clasificados por su color, junto a sus coordenadas en píxeles, coincidentes con los datos de la @fig-cam. 
  Los cubos temporalmente bloqueados son aquellos destinados a la manipulación en el entorno simulado, estudiados en secciones posteriores.])

  == Matriz de Homografía

  La matriz de homografía se utiliza para mapear puntos de la imagen a coordenadas del mundo, teniendo en cuenta la perspectiva de la cámara. Bien es cierto que tiene infinidad de usos y, al tratarse de una cámara cenital, su relevancia es menor pues se trabaja en un escenario 2D ideal, sin distorsión. No obstante, para este proyecto y, de cara a la implementación real, es importante contar con esta matriz en términos de precisión.

#linebreak()
  El cálculo de esta matriz es bastante sencillo. Para ello, se han colocado 4 cubos rojos en posiciones conocidas dentro del entorno simulado. Mediante el script de detección de objetos anterior se han detectado éstos y calculado sus centroides en píxeles, tal como se muestra en la @fig-cam, obteniendo las posiciones indicadas en la @fig-pos.

  #linebreak()
  #figure(
    table(
      columns: (auto, 0.8fr, 0.8fr),
      inset: 5pt,
      align: horizon + center,
      stroke: (x: 0.5pt, y: 0.75pt),
    [*Cubo rojo*], [*Posición real XY (m)*], [*Posición en píxeles XY (px)*],
    [1], [-0.35, -0.25], [202, 75],
    [2], [-0.35, 0.25], [436, 75],
    [3], [0.35, 0.25], [436, 403],
    [4], [0.35, -0.25], [202, 403],
    ),
    caption: [Posiciones de los cubos rojos en el entorno simulado y sus centroides capturados por la cámara en píxeles.]
  )<fig-pos>


#linebreak()
  Combinando esta posición en píxeles con su ubicación en el mundo real, se ha aplicado la función `cv2.findHomography` con el fin de la obtención de esta matriz. 
\  La matriz obtenida se puede visualizar en la @fig-Homografia y se almacena en _camera_calibration.json_ para su uso posterior en la conversión de coordenadas de la cinemática inversa.

  #linebreak()
  #figure(align(image("template/figures/Hom.png", width: 100%), center), caption: [Lectura del terminal de Ubuntu tras la ejecución de _Calculate_homography.py_. Representa la matriz de homografía calculada .])<fig-Homografia>


  #linebreak()
  Finalmente, se ha probado dicha matriz mediante un script de validación que compara las posiciones conocidas de los cubos con las posiciones calculadas a partir de sus centroides en píxeles, así como con posiciones interiores a ese área definida. Los resultados muestran un error prácticamente insignificante, lo cual es perfecto para las tareas de pick‑and‑place previstas.

 #linebreak() 

#figure(align(image("template/figures/Test_hom.png", width: 100%), center), caption: [Lectura del terminal de Ubuntu tras la ejecución de _test_homography.py_. Representa los resultados de la validación de la matriz de homografía donde el error en la reproyección es muy bajo. Al comparar la posición real de un cubo adicional (0.35, 0.05) con la posición estimada mediante la matriz (0.3497, 0.04864) se observa un error de 1.38 mm, ámpliamente asumible para un robot manipulador.])<fig-test-hom>



= Planificación de agarre y manipulación
El sistema de planificación se base en el cálculo de la cinemática inversa para determinar las posiciones y orientaciones necesarias del efector final del robot.
Posteriormente, se traspasa esta información a un archivo de configuración donde se ubican el resto de posiciones y el robot procede a ejecutar la tarea de manipulación.

== Cinemática inversa
  La cinemática inversa es el proceso de determinar las posiciones articulares necesarias para que el efector final del robot alcance una posición y orientación deseadas en el espacio cartesiano. En este proyecto, se ha implementado un enfoque basado en la geometría del robot Braccio Tinkerkit, utilizando las longitudes de sus eslabones y las restricciones de sus articulaciones.
=== Fundamentos teóricos
El sistema utilizado para el cálculo de la cinemática inversa se basa en el marco teórico empleado por Will Stedden @chef. Este enfoque se centra en la geometría del brazo y las limitaciones de sus ángulos articulares mostrados en la @fig-teoria.

#figure(image("template/figures/Teoria.png", width: 80%), caption: [Diagrama esquemático del brazo robótico, mostrando las longitudes de los eslabones implicados y las articulaciones relevantes para el cálculo de la cinemática inversa descrito posteriormente.]) <fig-teoria>


#linebreak()
En primer lugar se ha instanciado la longitud del brazo total en su máxima extensión, siendo ésta L=0.3025m, junto al Offset desde la muñeca hasta el efector final, que se ha establecido en l=0.064m.
\ Luego, se transforman las posiciones (x,y) en coordenadas polares, se verifica la altura y se estudia la alcanzabilidad del radio de trabajo, calculado mediante la relación entre las longitudes anteriores y el ángulo máximo y mínimo del hombro en radianes.

$ #sym.rho#sub[max] = 0.064 + 0.3025 dot.op cos(0.27) = 0.356 [m] $
$ #sym.rho#sub[min] = 0.064 + 0.3025 dot.op cos(pi/4) = 0.278 [m] $

"Nota": el ángulo máximo del codo se establece en 45º para evitar colisiones con la base del robot y el resto de articulaciones, pese a que su rango de funcionamiento real es más amplio [15º,165º].
Este hecho se debe en parte al método de recolección planteado, donde se ha optado por un agarre directo o frontal, frente a un método basado en un agarre desde arriba, donde se cogen objetos desde una vista superior, pero el rango de actuación es más limitado.

#linebreak()
  #figure(
  col2(
    align(image("template/figures/pinza.png", width: 80%), right),
    align(image("template/figures/pinza2.png", width: 80%), left)
  ),
  caption: [Representación de las pinzas del robot, mostrando los dos tipos de agarre. El primero es un agarre en pinza o directo, ideal para objetos de media y larga distancia, mientras que el segundo es un agarre en forma de gancho, ideal para objetos de corta distancia.]
)


#linebreak()
Definidos los límites de trabajo, se procede al cálculo de los ángulos articulares (@ecuacion):
+ Se convierten las coordenadas cartesianas en polares $(rho, phi)$ y se aplica el cálculo del ángulo del hombro, verificando que se encuentra dentro de los límites establecidos.
+ Se aplica el cálculo del ángulo del codo y muñeca basados en el ángulo del hombro con la finalidad de mantener la orientación vertical. 
+ Se devuelven los ángulos articulares calculados en el orden adecuado para el braccio, junto a $phi$, utilizada para la rotación de la base y $theta#sub[gripper]$, que se mantiene constante.

#linebreak()
#figure(
  align(center)[
    $ theta_"shoulder" = arccos((rho - l) / L) $
    $ theta_"wrist" = theta_"shoulder" + pi / 2 $
    $ theta_"elbow" = pi / 2 - 2 dot theta_"shoulder" $
    $ "Ángulos" = [phi, theta_"shoulder", theta_"elbow", theta_"wrist", theta_"gripper"] $
  ],
  caption: [Ecuaciones para el cálculo de los ángulos articulares de un brazo robótico.],
)<ecuacion>

=== Configuración simétrica
Previo al cálculo final de la cinemática, donde la altura del efector final es importante de cara a la posición de agarre y aproximación, es necesario aclarar un aspecto clave respecto al ángulo de la base. Según la @tab-servos, se establece que el ángulo de la base tiene un rango comprendido entre 0 y 180º. El problema recae cuando, debido a la lógica implementada, el sistema interpreta al obtener las coordenadas polares que dicho ángulo es negativo y, por ende, se encuentra fuera de rango. 

#linebreak()
La solución propuesta para este problema ha sido implementar una lógica de $phi$ simétrica, de modo que si $phi$ es negativo, el código intenta reflejar el ángulo en la otra cara del robot para que la base pueda alcanzar dicha posición girando hacia el otro lado y "simular" un rango de movimiento de 360º del robot. Es imprescindible explicar y entender esta metodología pues afecta directamente al cálculo de la cinemática inversa y a la planificación de las trayectorias del robot explicadas posteriormente.

#figure(image("template/figures/Simetria.jpeg", width: 90%), caption: [Representación del problema de la base y su rango de movimiento. En la imagen izquierda se identifica una posición objetivo que se encuentra en el rango (0, 180º). En la derecha, el objeto se encuentra fuera de este rango, lo que implica una solución donde el robot oriente su base como en el primer caso, y aplique simetría en el codo y demás articulaciones del robot.])
\ La metodología implicada es la siguiente:

+ Se obtiene el ángulo $phi$ en coordenadas polares.
+ Si $phi < 0$, se refleja el ángulo sumando 180º: $phi_"sim" = phi + pi$. 
+ Si $phi > 180º$, se refleja restando 180º: $phi_"sim" = phi - pi$.
+ Se normaliza a un rango de [0, 2$pi$] si fuese necesario. 
+ Se obtienen los ángulos articulares explicados anteriormente, con la única excepción de $theta_"shoulder"$, el cual se calcula su espejo antes de ser enviado por el vector de ángulos: $theta_"shoulder" = pi - theta_"shoulder"$.


=== Cálculo de las posiciones de aproximación y agarre

Las posiciones se determinan a partir de la cinemática inversa y los ángulos articulares calculados previamente. Sin embargo, éstos se calcularon bajo unos estándares 2D, siendo necesario adaptarlos ahora a un sistema 3D donde existe una altura Z.  Se definen así dos posiciones clave:

- Posición de aproximación: Es la posición inicial desde la cual el efector final se mueve hacia el objeto a manipular. Esta posición se calcula teniendo en cuenta la posición del objeto en el espacio, incluyendo un incremento de altura que establezca un movimiento seguro hacia el objeto, en este caso, 0.03 m.

- Posición de agarre: Es la posición final en la que el efector final debe estar para realizar la tarea de agarre. Esta posición se determina a partir de la posición del objeto y la configuración del brazo robótico.

#linebreak()
El cálculo de estas posiciones se realiza mediante la función `calculate_ik_xyz` en _inverse_kinematics_calculator.py_, que toma como entrada las coordenadas del objeto (x, y, z) y devuelve los ángulos articulares necesarios para alcanzar dichas posiciones. Su finalidad es ajustar principalmente el codo para poder controlar dicha altura efectiva.
Para este cálculo, se extraen los ángulos obtenidos previamente y se ajustan según la lógica de simetría descrita anteriormente:

#linebreak()
- Configuración estándar: se establece una altura de referencia estándar de $Z_N = 0.05 m $ y se configura un factor de sensibilidad dinámico basado en la extensión del hombro:

  - Si el hombro está muy extendido, es decir, es un elemento alejado, $Z_f = 12 $.
  - Si el hombro está en una posición intermedia, $Z_f = 10 $.
  - Si el hombro está en una posición cercana, $Z_f = 8 $.

  Es importante destacar que estos valores son aproximados y pueden ajustarse según las necesidades específicas de la tarea y la configuración del brazo robótico. 

#pagebreak()

  Con ellos, se calcula la altura ajustada del  codo:  $ Z_a = (Z - Z_N) dot Z_f $ $ theta_"elbow" = theta_"elbow" + Z_a $
   Y se ajusta la posición de la muñeca para mantener la orientación y compensar esta diferencia entre el ángulo original y final del codo:
$ theta_"wrist" = theta_"wrist" + #sym.Delta theta_"elbow" dot 1/2 $

#figure(image("template/figures/Cálculo_ik.png", width: 90%), caption: [Lectura del terminal de Ubuntu. Muestra el cálculo de la cinemática inversa para una posición objetivo x=0.35, y=0.05 y z=0.025, donde se observa el procedimiento ejecutado hasta el cálculo final, mostrando finalmente la posición de agarre y aproximación en radianes y grados.])

#linebreak()
- Configuración simétrica: para este caso, aplicar los mismos conceptos, así como la simetría es un proceso complejo puesto que se debe forzar al efector a bajar, compensando que la cadena cinemática se alarga. Por ello, se establecen dos estrategias: 
  - Alturas muy bajas: se aumenta el ángulo del hombro, se alinea el codo y se baja la muñeca drasticamente para que el efector final pueda bajar lo máximo posible.
  - Alturas moderadas: el efecto es similar a la configuración estándar. Se reduce el ángulo del codo moderadamente y se compensa éste con la muñeca para mantener la orientación. 


  #figure(image("template/figures/Calculo_ik_sim.png", width: 89%), caption: [Lectura del terminal de Ubuntu. Muestra el cálculo de la cinemática inversa para una posición objetivo simétrica: x=0.28, y=-0.15 y z=0.025, donde se observa el procedimiento ejecutado hasta el cálculo final. La posición de agarre se establece en [151.8, 174.3, 87.1, 176.1, 90.0][º], siendo la posición de aproximación [151.8, 147.0, 24.0, 123.0, 90.0][º].])

  Los cálculos de esta metodología se basan principalmente en constantes empíricas obtenidas tras múltiples pruebas y errores, las cuales pueden ser ajustadas según las necesidades específicas de la tarea y la configuración del brazo robótico. Por ello, no se detallan las ecuaciones específicas en este documento. Sin embargo, en el repositorio @my_repo se pueden visualizar cada una de ellas en el archivo correspondiente.



#linebreak()
Las posiciones calculadas mediante la cinemática inversa se almacenan en variables específicas para la aproximación y el agarre. Posteriormente, se abre el archivo _pick_and_place_config.yaml_, donde se encuentran las posiciones de home, reposo, depósito y objetivo. Entonces, se actualizan las entradas correspondientes a las posiciones objetivo del robot, sobrescribiendo los valores previos con los nuevos ángulos articulares obtenidos. Este proceso garantiza que el sistema de planificación y ejecución utilice siempre las posiciones más precisas y actualizadas para cada tarea de pick-and-place.

=== Test cinemática inversa
En la misma carpeta donde se ha desarrollado la cinemática inversa se encuentra un script de validación llamado _ik_workspace_tester_py_. Este script permite verificar la correcta implementación de la cinemática inversa, haciendo uso de un rango ampliado de posiciones en los ejes XY y comprobando que el robot puede alcanzar dichas posiciones sin errores.
La ejecución del script proporciona información sobre las posiciones probadas, junto a los resultados obtenidos, indicando si es apto, demasiado cerca/lejos o el problema encontrado. Junto a este, proporciona un porcentaje de éxito en las pruebas realizadas.

#linebreak()
La base del uso de este script se basa en encontrar posiciones de trabajo adecuadas para el robot, asegurando que pueda operar siempre en las mejores posiciones posibles, donde se minimicen los errores de posicionamiento y se maximice la eficiencia en las tareas de pick-and-place.

#linebreak()
  #figure(image("template/figures/ik_test.png", width: 85%), caption: [Lectura del terminal de Ubuntu tras la ejecución del script _ik_workspace_tester_py_. Muestra el resultado de las pruebas de cinemática inversa, indicando si las posiciones son aptas o si presentan problemas. En este fragmento, se muestra un rango de posición X comprendido entre 0.21 y 0.23, mientras que el rango Y se encuentra entre 0.15 y 0.30, con un paso de 0.02, mostrando así las posiciones cómodas para la ejecución del robot en un rango determinado.])

== Repositorio attach/detach

Durante todo el desarrollo del proyecto se ha hablado sobre la importancia de la lógica de pick-and-place, donde el robot debe ser capaz de identificar, agarrar y mover objetos dentro del entorno simulado. Sin embargo, el sistema de simulación de agarre del robot Braccio Tinkerkit no es nativo de Gazebo, por lo que no se puede simular el agarre de objetos directamente. 

#linebreak()
En versiones anteriores de ROS y Gazebo, se utilizaba el pluging de Planning Scene de MoveIt para gestionar la colisión y el contacto entre el robot y los objetos en la escena @moveit. No obstante, este plugin no es compatible con ROS 2 y Gazebo, lo que ha llevado a la búsqueda de alternativas para implementar esta funcionalidad en el entorno actual, puesto que la web oficial de MoveIt2 aún no ha implementado una solución. Como consecuencia, tras un intento fallido de adaptación del plugin, se ha optado por indagar en la red proyectos similares que puedan ofrecer una solución viable.

#linebreak()
Ante ello, la solución adoptada ha sido emplear el plugin _libgazebo_link_attacher.so_, implementado por la universidad de Cranfield @linkattacher. Este plugin permite simular el agarre y la liberación de objetos en el entorno de Gazebo, a través de la instalación del mismo y mediante un sencillo sistema de envío y recepción de mensajes.

#linebreak()
La interfaz proporcionada gestiona las colisiones y los contactos entre el robot y los objetos, por medio de una llamada al servicio /ATTACHLINK y /DETACHLINK. Estos servicios únicamente requieren del _model_name_ y _link_name_ de ambos elementos a unir o separar, es decir, el robot y el objeto a manipular. El problema de esto ha recaído en que, pese a estar muy bien explicado en su repositorio, no se ha mostrado una vía clara para un sistema donde el objeto a manipular cambia dinámicamente, como es el caso de este proyecto. Es por ello que, tal como se explicó anteriormente en la @attach-detach, ha sido necesario implementar un sistema dinámico basado en la distancia entre los elementos implicados.

#linebreak()
#figure(image("template/figures/detach.png", width: 100%), caption: [Lectura del terminal de Ubuntu. Representa la petición de detach al servicio, el cálculo de las distancias respecto la posición del gripper y los cubos; y la ejecución de la acción de detach, donde se puede mostrar el cubo azul cayendo desde la pinza.])

En la @fig-attach mostrada anteriormente, se puede observar la acción inversa, el proceso de coger el cubo.

#pagebreak()
== Flujo de acción
El flujo de acción del sistema de pick-and-place se basa en la integración de los subsistemas de percepción, planificación y control. A continuación, se detalla el proceso completo desde la detección del objeto hasta la ejecución de la tarea, descrito por el script _vision_auto_pick_and_place.py_:
- El nodo arranca y se suscribe a los tópicos de detección de objetos y estados del robot. Carga la calibración de la cámara obtenida mediante homografía y crea los clientes encargados de la lógica de _attach_ y _detach_.
- Recibe un _PointStamped_ con las coordenadas del objeto a manipular. Se realiza un filtrado de detecciones ya procesadas para evitar repeticiones y se encola o procesa, según corresponda.
- Transforma las coordenadas del objeto (px) a coordenadas del mundo (m) mediante la matriz de homografía obtenida de _camera_calibration.json_.
- Llama a la lógica de la cinemática inversa para calcular los ángulos articulares necesarios para alcanzar la posición de agarre y aproximación del objeto, e importarlos en _pick_and_place_config.yaml_.
- El ejecutor carga las posiciones desde el archivo de configuración, planifica con Moveit2 y ejecuta la trayectoria.
- Se monitorea el estado del robot y se gestionan las colisiones y contactos mediante los servicios /ATTACHLINK y /DETACHLINK en base al cierre y apertura de la pinza.
- Finalmente, se retorna a la posición de home, marca el objeto como procesado y se espera la siguiente detección.

#linebreak()
#figure(image("template/figures/flujo.png", width: 100%), caption: [Diagrama del flujo de acción del sistema de pick-and-place, mostrando la interacción entre los subsistemas de percepción, planificación y control.]) 

#linebreak()
En la @fig-demo se muestra la ejecución del sistema de pick-and-place para la recolección de un cubo, unificando todos los subsistemas y etapas del proceso explicadas. En las siguientes, se detallan imágenes del proceso de ejecución del robot, mostrando las posiciones alcanzadas en cada etapa del proceso.

#figure(image("template/figures/demo.png", width: 125%), caption: [Lectura del terminal de Ubuntu. Representa la ejecución completa del sistema de pick-and-place, desde la detección del objeto green_cube1 hasta la finalización de la tarea, mostrando las posiciones calculadas y los estados del robot en cada paso del proceso. Al finalizar, detecta el cubo green_cube2 y repite el proceso hasta que no existan más elementos.])<fig-demo>


  #col2(
    figure(align(image("template/figures/1.png", width: 88%), center), caption: [Posición home.]),
    figure(align(image("template/figures/2.png", width: 88%), center), caption: [Posición de aproximación.])
  )
  #col2(
    figure(align(image("template/figures/3.png", width: 88%), center), caption: [Posición de agarre. Gripper abierto]),
    figure(align(image("template/figures/4.png", width: 88%), center), caption: [Posición de agarre. Gripper cerrado.])
  )
  #col2(
    figure(align(image("template/figures/5.png", width: 88%), center), caption: [Posición de aproximación con objeto.]),
    figure(align(image("template/figures/6.png", width: 88%), center), caption: [Posición depósito con objeto. Gripper cerrado.])
  )
  #col2(
    figure(align(image("template/figures/7.png", width: 88%), center), caption: [Posición depósito sin objeto. Gripper abierto.]),
    figure(align(image("template/figures/8.png", width: 88%), center), caption: [Retorno a posición home.])
  )



= Integración con robot real y validación
El proceso de transferencia de un sistema desarrollado y probado en simulación a un entorno real, conocido como "sim to real", implica adaptar y validar el sistema para que funcione de manera efectiva en el mundo físico, enfrentándose a diversas dificultades y diferencias entre ambos entornos.
Ante esto, ha sido necesario recrear el entorno simulado en la realidad y, posteriormente, aplicar técnicas de calibración y adaptación para el funcionamiento completo del sistema. 

== Montaje robot físico
El montaje del robot físico Braccio Tinkerkit se ha realizado siguiendo las instrucciones proporcionadas por el fabricante @braccio. El proceso ha implicado el ensamblaje de las diferentes partes del robot, incluyendo la base, los eslabones y las articulaciones, así como la instalación de los servomotores y la electrónica necesaria para su control. Durante el mismo, se ha seguido un tutorial en vídeo disponible en Youtube que facilita la comprensión del proceso. 

\ Sin embargo, al tratarse de un robot de bajo presupuesto, se han detectado ciertas limitaciones en cuanto a la precisión y robustez del sistema.
Las principales limitaciones recaen sobre la calidad del material empleado en la fabricación de las piezas, siendo principalmente plástico, el cual, al estar conectadas dichas piezas mediante tornillos metálicos, puede experimentar deformaciones y holguras que afectan la precisión del robot. Como resultado, pese a que a primera vista no se noten desperfectos en la @fig-montaje, se han experimentado problemas con la adesión de los componentes plásticos en los ejes de los servomotores, que unido a la baja firmeza que ofrece la pinza, ha generado dificultades en la tarea de trayectoria y manipulación de objetos.

\ Para mitigar estos problemas, se han realizado ajustes y mejoras en el montaje, como el refuerzo de ciertas uniones con adhesivos y la sustitución de piezas defectuosas. Además, se ha llevado a cabo un mantenimiento regular del robot para asegurar su correcto funcionamiento y prolongar su vida útil.

#linebreak()
  #figure(col2(
    align(image("template/figures/montaje1.jpg", width: 65%), center), 
    align(image("template/figures/montaje2.jpg", width: 65%), center), 
  ), caption: [Imágenes finales del montaje del robot Braccio Tinkerkit, mostrando su estructura completa y una visión detallada de la estructura de la pinza.])<fig-montaje>

== Espacio de trabajo

El espacio de trabajo del robot se ha definido en función de las dimensiones del entorno físico y de los objetos a manipular. Se ha optado por un área de trabajo rectangular, delimitada por las posiciones alcanzables del efector final del robot, obtenidas además de forma experimental en la simulación. 
\ El entorno recreado consta de los siguientes elementos: 
- Superficie de trabajo rectangular: se ha construido una plataforma plana y estable donde el robot pueda interactuar cómodamente con los elementos. Esta misma tiene un tamaño aproximado de 90 cm x 70 cm y contiene una serie de líneas paralelas y perpendiculares de unos 10 cm de ancho, que facilitan la calibración visual y la localización de los objetos.
- Marcadores visuales: se han utilizado cubos de colores similares a los empleados en la simulación, con dimensiones aproximadas de 3cm. Estos elementos se han colocado de forma estratégica para barrer el área de trabajo y facilitar la calibración visual.
- Objetos a manipular: se han dispuesto varios vasos de colores en el área de trabajo, los cuales serán utilizados en las pruebas de manipulación. La elección de estos objetos se ha realizado teniendo en cuenta su tamaño, forma y peso, asegurando que su recolección y manipulación sean factibles. Adicionalmente, se ha estudiado la posibilidad de utilizar otros objetos, como pelotas de ping pong.
- Cámara cenital: se ha instalado un trípode unido a un teléfono móvil que simula la cámara cenital empleada en la simulación. Sin embargo, debido a las limitaciones del trípode y la cámara, la vista ofrecida no es completamente cenital. 

#linebreak()
#figure(align(image("template/figures/entorno.jpg", width: 63%), center), caption: [Imagen del entorno físico recreado para las pruebas del sistema, mostrando la superficie de trabajo con los marcadores visuales, los vasos y el manipulador en el centro del área de trabajo. Junto a éstos, se observa el trípode con el teléfono móvil simulando la cámara cenital.])

== Calibraciones y ajustes
Para asegurar un funcionamiento óptimo del sistema en el entorno real, se han llevado a cabo diversas calibraciones y ajustes, destacando las relacionadas con la visión.

\ El dispositivo móvil empleado como cámara cenital se ha instalado en un trípode, asegurando una posición estable y una vista adecuada del área de trabajo, intentando siempre obtener lo más cercano posible a una vista cenital.
La cámara se enlaza al sistema a través de una conexión Wi-Fi, permitiendo la transmisión de video en tiempo real mediante una aplicación específica, llamada Droidcam @droidcam.

\ Tras su instalación y configuración, se ha procedido a crear un script, _webcam_publisher.py_, encargado de publicar la imagen en el mismo nodo que lo hacía la simulación, permitiendo así un acceso directo al detector de objetos de la información del entorno real.

\ A continuación, se han modificado los umbrales de detección de objetos en el script, ajustando parámetros como el tamaño mínimo y máximo de los objetos a detectar, así como la colorimetría, pues en función de las condiciones de iluminación se ha observado que ciertos colores no son detectados correctamente.

\ Finalmente se ha procedido a la calibración de la cámara mediante homografía, siguiendo el mismo procedimiento explicado en la sección correspondiente. Para ello, se han colocado 4 cubos rojos en posiciones conocidas dentro del entorno real y se han capturado sus centroides en píxeles mediante el sistema de detección de objetos. Sin embargo, al no tratarse de una vista completamente cenital, ha resultado en valores muy imprecisos. La solución propuesta ha sido la adición de más marcadores visuales, logrando una precisión aceptable para las tareas de pick-and-place previstas.


#linebreak()
#figure(
  col2_1(
    table(
      columns: ( 0.5fr, 0.5fr),
      inset: 5pt,
      align: center,
      stroke: (x: 0.5pt, y: 0.75pt),
    [*Posición XY (m)*], [*Posición XY (px)*],
    [-0.325, -0.215], [115, 98], 
    [0.0,-0.215],     [297,107],
    [0.325, -0.215],     [497,113],
    [-0.2, -0.1],    [180,165],
    [0.2, -0.1],    [412,179],
    [-0.325, 0.0],    [106,222],
    [0.0, 0.0],    [288,233],
    [0.325, 0.0],    [489,246],
    [-0.2, 0.1],    [169,282],
    [0.2, 0.1],   [406,301],
    [-0.325, 0.215],    [97,344],
    [0.0, 0.215],    [279,361],
    [0.325, 0.215],   [461,381],
    ),
    align(image("template/figures/detect.png", width: 105%), center)
  ),
  caption: [Posiciones de los marcadores en el escenario creado y sus centroides capturados por la cámara del móvil en píxeles, junto con la detección de los marcadores en el entorno real. Tal como se observa, los píxeles de la tabla y la imagen coinciden, al igual que las posiciones en metros. Sin embargo, estas últimas están señaladas en el cartón con bolígrafo, por lo que no se llegan a distinguir perfectamente en la imagen.]
)


\ Respecto a la calibración del brazo robótico, no ha sido necesario adaptar su configuración, puesto que el sistema de nodos, publicaciones y subscripciones se mantiene idéntico al de la simulación, permitiendo el movimiento del robot sin necesidad de ajustes adicionales.

== Validación del sistema

La validación del sistema se ha llevado a cabo mediante una serie de pruebas diseñadas para evaluar su desempeño en el entorno real. Estas pruebas han incluido la detección y manipulación de objetos en diferentes condiciones, así como la evaluación de la precisión.

=== Visión
Respecto al apartado de la visión se ha observado que, pese a los ajustes realizados, la detección de objetos sigue siendo un desafío debido a las variaciones en la iluminación, siendo el sistema capaz de discernir entre un vaso rojo y uno verde, pero mostrando dificultades en la detección de los tonos de rojo, provocadas por ejemplo por la sombra que proyecta el trípode en éstos. Adicionalmente, cabe destacar la dificultad para la obtención de los parámetros de la cámara debido a la imposibilidad de acceder a ellos en el dispositivo móvil.


#linebreak()
  #figure(col2(
    align(image("template/figures/chupito.png", width: 100%), center), 
    align(image("template/figures/vasos.jpg", width: 97%), center), 
  ), caption: [Imágenes de los vasos de chupito empleados en las pruebas de manipulación, mostrando la variedad de colores y la dificultad que presenta el sistema de visión para su detección. Durante la detección se puede observar los problemas causados por la perspectiva de la cámara y las variaciones en la iluminación, que afectan a la precisión del sistema para calcular el centroide y clasificar los objetos presentes.])



=== Localización
Enlazado con lo anterior, en cuanto a la localización de los objetos, el sistema ha mostrado un rendimiento aceptable, siendo capaz de identificar la posición de los vasos de chupito en el espacio tridimensional de forma relativamente precisa. Sin embargo, se han observado algunos errores de localización, causados por la propia imprecisión al crear la superficie de trabajo o la colocación manual de los marcadores de referencia.

#linebreak()
#figure(image("template/figures/hom_real.png", width: 85%), caption: [Lectura del terminal de Ubuntu. Representa el cálculo de la homografía en el entorno real, mostrando los puntos en píxeles y metros de un objeto seleccionado al azar, junto con la matriz de homografía obtenida y el error de reproyección final, superior al obtenido en simulación pero aún aceptable para las tareas previstas.])


=== Trayectoria
En lo que respecta a la trayectoria, el sistema ha encontrado limitaciones causados por los errores físicos producidos durante el montaje, unido a los errores explicados en las secciones anteriores. Como resultado, se han observado desviaciones en la trayectoria planificada, obteniendo un rendimiento más favorable cuando el control ha sido realizado mediante el mando a distancia.

  #figure(col2(
    align(image("template/figures/pos1.jpg", width: 65%), center), 
    align(image("template/figures/pos2.jpg", width: 65%), center), 
  ), caption: [Imágenes del robot Braccio Tinkerkit en diferentes posiciones alcanzadas durante las pruebas de recolección en el entorno real, mostrando la capacidad del sistema para posicionarse y recoger objetos en el espacio de trabajo.]) <fig-trayectoria>


=== Manipulación
En cuanto a la manipulación de objetos, el sistema ha demostrado ser efectivo en la recolección y colocación de los vasos ubicados en el entorno. La garra permite una sujección mucho más firme de lo esperado, unido a la estructura ligera y compacta del recipiente de plástico, conformando un proceso de recolección ágil y eficiente.
Sin embargo, se han identificado algunas limitaciones en la precisión del agarre, causadas por la pobre amplitud de la garra cuando se encuentra abierta, siendo realmente tedioso recoger objetos de tamaño mediano. 
\ En la @fig-manipulación se pueden observar las habilidades de la garra para recoger uno de los vasos detectado anteriormente, mostrando también solvencia para manipular objetos redondos como las pelotas de ping pong mostradas en la @fig-trayectoria, siempre y cuando se encuentren éstas en una superficie plana.

  #figure(align(image("template/figures/coge_chupito.jpg", width: 35%), center), caption: [Imagen del robot Braccio Tinkerkit recogiendo un vaso de chupito en el entorno real, demostrando la capacidad del sistema para realizar tareas de agarre de objetos con éxito.]) <fig-manipulación>


= Conclusiones y trabajos futuros

Este Trabajo de Fin de Grado se propuso bajo la finalidad de diseñar, simular y validar un sistema robótico de pick-and-place para el manipulador de bajo presupuesto Braccio Tinkerkit, utilizando el framework ROS 2. El propósito era claro y directo: crear una plataforma funcional y modular para la experimentación, que facilitara la adaptación al mundo real y, al mismo tiempo, adquirir competencias avanzadas en herramientas estándar de la industria robótica, como pueden ser ROS 2, Gazebo o GitHub.

#linebreak()
La contribución principal de este proyecto ha sido la integración de múltiples subsistemas en un flujo de trabajo coherente, desde la simulación a la validación real. Durante este proceso, se han desarrollado paquetes específicos como _braccio_vision_, dedicado a la percepción por computador y el cálculo de la cinemática, _braccio_gamepad_teleop_ para el control manual o _sim-to-real_ para la adaptación al mundo real; demostrando la extensibilidad de la arquitectura base. 

\ La metodología de percepción, que combina la detección de objetos por color con una calibración por homografía, proporcionó la precisión necesaria para la localización de objetos en el espacio de trabajo, tal como se valida el bajo error de reproyección obtenido en el test de la @fig-test-hom. Esta metodología, enlazada con las técnicas del cálculo de la cinemática inversa y la planificación de trayectorias mediante MoveIt2, permitió la ejecución autónoma de tareas de manipulación en el entorno simulado, como se observa en la @fig-demo y posteriores.

#linebreak()
Uno de los desafíos técnicos más relevantes fue el cálculo de la cinemática inversa, que requirió la implementación de algoritmos específicos para determinar las posiciones articulares necesarias para alcanzar un objetivo en el espacio tridimensional. Esto implicó un profundo entendimiento de la geometría del manipulador y la capacidad de modelar su comportamiento de manera precisa, pues durante largos días se experimentó con diferentes enfoques, logrando incluso que la orientación fuera la correcta pero las posiciones articulares no coincidieran, como se muestra en la @fig-fail. Asimismo, superar el obstáculo y verificar la falta de un plugin nativo de agarre en ROS 2 derivó en un cambio anímico significativo, pasando de la satisfacción inicial a una notable frustración. Agradecer finalmente a la herramienta _libgazebo_link_attacher_@linkattacher, que junto con el desarrollo de una lógica de detección de proximidad, se consiguió gestionar dinámicamente la unión y separación de objetos, y solventar así la gran mayoría de problemas encontrados.

#figure(image("template/figures/fail.png", width: 41%), caption: [Error durante la colocación del brazo robótico para la recolección del cubo verde. En esta imagen se puede observar la discrepancia entre la posición del cubo y la del brazo, compartiendo orientación pero no ubicación del efector final.])<fig-fail>


#linebreak()
A nivel personal, este proyecto ha consolidado mi formación como ingeniero, forzándome a superar la curva de aprendizaje de ROS 2 y a afrontar la brecha entre la simulación ideal y las complejidades del hardware real, como las holguras mecánicas, la variabilidad del entorno y la precisión de los sensores.

\ En simulación, el sistema demostró ser robusto, completando ciclos de manipulación de forma autónoma. Sin embargo, la transferencia al robot físico evidenció las limitaciones de un hardware educativo: la baja rigidez de los componentes plásticos y la precisión de los servomotores introducen desviaciones que no se observan en el modelo ideal. De igual forma, el sistema de visión es sensible a cambios de iluminación, lo que exige un entorno controlado donde, adicionalmente, se añade un error humano debido a la imposibilidad de controlar todas las variables que influyen.

#linebreak()
Como línea de trabajo futuro, se ha mejorado consideradamente la base ofrecida por Jaume Mulet @repo, implementando una estructura mucho más compleja y modular. Por ello, se proponen varias extensiones que pueden dar un salto de calidad al proyecto:

\ En primer lugar destacaría la implementación de un sistema de detección de objetos mucho más robusto, basado en aprendizaje profundo, que permita la identificación de objetos en condiciones de iluminación variables y con mayor precisión. Esto podría lograrse mediante el entrenamiento de un modelo de red neuronal convolucional utilizando un conjunto de datos adecuado, ya sea entrenado previamente como Yolo, o bien un modelo personalizado adaptado a las necesidades específicas del entorno de trabajo.

\ En segundo lugar, se podría explorar la integración de sensores adicionales, como cámaras RGB-D, cuyos parámetros intrínsecos se podrían calibrar de manera más precisa. Esta mejora permitiría diseñar un espacio de trabajo más profesional, donde la luz sea proveniente de diferentes focos, minimizando las sombras y reflejos; donde el trípode sea mucho más regulable y estable.

\ Por último, se podría investigar la implementación de técnicas de aprendizaje por refuerzo para mejorar la planificación de trayectorias y la toma de decisiones en entornos dinámicos, donde existan multitud de obstáculos. Este caso se podría incluso extrapolar a un sistema mayor, como una línea de producción, donde existan varios robots y cintas transportadoras encargadas de la manipulación de objetos.


\ En definitiva, este TFG no solo ha producido un sistema funcional, sino que ha generado una plataforma de código abierto, documentada y modular. Todo el trabajo desarrollado se encuentra disponible en mi repositorio @my_repo, donde se incluyen instrucciones detalladas para su ejecución y vídeos que reflejan el funcionamiento del mismo. Se espera que éste pueda servir como una valiosa herramienta educativa para futuros estudiantes que deseen iniciarse en la robótica avanzada y para quienes quieran tomar las riendas de este proyecto, aplicando las implementaciones propuestas.












  

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
  #bibliography("referencias.bib")
  #pagebreak(to: "odd")
  // Recordar usar la función bibliography para la bibliografía.
  // Para mantener la lista de referencias se puede usar software como Mendeley.
  // #bibliography("referencias.bib")
]


