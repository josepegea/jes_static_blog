---
title: 'Josep Egea - CV'
has_comments: false
created_at: '2015-09-19'
canonical_identifier: '/other/jes-cv-it'
language: es
---

<%= md_begin_block('div', :class => 'cv') %>

# Josep Egea - CV

<%= md_begin_block('div', :class => 'abstract') %>

* **Programador Web Full-Stack Freelance** con amplia experiencia en **Ruby on Rails** y otras tecnologías Web.
* Con sede en Madrid, disponible para trabajo **en remoto** a nivel **mundial**.   

<%= md_end_block %>

## Formación Universitaria

* Diplomado en Informática (Especialidad Gestión), Universitat Politècnica de Catalunya (UPC) 1994.

## Especialidades

### Desarrollador de Aplicaciones Web

* **Ruby** (versionds 1.8.x - 2.5.x) y **Ruby on Rails** (versionds 1.x - 5.x).
* **SQL**: **PostgreSQL** y **MySQL** incluyendo **Percona**
* **Redis**, **Sidekiq**
* Conexión con servicios cloud de **Amazon** ( **S3**, **EC2**, ...), **Google** (**Big Query**, **Storage**, ...) y otros.
* **RAML** para documentación de APIs.
* **HTML5**, **CSS3**, **SASS** y **Twitter Bootstrap**.
* **Javascript**, **TypeScript** y **CoffeScript**. Uso de **Node**, **NPM**, **Webpack** y herramientas relacionadas.
* **Angular 4**, **jQuery** y otras librerías JS, como **LeafletJS**, **OpenLayers** entre otras.
* Testing en Ruby: **RSpec**, **Capybara**
* Ruby Gems: **Devise**, **Simple Form**, **Formtastic**, **ActiveModelSerializer**, **ActiveAdmin**, **HAML**, **RMagick**, **Globalize**, **PaperTrail**, **Nokogiri**, **Prawn** (Generación de PDF) y multitud de otras.
* Sedes web estáticas utilizando **Nanoc**.

### Herramientas y Metodologías de Desarrollo

* Gestión de Versiones con **Git** y **Subversion** usando **GitHub**, **BitBucket** y **GitLab**.
* **Metodologías Ágiles**: **SCRUM**, **Kanban** usando **Jira**, **Trello**, **Asana** entre otras herramientas.
* **TDD**.
* Habituado a trabajar en equipos geográficamente dispersos, usando **Slack**, **Skype**, **Hangouts**, **Zoom**, **Email** y otras herramientas de comunicación similares.

###  Operación y Administración

* **Apache**, **Phusion Passenger**, etc
* **Linux** (Ubuntu), Debian y **OpenSolaris**.
* Servidores en UNIX como **Postfix** (SMTP), **Dovecot** (IMAP) y otros.
* Servicios Cloud de **AWS**, **GCP**, **Joyent**, **Digital Ocean** y servidores virtuales privados.
* Conocimientos básicos de virtualización y contenedores: **Vagrant**, **Docker** y otros.
* Conocimientos básicos de herramientas de orquestación: **Ansible** y otras.

### Otros conocimientos

* Larga experiencia con **C**, **Objective-C** y **C++**.
* Trabajando con metodologías **Orientadas a Objetos** desde los 90, tanto en diseño como en programación.
* Larga experiencia con **Cocoa** y los frameworks que le precedieron (**OpenStep** y **NeXTstep**).
* Entorno de programación y herramientas **UNIX** , incluyendo **Lex**, **Yacc** y derivados.
* Usuario de **EMACS**.
* Conocimientos básicos de las tecnologías y herramientas de la **Web Semántica**: RDF, OWL, SPARQL y otras.


## Experiencia principal

### ***2015 - Actualidad*** Desarrollador de Software Freelance

#### [Platform161 - https://www.platform161.com](https://www.platform161.com)
**Senior Full-Stack Software Developer**, trabajando en el desarrollo y mantenimiento de una aplicación web multi-instancia, con 2 APIs completos y una nueva aplicación Angular 4 que se conecta a dichos API. Integrado en un equipo de alrededor de 15 desarrolladores de todo el mundo, y usando herramientas como Percona MySQL, Google Big Query entre otras, el sistema gestiona varios TBs de datos, dando servicio a cientos de compañías en todo el mundo.

