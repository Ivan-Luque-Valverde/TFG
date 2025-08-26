#import "template/lib.typ": tfg_etsi_us_template, pre-content, main-content, post-content, index,first-letter
#let col2 = grid.with(columns: (0.5fr, 0.5fr), gutter: 5pt)
#set text(font: ("Times New Roman"))

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
  #lorem(100)
  #pagebreak(to: "odd")


  = Abstract
  #lorem(100)
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

Sin embargo, aporta ventajas claras como su arquitectura descentralizada, un mejor soporte para requisitos de fiabilidad y tiempo real, integración con MoveIt2 y un ecosistema creciente orientado a la robótica profesional y de investigación.




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
No obstante, para el proyecto actual, se ha optado por la combinación de Gazebo, MoveIt2 y RViz2, dada su integración nativa y comodidad, dejando la puerta abierta a Foxglove para futuras iteraciones.

/* Crear diagrama ROS2, Moveit y Gazebo */


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

  #figure(image("template/figures/Sim_base.png", width: 80%), caption: [Ilustración de la simulación en RViz y Gazebo del robot manipulador realizando una trayectoria. En la pantalla izquierda, se puede observar el brazo en sus posiciones inicial, actual y final. A su derecha, la representación de Gazebo mostrando esa posición actual junto al entorno simulado.]) 


#pagebreak()

El repositorio está diseñado para funcionar con dos modos, seleccionables en el lanzamiento del sistema:
- Simulación: Utiliza Gazebo para crear un entorno virtual con el robot Braccio. Esto permite probar la lógica de control y la planificación de movimientos sin necesidad del hardware físico. Se activa con el argumento "sim:=true".
- Hardware Real: Se comunica directamente con el robot Braccio a través de una conexión serie con una placa Arduino. El paquete _braccio_hardware_ gestiona esta comunicación, mediante el argumento "sim:=false". Adicionalmente incluye una opción para probar la comunicación con el hardware, mediante "hw_test:=true".



== Extensiones y mejoras implementadas
  El repositorio original ha sido modificado y ampliado para incluir las nuevas funcionalidades que permitan lograr los objetivos propuestos, mejorar la experiencia de usuario y mantener esa modularidad característica, reflejando ese trabajo en el siguiente repositorio @my_repo. 

  Se han añadido dos nuevos paquetes principales:

+ Braccio_gamepad_teleop: Permite el control del robot mediante un mando conectado mediante el puerto serie. Se ha implementado el mapeo de los botones y joysticks del mando a comandos específicos para mover las articulaciones del robot, tanto en simulación como en el hardware real, utilizando un mando de PlayStation 4 para las pruebas.


+ Braccio_vision: Incluye los nodos y scripts necesarios para tareas de visión por computadora y control. En éste se abordan aspectos como la detección de objetos, calibración de cámaras y aplicaciones de "pick and place".
#linebreak()
Estas implementaciones se tratarán en detalle en las siguientes secciones, explicando su diseño, integración con el sistema y los beneficios que aportan al proyecto global.


= Entorno de simulación

== Creación del mundo
El entorno donde el robot opera se define en el archivo _braccio.world_, ubicado en la carpeta _gazebo_ de _braccio_description_. Este archivo actúa como el escenario virtual en el que el robot Braccio interactúa con otros objetos y el entorno. Su función es establecer todo lo que existe en el mundo antes de que el manipulador aparezca.

En el siguiente se especifican varios elementos clave:
- Define la gravedad del mundo, estableciendo el terreno y la luminosidad del mismo a través de un modelo de sol. 
- Incluye dos modelos estáticos de forma hexagonal de colores verde y azul, como superficies para el depósito de los objetos.
- Registra los plugins _gazebo_ros_state_ y _gazebo_link_attacher_,  necesarios para la obtención de la posición de cada objeto en tiempo real y para la simulación del agarre de los objetos, respectivamente.

== Robot manipulador 

El robot manipulador Braccio se describe principalmente en la carpeta _braccio_description_ comentada previamente. En el interior de la misma se encuentra una carpeta llamada _urdf_, que contiene el archivo _braccio.urdf.xacro_, entre otros. Éste es el archivo de configuración principal y se nutre del resto de archivos, donde se definen las diferentes partes del robot, como los enlaces y las articulaciones, así como sus propiedades físicas y visuales. 
\
\
Adicionalmente, se encuentra _braccio.ros2_control.xacro_, quién apunta a _braccio_controllers.yml_, donde se especifican los controladores PID para cada articulación del robot, así como la configuración de los actuadores y sensores. 

#linebreak()

#figure(
  col2(
    align(image("template/figures/Rob_frontal.png", width: 100%), center),
    align(image("template/figures/Rob_lateral.png", width: 100%), center)
  ),
  caption: [Representación del robot Braccio Tinkerkit en Gazebo, mostrando dos perspectivas diferentes del manipulador.]
)

== Spawner de Cámara y Cubos
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


