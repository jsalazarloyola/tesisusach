\NeedsTeXFormat{LaTeX2e}

% Estilo para tesis siguiendo norma Usach
% Agradecimiento por aportes a:
% Emir Muñoz (código original)
% Rodrigo Campos
% Hugo Meneses
% Víctor Flores
\ProvidesClass{tesisusach}[2020/06/09 v1.4 Estilo para tesis (Javier Salazar Loyola)]

\newif\ifdosguias\dosguiasfalse
\newif\iflogo\logofalse
\newif\ifpropuesta\propuestafalse

% Parámetros por defecto
\PassOptionsToClass{10pt,twoside,letterpaper}{book}

% Opción para el caso de tener dos profesores guías
\DeclareOption{dosguias}{\dosguiastrue}
% Opción para incluir el logo desde una ubicación particular
% (habilita el comando \logo)
\DeclareOption{logo}{\logotrue}
\DeclareOption{nologo}{\logofalse}
% Opción para incluir la propuesta en la portada
\DeclareOption{propuesta}{\propuestatrue}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax

%SI SE UTILIZA LETRA ARIAL, CAMBIAR ESTO
\renewcommand{\rmdefault}{phv} % Arial
\renewcommand{\sfdefault}{phv} % Arial

%%   Modificado desde `book.cls'.
%%
%%   Modificado para que 
%%   1) El default sea `oneside,10pt'
%%   2) Los nombres de secciones aparezcan en castellano
%%   3) La fecha aparezca en castellano
%%   4) Bibliografia aparezca bien acentuada en heading
%%   5) Los headings contengan el numero de pagina y capitulo.
%%   6) Los margenes sean: Superior = 4cm, Inferior = 2.5cm, Izquierdo = 4cm, Derecho = 2,5cm.
%%   7) El argumento opcional de \chapter vaya a Indice.
%%   8) Las Referencias aparezcan en Indice.
%%   9) Indice General -> Indice
%%   
%Load book using normal font size to 10pt
\LoadClass{book}
%Cambiar oneside o twoside si se desea impresión por ambos lados

%% Cambio el interlineado a 1.5:
%\linespread{1.5}
\renewcommand{\baselinestretch}{1.5}

%%Hago que la mancha de página deje todo alineado hacia arriba
\raggedbottom

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% tesis.cls %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%--------Margenes segun reglamento: izq=4cm y inf=der=sup=2.5cm
\RequirePackage[headheight=25.1pt, letterpaper]{geometry}
% Márgenes en los bordes para tamaño carta
\geometry{top=2.5cm, bottom=2.5cm, left=4cm, right=2.5cm}
%--------Otros margenes
\setlength{\parindent}{2cm}%2cm Tabulación
\setlength{\headsep}{20pt} %20
\setlength{\voffset}{0.0cm}
\setlength{\hoffset}{0.0cm}
\setlength{\footskip}{20pt} %20

%--------Utilidades
\RequirePackage{calc}
\RequirePackage{etoolbox}

%--------Idioma
% Español y escribiendo "tabla", en vez de "cuadro"
\RequirePackage[spanish,es-tabla]{babel}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}

%--------Configuracion de header y footer
\RequirePackage{fancybox}
\RequirePackage{fancyhdr}

%--------Simbolos y fuentes
\RequirePackage{amstext}
\RequirePackage{amssymb}
\RequirePackage{amsfonts}
\RequirePackage{amsmath}
\RequirePackage{amsthm}

%-------Entornos
\RequirePackage{enumerate}

%-------Imagenes
\RequirePackage{graphicx}

%-------Referencias
\RequirePackage{hyperref}
% Paquete para colocar el link al inicio del flotante, en lugar de al final
\RequirePackage[all]{hypcap}

%--------Tablas
\RequirePackage{multirow} % Multiples filas en Tablas

%--------Apendice y tabla de contenidos
\RequirePackage{appendix}
\RequirePackage[nottoc,notlof,notlot]{tocbibind}
\RequirePackage{tocloft}

%Soporte para tablas con color
\RequirePackage[table,xcdraw]{xcolor}