#### [Human Benefits - http://www.humanbenefits.com](http://www.humanbenefits.com)
**Senior Full-Stack Software Developer**. Tras unirme al proyecto unos meses después de su puesta en marcha, trabajé en el desarrollo de una nueva aplicación web para la gestión de beneficios para empleados y RRHH, usando Ruby on Rails, PostgreSQL y herramientas externas como HelloSign (para la gestión de firmas). Junto a una diseñadora UI/UX, construimos una prueba de concepto para ser usada en la fase de captación de capital del proyecto.

#### [Kolau - https://www.kolau.com](https://www.kolau.com)
**Consultor Ruby on Rails** y asesor para la arquitectura de una nueva aplicación, incluyendo el diseño de BBDD, la organización de código y la estructura de la aplicación.

### *Evadium.com **2005 - 2015*** Co-Fundador y Responsable Técnico

Fundé la compañía junto a mi socio, con recursos propios, haciéndola crecer hasta convertirla en una agencia de viajes online especializada en escapadas temáticas y viajes cortos por España.

Además de co-dirigir el negocio, me encargué de diseñar, construir, poner en marcha y gestionar toda la infraestructura IT, incluyendo la web pública, el motor de reservas y varias aplicaciones asociadas para gestionar los procesos de negocio y la relación con clientes y proveedores.

**Herramientas principales**: Ruby 1.8.7, Rails 1.1.6, PostgreSQL 9.1, PrototypeJS, LeafletJS y OpenLayers (integración de mapas), Prawn (generación de PDF desde Ruby), Bluff (gráficos en JS), OAT (Tablas dinámicas en JS), Git y Subversion. 

Alojado en Joyent Public Cloud y CloudFlare. Integración con Mandrill (envío de email) y varias pasarelas de pago.

