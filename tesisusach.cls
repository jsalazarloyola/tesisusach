\NeedsTeXFormat{LaTeX2e}

% Estilo para tesis siguiendo norma Usach
% Agradecimiento por aportes a:
% Emir Muñoz (código original)
% Rodrigo Campos
% Hugo Meneses
% Víctor Flores
\ProvidesClass{tesisusach}[2020/06/09 v1.4 Estilo para tesis (Javier Salazar Loyola)]

\newif\ifkeys\keysfalse
\newif\iftxfonts\txfontsfalse
\newif\ifdosguias\dosguiasfalse
\newif\iflogo\logofalse
\newif\ifpropuesta\propuestafalse
\newif\ifdoctorado\doctoradofalse
\newif\ifmagister\magisterfalse
\newif\ifcivil\civilfalse
\newif\ifejecucion\ejecucionfalse

\DeclareOption{keys}{\keystrue}
\DeclareOption{doctorado}{\doctoradotrue}
\DeclareOption{magister}{\magistertrue}
\DeclareOption{civil}{\civiltrue}
\DeclareOption{ejecucion}{\ejecuciontrue}
\DeclareOption{txfonts}{\txfontstrue}
\DeclareOption{dosguias}{\dosguiastrue}
\DeclareOption{logo}{\logotrue}
\DeclareOption{nologo}{\logofalse}
\DeclareOption{propuesta}{\propuestatrue}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax

%SI SE UTILIZA LETRA ARIAL, CAMBIAR ESTO
\renewcommand{\rmdefault}{phv} % Arial
\renewcommand{\sfdefault}{phv} % Arial

%Load book using normal font size to 10pt
\LoadClass[10pt,oneside,letterpaper]{book}
%Cambiar oneside o twoside si se desea impresión por ambos lados

%% Cambio el interlineado a 1.5:
%\linespread{1.5}
\renewcommand{\baselinestretch}{1.5}

%%Hago que la mancha de página deje todo alineado hacia arriba
\raggedbottom

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

%--------Idioma
\RequirePackage[spanish]{babel}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\ifkeys\RequirePackage[notref,notcite]{showkeys}\fi

%--------Configuracion de header y footer
\RequirePackage{fancybox}
\RequirePackage{fancyhdr}
\RequirePackage{float}

%--------Simbolos y fuentes
\RequirePackage{amstext}
\RequirePackage{amssymb,latexsym}
\RequirePackage{amsfonts}
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\iftxfonts\RequirePackage{txfonts}\fi

%-------Entornos, figuras
\RequirePackage{enumerate}

%-------Imagenes GNU Plot
\RequirePackage{graphicx}

%-------Referencias
\RequirePackage{hyperref}
% Paquete para colocar el link al inicio del flotante
\RequirePackage[all]{hypcap}

%--------Tablas
\RequirePackage{multirow} % Multiples filas en Tablas
\RequirePackage{array}
\RequirePackage[font=small]{caption}
\RequirePackage{subcaption}
\captionsetup[table]{position=top,belowskip=4pt,aboveskip=4pt}
\RequirePackage{longtable} % Para cortar tablas grandes
\RequirePackage{lscape}

%--------Apendice y tabla de contenidos
\RequirePackage{appendix}
\RequirePackage[nottoc]{tocbibind}