\definecolor{gray97}{gray}{.97}
\definecolor{gray75}{gray}{.75}
\definecolor{gray45}{gray}{.45}

%--------Bibliografia
\RequirePackage[autostyle]{csquotes}
\RequirePackage[
    backend=biber,
    style=apa,
    natbib=true
]{biblatex}
\DeclareLanguageMapping{spanish}{spanish-apa}
\DefineBibliographyStrings{spanish}{
	bibliography={Referencias},
}

%Mostrar numeración en las subsecciones (subsubsecciones no llevan números)
\setcounter{secnumdepth}{2}
%Mostrar las subsubsecciones en el índice
\setcounter{tocdepth}{3}

%================================================================
% Notaciones Generales
%================================================================
\newcommand\ie{i.e.\@\xspace}
\newcommand\eg{e.g.\@\xspace}
\newcommand\cf{cf.\@\xspace}
%----------------------------------------------------------------

%================================================================
% Definición del estilo del header y footer
%================================================================
\fancyhf{}
\if@twoside
	% Numeración al lado derecho de la página en páginas del lado derecho
	% (ajustado para twoside)
	\fancyhead[LE,RO]{\textsl{\leftmark}}
	\fancyfoot[LE,RO]{\thepage}
\else
	\fancyhead[L]{\textsl{\leftmark}}
	\fancyfoot[R]{\thepage} 
\fi

%Hace que la primera página de cada capítulo no tenga el header por defecto y 
% que en el footer el N° de página no esté al centro
\fancypagestyle{plain}{%
    \fancyhf{} % clear all header and footer fields
    \if@twoside
        \fancyfoot[LE,RO]{\thepage}
    \else
        \fancyfoot[R]{\thepage} 
    \fi
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
}

\pagestyle{fancy}
% Páginas de cambio de capítulo en blanco completamente
% Sacado del manual de fancyhdr, revisado el 11 de junio del 2020 
% en http://ctan.dcc.uchile.cl/macros/latex/contrib/fancyhdr/fancyhdr.pdf
\renewcommand{\cleardoublepage}{
	\clearpage
	\if@twoside
		\ifodd\c@page
		\else
			\hbox{}\vspace*{\fill}
			\thispagestyle{empty}
			\newpage
			\if@twocolumn\hbox{}\newpage
			\fi
		\fi
	\fi
}

% Cambios al default de spanish
% Para desactivar el atajo ~N para la Ñ
\deactivatetilden
\decimalpoint
% Headings
\markboth{}{}

%--------Header de los capitulos
% by Emir
\RequirePackage[compact]{titlesec}
\titleformat{\chapter}
{\bfseries\Large\vspace*{-4.0cm}} %Formato título
{ % Contenido de la etiqueta
    \filright
    \Large\MakeUppercase\chaptertitlename\ \thechapter.\ 
} %Contenido de la etiqueta
{0pt} % espacio mínimo entre etiqueta y cuerpo
{\filright\MakeUppercase} %código que precede al cuerpo del título
[\vspace{1.5pt}] %1,5

\titleformat{\section}
{\bfseries\large\vspace{2pt}}
{\large\MakeUppercase\thesection\ \vspace{2pt} } % 3 espacios luego del titulo de una seccion
{0pt}
{\MakeUppercase}
[\vspace*{0.5cm}]

\titleformat{\subsection}
{\bfseries\normalsize\vspace{2pt}}
{\normalsize\thesubsection\ }
{0pt}
{\vspace*{0.5cm}}

\titleformat{\subsubsection}
{\itshape\normalsize\vspace{1.0cm}}
{\itshape\thesubsubsection\ }
{0pt}
{\vspace*{0.5cm}\itshape}

\titlespacing*{\chapter} {0pt}{85pt}{20pt} 
\titlespacing*{\section} {0pt}{6.5ex plus 1ex minus .2ex}{2.3ex plus .2ex}
\titlespacing*{\subsection} {0pt}{6.5ex plus 1ex minus .2ex}{2.3ex plus .2ex}
\titlespacing*{\subsubsection}{0pt}{3.25ex plus 1ex minus .2ex}{1.5ex plus .2ex}
\titlespacing*{\paragraph} {0pt}{3.25ex plus 1ex minus .2ex}{1em}
\titlespacing*{\subparagraph} {\parindent}{3.25ex plus 1ex minus .2ex}{1em}