= Control mediante PS4 controller
El sistema actual propone la implementación de un sistema de control basado en la retroalimentación visual, utilizando la cámara simulada para ajustar dinámicamente los comandos de movimiento del robot.
Sin embargo, previa a ésta, se ha optado por un sistema de control manual mediante un mando de PS4, con el objetivo de familiarizarse con el entorno y realizar las pruebas pertinentes que verifiquen el correcto funcionamiento del mismo. 
En la carpeta _braccio_gamepad_teleop_ se encuentra el nodo principal encargado de esta tarea, _gamepad_teleop.py_, y un launch que arranca el sistema.

 == Arquitectura y filosofía de control
Para la realización de este sistema de teleoperación se ha optado por una filosofía basada en el control incremental directo en el espacio de articulación. Este sistema implica dos acciones fundamentales:
\
\
+ Los joysticks no controlan el movimiento de la pinza en un eje XYZ, sino que controlan directamente la velocidad de rotación de las articulaciones individuales del robot. En @joystick, se explica la diferencia entre utilizar este control directo (JointJog), frente al uso de un sistema basado en la cinemática inversa (TwistStamped).

+ El nodo mantiene una variable interna, _self.current_joint_positions_, que almacena la posición objetivo actual de cada articulación. De este modo, cada vez que se mueve el joystick, el nodo no establece una posición fija, sino que añade o resta un pequeño incremento a la posición actual, permitiendo un movimiento del robot mucho más fluido y suave.
\
De este modo, la arquitectura del sistema es muy sencilla, teniendo un único nodo encargado de:
+ Recibir los datos crudos del gamepad.
+ Interpretar los movimientos de los joysticks y los botones.
+ Mantener un registro del estado de las articulaciones del robot.
+ Calcular los nuevos comandos de posición para cada articulación.
+ Gestionar la lógica de "pick and place" interactuando con los servicios de Gazebo.
+ Publicar los comandos directamente a los controladores del robot.

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
- Círculo: realiza la acción de "pick", intentando agarrar el objeto más cercano.
- Cruz: realiza la acción de "place", intentando soltar el objeto agarrado.
 \ \
Asimismo, se ha configurado una variable global, llamada _velocity_factor_, que permite ajustar la velocidad de movimiento del robot, afectando a la suavidad y sensibilidad de los movimientos.

#figure(
  align(image("template/figures/mando.png", width: 100%), center),
  caption: [Diagrama del mando de PS4 con el mapeo de los botones y joysticks a las articulaciones y acciones del robot mencionadas previamente.]
) <fig-mapeo>

== Flujo de datos y control
Tal como se ha comentado previamente, esta implementación prioriza la sencillez y respuesta inmediata. De este modo, a continuación se detalla el flujo de datos con el fin de comprender adecuadamente su funcionamiento: 
+ El launch arranca el nodo _joy_node_ @joy_linux, encargado de la publicación de datos en crudo del gamepad en _/joy_ y _gamepad_teleop.py_ se suscribe a este tópico.
+ El nodo principal:
  - Recibe los datos del gamepad a través del tópico, la lista de modelos en simulación de _/gazebo/model_states_ y obtiene de las TF la posición del gripper para calcular posteriormente su proximidad a los objetos.
  - Calcula y publica los comandos para los 5 joints del brazo y el gripper en los tópicos correspondientes. Sin embargo, previo a ello, verifica que ninguna de las posiciones objetivo calculadas exceda los límites definidos para cada articulación.
  - Conecta con los servicios de Gazebo para la lógica de "pick and place", llamando a los servicios de _attach_ y _detach_ del plugin _gazebo_link_attacher_. Éstos:
    - Detectan el objeto más cercano utilizando la información de los sensores y la posición del gripper.
    - Comprueban que la distancia entre el gripper y el objeto es adecuada, inferior a 15 cm.
    - Si ambas condiciones se cumplen, envía la petición de _attach/detach_ al servicio correspondiente.
+ El sistema _ros2_control_ recibe estas trayectorias y las ejecuta en el robot.

/* Insertar imagen funcionamiento en Gazebo o real life, con terminal y sim */
/* Insertar referencias de paginas sobre gamepad */

#linebreak()
Este control proporciona una vía rápida y segura para validar la arquitectura de control, probar el mapeo de ejes y calibrar parámetros como el velocity_factor antes de automatizar. 
Es una herramienta útil para detectar límites de articulación, comprobar la comunicación con Gazebo/ros2_control y afinar la experiencia de teleoperación, previa a la implementación 
de un sistema de control basado en visión del manipulador real.


= Percepción y localización de objetivos
  Sensores habituales: cámaras RGB, RGB‑D y marcadores fiduciales. Técnicas: detección y segmentación de objetos (OpenCV, redes CNN), estimación de pose 6‑DoF, uso de PCL para nubes de puntos. Conjuntos de datos y benchmarks (YCB, etc.).
  == Detección de objetos

  == Matriz de transformación y calibración

  == Matriz de homografía

= Planificación de agarre y manipulación
  Algoritmos y herramientas: OMPL, MoveIt2 para planificación de trayectorias; GraspIt!, Dex‑Net y enfoques basados en aprendizaje para planificación de agarres. Métricas de calidad del agarre y problemas prácticos (contactos, incertidumbre en fricción).
  == Cinemática directa e inversa
  == Repositorio atach/detach


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
  #pagebreak(to: "odd")
  // Recordar usar la función bibliography para la bibliografía.
  // Para mantener la lista de referencias se puede usar software como Mendeley.
  // #bibliography("referencias.bib")
]