**Web pública**: [http://www.evadium.com](http://www.evadium.com)

### *Madrid-rb **2015*** Migración de datos para la web del grupo

Como parte de la migración de sede web del grupo de usuarios de Ruby de Madrid ([Madrid-rb](http://www.madridrb.com)), desarrollé, junto con otros miembros del grupo, un conjunto de scripts Ruby para capturar los datos existentes, distribuidos entre varios servidores, y exportar los resultados en formato JSON para ser importados en la plataforma del nuevo servidor.

Las webs anteriores estaban alojadas en diversas plataformas (GitHub, Jottit) y usaban varias plantillas heterogéneas, con lo que el importador tuvo que adaptarse a los distintos formatos para generar un resultado final coherente.

**Herramientas principales**: Ruby 1.9.3, Nokogiri, JSON.

**Código**: [https://github.com/josep-egea/elijah_dump](https://github.com/josep-egea/elijah_dump)

### *Pixel44.com **2013-2014*** Análisis de viabilidad y Prototipo de un Servicio Web para Publicación de Fotos

Como parte del análisis de viabilidad para un proyecto paralelo, desarrollé el prototipo de un servicio web para mostrar obra fotográfica, incluyendo galerías de distintos fotógrafos, perfiles de los mismos y varias herramientas para la comercialización de las fotografías, incluyendo la venta de copias impresas y licencias de uso, con más posibilidades previstas para el futuro.

Por desgracias, el análisis más detallado mostró que la viabilidad de negocio no era lo suficientemente atractiva, con lo que dejé el proyecto en suspenso, para dedicar los esfuerzos a otras opciones.

El prototipo consistía en una aplicación Ruby on Rails 3.2 que incluía módulos para la gestión de fotografías, su catalogación, redimensionado, generación de miniaturas, etc, así como para la gestión del contenido de la web, los perfiles de fotógrafos, etc.

**Herramientas principales**: Ruby 1.9.3, Rails 3.2, PostgreSQL 9.1, ImageMagic, RMagick, Devise, ActiveAdmin, Globalize, Bootstrap 3, SASS, Liquid (plantillas), jQuery y jQuery Panzoom.


### *Penteo ICT Analyst **2000-2007*** Analista, Consultor y Director

Penteo es un Analista TIC independiente, que ayuda a los responsables de Departamentos de Sistemas de compañías medianas y grandes a optimizar el uso de las TIC en los procesos de negocio de la empresa. Sus servicios incluyen el análisis de mercado, el benchmarking, formación específica para el equipo TIC y consultoría y análisis para proyectos específicos.

Después de unos meses colaborando con la empresa como analista asociado, especializado en el ámbito del desarrollo de software y las tendencias TIC, pasé a formar parte del equipo en 2000, para responsabilizarme del área de Análisis a medida.

Durante 7 años desarrollé distintas funciones en las áreas de análisis, investigación y desarrollo comercial, trabajando en distintos aspectos de las TIC, como la gestión del Outsourcing, la implantación de software ERP, la reorganización de Departamentos TIC o la optimización de equipos de desarrollo, entre otros.

### *Nexus Servicios de Información **1993-2000*** Programador, Responsable de Proyectos y Director Técnico

En aquellos años, Nexus era un proveedor de acceso a Internet y comunicaciones que también desarrollaba software a medida para el sector industrial, usando NeXTstep. Tras haber cursado la formación como desarrollador certificado NeXT en 1992, entré a trabajar para Nexus como parte del pequeño equipo de desarrollo. Tras varios meses, pasé a ser responsable de proyectos, llegando posteriormente a la dirección técnica de la compañía.

En Nexus utilizamos NeXTstep / OpenStep (primero) y MacOS X (después) para desarrollar las aplicaciones de negocio de dos compañías: una azulejera y una productora de barnices y pinturas. Cubriendo todas las áreas de negocio, desde la producción hasta la comercialización (incluyendo el comercio exterior), estas aplicaciones se escribieron en Objective-C usando los frameworks de NeXT/Apple (DBKit, Enterprise Objects Framework, Cocoa) así como servidores SQL de Sybase y Oracle. 

En Nexus también desarrollamos aplicaciones para la web y el comercio electrónico, usando un conjunto de herramientas propio, construido sobre la tecnología NeXT. Incluía un lenguaje de scripting de diseño propio que podía ser incorporado a las páginas HTML, del mismo modo en que PHP o las plantillas ERB, a la vez que se integraba con servidores específicos que gestionaban la conectividad SQL, las sesiones, etc. Utilizando estas herramientas construimos distintas sedes web, incluyendo DiscoWeb.com, una de las primeras tiendas de discos online en España, y la web corporativa de Smint.

**Herramientas principales**: NeXTstep, OpenStep, Mac OS X, Cocoa, Objective-C, entorno UNIX, Lexx & Yacc, Sybase SQL Server, Oracle, CVS, UML.

### *Disseny i Gestió Informàtica, s.l. **1990-1993*** Cofundador y Programador

Durante mis estudios universitarios, y juntamente con otros dos compañeros de carrera, fundamos Disseny i Gestió Informàtica, s.l., una empresa de desarrollo de software a medida para PYMEs.

Nuestro trabajo se centraba en el desarrollo de aplicaciones de contabilidad, facturación, gestión de producción, etc, utilizando DOS y Turbo Pascal 5.5, así como herramientas complementarias como Btrieve, que después evolucionaría a C/C++, Delphi y Windows.

### ***1990-2000*** Escritor y Traductor para Publicaciones TIC

Durante varios años trabajé con múltiples publicaciones técnicas traduciendo contenido en inglés de sus centrales en EEUU y Reino Unido, adaptándolo para las ediciones en español.

Más adelante, pasé también a escribir contenido propio, centrado en el ámbito de los sistemas operativos (y Linux en particular), el desarrollo de software, nuevas herramientas, etc.

Mis artículos fueron publicados en las ediciones españolas de varias revistas, incluyendo **Byte**, **Datamation**, **PCPlus** y otras. Además, también escribí artículos sobre TIC en la prensa generalista, como **El Periódico de Catalunya**.

<%= md_end_block %>