%================================================================
% Apéndices, figuras y tablas
%================================================================
% Cambios de Javier.
% Idea original para esta configuración sacada de
% https://tex.stackexchange.com/questions/435684/how-to-include-appendix-names-in-toc
%---- Coloca "Apéndice X" en la tabla de contenidos
\newlength{\orgchapnumwidth}
\setlength{\orgchapnumwidth}{\cftchapnumwidth}
\g@addto@macro\appendix{
	\addtocontents{toc}{
		\setlength{\cftchapnumwidth}{\orgchapnumwidth}
		\addtolength{\protect\cftchapnumwidth}{\widthof{\appendixname\space}}
		\protect\renewcommand{\protect\cftchappresnum}{\appendixname\space}
	}
}

%---- Análogo a \appendix, pero para colocar anexos
% Los añade a la tabla de contenidos como "Anexo X"
\newcommand*{\annex}{
	\renewcommand{\appendixname}{Anexo}
	\setcounter{chapter}{0}
	\addtocontents{toc}{
		\setlength{\cftchapnumwidth}{\orgchapnumwidth}
		\addtolength{\protect\cftchapnumwidth}{\widthof{\appendixname\space}}
		\protect\renewcommand{\protect\cftchappresnum}{\appendixname\space}
	}
	
}

%Se agrega la palabra 'Figura' al índice de figuras
\renewcommand{\cftfigfont}{Figura }
%Lo mismo para el índice de tablas
\renewcommand{\cfttabfont}{Tabla }

%Se cambia el tamaño del título de la lista de figuras, tablas e índice de contenido dejándolos igual que los títulos normales
\renewcommand\cftloftitlefont{\Large\bfseries}
\renewcommand\cftlottitlefont{\Large\bfseries}
\renewcommand\cfttoctitlefont{\Large\bfseries}

%--------pagina en blanco
\newcommand{\paginaenblanco}{\newpage{\pagestyle{empty}\cleardoublepage\null}}