%--------Algoritmos
\RequirePackage[ruled,algochapter,linesnumbered]{algorithm2e}
\renewcommand{\algorithmcfname}{Algoritmo}%
\RequirePackage{algorithmic}
\setlength{\algomargin}{1em}
\renewcommand{\algorithmicrequire}{\textbf{Entrada:}}
\renewcommand{\algorithmicensure}{\textbf{Salida:}}
\renewcommand{\algorithmiccomment}[1]{//#1}

%--------Configuracion indice de algoritmos
\renewcommand{\listofalgorithms}{
    \begingroup
    \tocfile{Índice de algoritmos}{loa}
    \endgroup
}

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


\setcounter{secnumdepth}{2} %Mostrar numeración en las subsecciones (subsubsecciones no llevan números)
\setcounter{tocdepth}{3} %Mostrar las subsubsecciones en el índice

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
	%Numeración al lado derecho de la página en páginas del lado derecho (ajustado para twoside)
	\fancyhead[LE,RO]{\textsl{\leftmark}}
	\fancyfoot[LE,RO]{\thepage}
\else
	\fancyhead[L]{\textsl{\leftmark}}
	\fancyfoot[R]{\thepage} 
\fi
%\cfoot{}

%Hace que la primera página de cada capítulo no tenga el header por defecto y que en el footer el N° de página no esté al centro
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

% Cambios al default de spanish
% Para desactivar el atajo ~N para la Ñ
\deactivatetilden
\decimalpoint
% Headings
\markboth{}{}

% Renombre de los titulos por defecto
% En teoría, solo son necesarias las tablas, pero
% por si acaso
\addto\captionsspanish
{
    \def\contentsname{Tabla de contenido}
    \def\listtablename{Índice de tablas}
    \def\listfigurename{Índice de ilustraciones}
    \def\listalgorithmname{Índice de algoritmos}
    \def\appendixname{Apéndice}
    \def\tablename{Tabla}
    \def\figurename{Figura}
    \def\chaptername{Capítulo}
}

\renewcommand{\appendixname}{Apéndices}
\renewcommand{\appendixtocname}{Apéndices}
\renewcommand{\appendixpagename}{Apéndices}

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

\RequirePackage{tocloft}
%Se agrega la palabra 'Figura' al índice de figuras
\renewcommand{\cftfigfont}{Figura }
%Lo mismo para el índice de tablas
\renewcommand{\cfttabfont}{Tabla }

%Se cambia el tamaño del título de la lista de figuras, tablas e índice de contenido dejándolos igual que los títulos normales
\renewcommand\cftloftitlefont{\Large\bf}
\renewcommand\cftlottitlefont{\Large\bf}
\renewcommand\cfttoctitlefont{\Large\bf}

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
%--------Comandos
\def\@title{}
\def\@autor{}
\def\@fecha{}
\def\@profesorguia{}
\def\@profesorcoguia{}
\def\@nombreuno{}
\def\@nombredos{}
\def\@nombretres{}
\def\@ciudad{}
\def\@pais{}
\def\@run{}
\def\@telefono{}
\def\@email{}
\newcommand{\keywords}[1]{\def\keywords{#1}}
\def\titulo#1{\gdef\@title{\begin{center}{\LARGE\bf#1}%
\end{center}}\gdef\@titleMay{\begin{center}{\fontsize{12}{18} \selectfont \bf#1}%
\end{center}}}

\def\autor#1{\gdef\@autor{{\bfseries #1}}\gdef\@autorn{#1}}
\def\fecha#1#2#3#4{\gdef\@diasemana{#1}\gdef\@diaexamen{#2}\gdef\@mesexamen{#3}%
\gdef\@annoexamen{#4}\gdef\@fecha{#3, #4}}
\def\profesorguia#1{\gdef\@profesorguia{#1}}
\def\profesorcoguia#1{\gdef\@profesorcoguia{#1}}
\def\nombreuno#1{\gdef\@nombreuno{#1}}
\def\nombredos#1{\gdef\@nombredos{#1}}
\def\nombretres#1{\gdef\@nombretres{#1}}
\def\regular#1{\gdef\@regular{#1}}
\def\externo#1{\gdef\@externo{#1}}
\def\presidente#1{\gdef\@presidente{#1}}
\def\ciudad#1{\gdef\@ciudad{#1}}
\def\pais#1{\gdef\@pais{#1}}
\def\run#1{\gdef\@run{#1}}
\def\telefono#1{\gdef\@telefono{#1}}
\def\email#1{\gdef\@email{#1}}

%--------Información del documento PDF
\hypersetup
{
    bookmarksopen, bookmarksnumbered, pdfdisplaydoctitle=true,
    pdftitle=\@title,
    pdfauthor=\@autor,
    pdfsubject=Tesis de grado,
    pdfkeywords=,
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

\newsavebox{\GradoTesis}
\newsavebox{\Gradotesis}
\newsavebox{\GradoOtorgado}
\newsavebox{\GradoOtorgadoTapa}

\ifdoctorado\savebox{\GradoTesis}{DOCTORADO}
            \savebox{\Gradotesis}{Doctorado}
            \savebox{\GradoOtorgado}{Doctor en Ciencias de la Computaci\'on}
            \savebox{\GradoOtorgadoTapa}{\large Doctor en Ciencias de la Computaci\'on}
\else\savebox{\GradoTesis}{MAGÍSTER}
       \savebox{\Gradotesis}{Magíster}
       \savebox{\GradoOtorgado}{Magíster en Ingeniería Informática}
       \savebox{\GradoOtorgadoTapa}{\large Magíster en Ingeniería Informática} %\large
\fi

%-------Cubierta
% by Emir
\newcommand{\makecubierta}
{
\iflogo
    \vspace*{1.5cm} %-1.0cm
    \begin{picture}(18,4)(0,40)
        \put(300,-7){\includegraphics[scale=.25]{./images/LogoUsach2.png}}
    \end{picture}
\fi

\sloppy
\thispagestyle{empty}
\vspace*{-1.8cm} %-1.5cm

\begin{center}
    {\hspace*{-0.5cm}\textbf{\fontsize{14}{16.8}\selectfont UNIVERSIDAD DE SANTIAGO DE CHILE}}\\
    {\hspace*{-0.5cm}\textbf{\fontsize{12}{14.4}\selectfont FACULTAD DE INGENIERÍA}}\\
    {\hspace*{-0.5cm}\textbf{\fontsize{12}{14.4}\selectfont Departamento de Ingeniería Informática}}\\
\end{center}

\ifpropuesta % si se trata de la propuesta
    \vspace*{5cm}
    \@titleMay\par
    \vspace{1cm}
    \begin{center}
    \large
    \ifdoctorado
        Propuesta de Tesis para optar por el grado de Doctor en Ciencias de la Ingeniería con mención en Informática
    \fi
    \ifmagister
        Propuesta de Trabajo de Título para Magíster en Ingeniería Informática
    \fi
    \ifcivil
        Propuesta de Trabajo de Título para Ingeniería Civil Informática
    \fi
    \ifejecucion
        Propuesta de Trabajo de Título para Ingeniería en ejecución en Informática y Computación
    \fi
    \end{center}
    \vspace{2.5cm}
    \begin{flushright}
        \begin{tabular}[t]{l l}
            Nombre: & \@autor \\
            %Nombre 2: & \@nombredos \\
            %Nombre 3: & \@nombretres \\
            R.U.N.: & \@run \\
            %A\~no Ingreso: & \@annoingreso \\
            Teléfono: & \@telefono \\
            E-mail: & \@email \\
            \ifdosguias Profesores: \else Profesor: \fi &
            \ifdosguias
                {\normalfont \@profesorguia} \\ 
                & {\normalfont \@profesorcoguia} \\
            \else
                \@profesorguia \\
            \fi
        \end{tabular}
    \end{flushright}
    \begin{center}
        \vspace{1.5cm}
        \@diasemana, \@diaexamen\ de \@mesexamen\ de \@annoexamen
    \end{center}
\else % si se trata del documento final
    \vspace*{3.0cm} %cambiar esto si la portada se extiende y usa dos páginas
    \@titleMay\par
    \vspace{1cm}
    \large
        \begin{center}
        \vspace*{2cm}
        \iflogo
            {\textbf{\fontsize{10}{12} \selectfont{\@autor}}}\\[1cm]
        \else
            {\textbf{\fontsize{10}{12} \selectfont{\@autor}}}\\[1.5cm]
        \fi

        %Datos profesor(es)
        \vspace*{2cm}
        \begin{flushleft}
        \normalsize
        \begin{flushright}
          Profesor guía: \fontsize{10}{12} \selectfont {\@profesorguia}\\
        \end{flushright}
        \ifdosguias
            \hspace{7cm} Profesor co-guía: \fontsize{10}{12} \selectfont{\@profesorcoguia}\\
        \fi
        \vspace{1cm}
        \hspace{9.5cm} Tesis de grado presentada en\\
        \hspace{9.5cm} conformidad a los requisitos para\\
        \ifdoctorado
            \hspace{9.5cm} obtener el grado de Doctor en\\
            \hspace{9.5cm} Ingeniería Informática\\
        \fi
        \ifmagister
            \hspace{9.5cm} obtener el grado de Magíster en \\
            \hspace{9.5cm} Ingeniería Informática\\
        \fi
        \ifcivil
            \hspace{9.5cm} obtener el título de Ingeniero \\
            \hspace{9.5cm} Civil en Informática\\
        \fi
        \ifejecucion
            \hspace{9.5cm} obtener el título de Ingeniero \\
            \hspace{9.5cm} Ejecución en Informática y Computación\\
        \fi
        \end{flushleft}

        %\vspace*{3.5cm}
        \null
	\vfill
        \fontsize{10}{12} \selectfont{\@ciudad\ -- \@pais}\\
        \@annoexamen
        \end{center}\par
        \iflogo 
	  \vspace{.9cm}
	\else
	  \vspace{1cm}
	\fi
    
\fi
} %\\end \makecubierta



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
	\addcontentsline{toc}{chapter}{Dedicatoria}
}{}

%------Página de agradecimientos
\newenvironment{agradecimiento}
{
    \thispagestyle{empty}
    \chapter*{\centerline{Agradecimientos}}
    \addcontentsline{toc}{chapter}{Agradecimientos}
}
{\clearpage}

%================================================================
% ABSTRACT
%================================================================
%------Página de resumen (castellano)
% Caja para las palabras claves en castellano
\newsavebox{\eskw}
% Guardado de palabras clave
\providecommand{\keywordsEs}[1]{
	\savebox{\eskw}{#1}
}
\newenvironment{resumenEs}
{
	\chapter*{\centerline{Resumen}}
	\addcontentsline{toc}{chapter}{Resumen}
}
{
	% Fuente más pequeña, en nueva línea
	% Las palabras clave van con el abstract
	\small\par
	\textbf{Palabras Claves: } \usebox{\eskw}
}

%------Página de abstract (ingles)
% Caja para las palabras claves en inglés
\newsavebox{\enkw}
% Guardado de palabras clave
\providecommand{\keywordsEn}[1]{
	\savebox{\enkw}{#1}
}
\newenvironment{resumenEn}
{
	\chapter*{\centerline{Abstract}}
	\addcontentsline{toc}{chapter}{Abstract}
}
{	
	% Fuente más pequeña, en nueva línea
	\small\par
	\textbf{Keywords: } \usebox{\enkw}
}

%------Página de glosario
% by Hugo Meneses
\newenvironment{glosario}
{
	\begin{center}
		\textbf{\Large GLOSARIO}
	\end{center}
}{}

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