%================================================================
% Referenciaciones
%================================================================
%--------Referenciacion en la forma: 1-5
\newcommand{\rangeref}[2]{\ref{#1}--\ref{#2}}

%--------Abreviaciones
\newcommand{\Capt}[1]{Cap.\ \ref{#1}}
\newcommand{\Fig}[1]{Fig.\ \ref{#1}}
\newcommand{\Sec}[1]{Sec.\ \ref{#1}}

%================================================================
% Caratula y Portada
%================================================================
%- By Javier Salazar Loyola
% Configuraciones de la página de título
% Subtítulo
\gdef\@subtitle{}
\DeclareRobustCommand*{\subtitle}[1]{\gdef\@subtitle{#1}}

% Declara la universidad (debería ser la USACH, pero por si acaso
\gdef\@universidad{Universidad de Santiago de Chile}
\DeclareRobustCommand*{\universidad}[1]{\gdef\@universidad{#1}}
% Declara facultad.
\DeclareRobustCommand*{\facultad}[1]{\gdef\@facultad{#1}}
% Declara la unidad. Si es más de una, deberían ser separadas con salto 
% de línea (\\).
\DeclareRobustCommand*{\unidad}[1]{\gdef\@unidad{#1}}
% Nombre del profesor guía
\DeclareRobustCommand*{\profesor}[1]{\gdef\@profesor{#1}}
\DeclareRobustCommand*{\profesorco}[1]{\gdef\@profesorco{#1}}
% Ciudad
\DeclareRobustCommand*{\ciudad}[1]{\gdef\@ciudad{#1}}
% País
\DeclareRobustCommand*{\pais}[1]{\gdef\@pais{#1}}
% La propuesta
\gdef\@propuesta{}
\DeclareRobustCommand*{\propuesta}[1]{\gdef\@propuesta{#1}}
% Si se pide logo diferente, se da el comando.
% TODO: mejorar esto.
\iflogo
\DeclareRobustCommand{\logo}[1]{\gdef\@logo{#1}}
\fi

\renewcommand{\maketitle}{
	\begin{titlepage}
		% Ideas básicas sacadas de acá: 
		% https://tex.stackexchange.com/questions/5284/heading-title-with-a-logo
		% Revisada el 9 de junio de 2020.
		\noindent
		\begin{minipage}[c]{.7\linewidth}
			\vspace{0pt}
			\begin{center}
				\textbf{\fontsize{14}{16.8}\selectfont\MakeUppercase{\@universidad}}\\
				\textbf{\fontsize{12}{14.4}\selectfont\MakeUppercase{\@facultad}}\\
				\textbf{\fontsize{12}{14.4}\selectfont\@unidad}
			\end{center}
		\end{minipage}
		\hfill
		\begin{minipage}[c]{.25\linewidth}
			\vspace{0pt}
			\iflogo\logo
			\else
				\includegraphics[scale=.25]{./images/LogoUsach2.png}
			\fi
		\end{minipage}
		
		\vfill
		\begin{center}
			% Espacio para título
			\textbf{\fontsize{12}{18}\selectfont\MakeUppercase{\@title}}\\
			% Espacio para subtítulo
			\textbf{\fontsize{10}{15}\selectfont\@subtitle}
		\end{center}
		
		% Bloque de autores
		\begin{center}
			\bfseries
			\begin{tabular}[t]{c}
				\fontsize{10}{15}\selectfont\@author
			\end{tabular}\par
		\end{center}
		
		\vfill
		\hfill
		\begin{minipage}{0.5\linewidth}
			\begin{flushright}
				\begin{tabular}{ll}
				\ifdosguias{Profesores:}\else{Profesor:}\fi
				&\ifdosguias
					\@profesor \\
					&\@profesorco
				\else
					\@profesor
				\fi
				\end{tabular}
			\end{flushright}	
			\par
			\@propuesta
		\end{minipage}
		
		\vfill
		\begin{center}
			\@ciudad, \@pais\\
			\@date\par
		\end{center}
		
	\end{titlepage}
}

%-------Copyright
% by Emir
\newcommand{\makecopyright}
{
    \ifpropuesta
        % no va copyright
    \else
        %\thispagestyle{empty}
        \null
	\vfill\par
        \begin{flushleft}
    
    		
    		\copyright\ 
            \@autor \; - \@annoexamen \\ 
            \includegraphics[height=12pt]{images/licences/cc_by.png}
				~$\bullet$~~ Algunos derechos reservados. Esta obra está bajo una Licencia Creative Commons Atribución-Chile 3.0. Sus condiciones de uso pueden ser revisadas en: \url{http://creativecommons.org/licenses/by/3.0/cl/}.
    
    
        \end{flushleft}
    \fi
}

%================================================================
% FRONTMATTER
%================================================================
%------Página de dedicatoria
\providecommand{\dedicatoriaSimple}[1]{
	\clearpage
	\thispagestyle{empty}
	\vspace*{0.2\textheight}
	\begin{flushright}
		\textit{#1}
	\end{flushright}
	\clearpage
}

% Formato estándar como el de agradecimientos, supongo que esto
% es a gusto de cada quien.
\newenvironment{pagDedicatoria}[1]
{
	\thispagestyle{empty}
	\chapter*{\centerline{Dedicatoria}}
	%\addcontentsline{toc}{chapter}{Dedicatoria}
}{}

%------Página de agradecimientos
\newenvironment{agradecimiento}
{
    \thispagestyle{empty}
    \chapter*{\centerline{Agradecimientos}}
    %\addcontentsline{toc}{chapter}{Agradecimientos}
}
{\clearpage}

%================================================================
% ABSTRACT
%================================================================
%------Página de resumen (castellano)
% Palabras clave
\DeclareRobustCommand*{\keywordsEs}[1]{\gdef\@keywordsEs{#1}}
\newenvironment{resumenEs}
{
	\chapter*{\centerline{Resumen}}
	%\addcontentsline{toc}{chapter}{Resumen}
}
{
	% Fuente más pequeña, en nueva línea
	% Las palabras clave van con el abstract
	\small\par
	\textbf{Palabras Claves: } \@keywordsEs
}

%------Página de abstract (ingles)
% Palabras clave
\DeclareRobustCommand*{\keywordsEn}[1]{\gdef\@keywordsEn{#1}}
\newenvironment{resumenEn}
{
	\chapter*{\centerline{Abstract}}
	%\addcontentsline{toc}{chapter}{Abstract}
}
{	
	% Fuente más pequeña, en nueva línea
	\small\par
	\textbf{Keywords: } \@keywordsEn
}

%------Página de glosario
% by Hugo Meneses
\newenvironment{glosario}
{
	\begin{center}
		\textbf{\Large GLOSARIO}
	\end{center}
}{}
%---------------------------------------------
%----------------------- Configuración del PDF
\hypersetup
{
    bookmarksopen, bookmarksnumbered, pdfdisplaydoctitle=true,
    pdftitle=\@title,
    pdfauthor=\@author,
    pdfsubject=Tesis de grado,
    pdfkeywords=,%\@keywordsEs,
    pdfcreator=Universidad de Santiago de Chile,
    %pdfproducer=Emir Mu\~noz and Víctor Flores,
    colorlinks=true,
    % linkcolor=red,
    % citecolor=green,
    % filecolor=magenta,
    % urlcolor=cyan,
    linkcolor=black,
    citecolor=black,
    filecolor=black,
    urlcolor=black,
    linkbordercolor={1 0 0},
    citebordercolor={0 1 0}
}


%--------Teoremas, definiciones, ejemplos, lemas, etc
\newtheoremstyle{teorema}{\topsep}{\topsep}%
    {\normalfont} % Body font
    {} % Indent amount (empty = no indent, \parindent = para indent)
    {\bfseries} % Theorem head font
    {} % Punctuation after theorem head
    { } % Space after theorem head (\newline = linebreak)
    {\thmname{#1}\thmnumber{ #2}\thmnote{ #3}} % Thm head spec
\theoremstyle{teorema}
\newtheorem{teorema}{Teorema}[chapter]

\newtheoremstyle{ejemplo}{\topsep}{\topsep}%
    {\normalfont} % Body font
    {} % Indent amount (empty = no indent, \parindent = para indent)
    {\bfseries} % Theorem head font
    {} % Punctuation after theorem head
    { } % Space after theorem head (\newline = linebreak)
    {\thmname{#1}\thmnumber{ #2}\thmnote{ #3}} % Thm head spec
\theoremstyle{ejemplo}
\newtheorem{ejemplo}{Caso}[chapter]%Ejemplo

\newtheoremstyle{definicion}{\topsep}{\topsep}%
    {\normalfont} % Body font
    {} % Indent amount (empty = no indent, \parindent = para indent)
    {\bfseries} % Theorem head font
    {} % Punctuation after theorem head
    { } % Space after theorem head (\newline = linebreak)
    {\thmname{#1}\thmnumber{ #2}\thmnote{ #3}} % Thm head spec
\theoremstyle{definicion}
\newtheorem{definicion}{Definici\'on}[chapter]

\newtheoremstyle{lema}{\topsep}{\topsep}%
    {\normalfont} % Body font
    {} % Indent amount (empty = no indent, \parindent = para indent)
    {\bfseries} % Theorem head font
    {} % Punctuation after theorem head
    { } % Space after theorem head (\newline = linebreak)
    {\thmname{#1}\thmnumber{ #2}\thmnote{ #3}} % Thm head spec
\theoremstyle{lema}
\newtheorem{lema}{Lema}[chapter]

\newenvironment{prueba}[1][Demostraci\'on]
{
    \begin{trivlist}
    \item[\hskip \labelsep {\bfseries #1}]
}{\end{trivlist}}

\renewcommand{\qed}
{   
    \nobreak \ifvmode \relax \else
    \ifdim\lastskip<1.5em \hskip-\lastskip
    \hskip1.5em plus0em minus0.5em \fi \nobreak
    \vrule height0.75em width0.5em depth0.25em\fi
}

%% End of file `tesis.cls'.
