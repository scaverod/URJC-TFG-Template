\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{urjc-report}

\LoadClass[12pt,a4paper,oneside]{book}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Nos aseguramos de que usamos xetex como motor de compilación
%
\RequirePackage{ifxetex}
\RequireXeTeX

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Paquetes globales
%
\RequirePackage[%
    titletoc
    ]{appendix}             % "Apéndice" antes del nombre del capítulo
\RequirePackage{awesomebox} % Bloques de texto más molones
\RequirePackage{changepage} % Para poder usar los adjustwidth
\RequirePackage{csquotes}   % Facilitar el trabajo con citas
\RequirePackage{eso-pic}    % Colores y fondos
\RequirePackage{graphicx}   % Mejoras sobre el paquete graphics
\RequirePackage{hologo}     % Para poner logos relacionados con LaTeX
\RequirePackage{ifthen}     % Para poder usar condicionales en la clase
\RequirePackage{pdflscape}  % Posibilidad de páginas en apaisado
\RequirePackage{xcolor}     % Mejoras sobre el paquete color
\RequirePackage{algorithm}  % Generación de pseudocódigos
\RequirePackage{algorithmic}% Generación de pseudocódigos 
\RequirePackage{colortbl}   % Color de tablas
\RequirePackage{tabularx}   % Tablas avanzadas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Valores constantes
%
\def\universityname{Universidad Rey Juan Carlos}
\def\templaterepository{https://github.com/scaverod/TFG-Report-Template.git}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Opciones de la clase
%
\RequirePackage{kvoptions} % Para usar argumentos al importar la clase
\SetupKeyvalOptions{family=@urjc, prefix=@urjc@}

% Opciones de configuración de la clase
\DeclareStringOption{school}
\DeclareStringOption{type}
\DeclareStringOption{degree}
\DeclareStringOption{authorsex}
\DeclareStringOption{directorsex}
\DeclareStringOption{codirectorsex}
\ProcessKeyvalOptions*

% Variables relacionadas con la escuela (arg. 'school')
\newcommand{\schoolname}{}
\newcommand{\schoolabbr}{}
\newcommand{\schoollogo}{}
\newcommand{\schooladdress}{}
\ifthenelse{\equal{\@urjc@school}{etsii}}{%
    \renewcommand{\schoolname}{E.T.S. de Ingeniería Informática}
    \renewcommand{\schoolabbr}{ETSII}
    \renewcommand{\schoollogo}{urjc-report/logos/logo-urjc-etsii.png}
    \renewcommand{\schooladdress}{%
        Campus de Móstoles, Calle Tulipán s/n.\\
        28933 Móstoles, Madrid
    }
    \definecolor{schoolcolor}{RGB}{203, 0, 23}
    \definecolor{linkcolor}{RGB}{203, 0, 23}
}{}
\ifthenelse{\equal{\schoolname}{}}{
    \PackageError{urjc-report}{School}{Falta el parámetro 'school'}
}{}

% Variables relacionadas con el tipo de memoria (arg. 'type')
\newcommand{\reporttype}{}
\newcommand{\reporttypeabbr}{}
\ifthenelse{\equal{\@urjc@type}{pfg}}{
    \renewcommand{\reporttype}{Proyecto Fin de Grado}
    \renewcommand{\reporttypeabbr}{PFG}
}{}
\ifthenelse{\equal{\@urjc@type}{tfg}}{
    \renewcommand{\reporttype}{Trabajo Fin de Grado}
    \renewcommand{\reporttypeabbr}{TFG}
}{}
\ifthenelse{\equal{\@urjc@type}{pfm}}{
    \renewcommand{\reporttype}{Proyecto Fin de Máster}
    \renewcommand{\reporttypeabbr}{PFM}
}{}
\ifthenelse{\equal{\@urjc@type}{tfm}}{
    \renewcommand{\reporttype}{Trabajo Fin de Máster}
    \renewcommand{\reporttypeabbr}{TFM}
}{}
\ifthenelse{\equal{\@urjc@type}{td}}{
    \renewcommand{\reporttype}{Tesis Doctoral}
    \renewcommand{\reporttypeabbr}{PhD}
}{}
\ifthenelse{\equal{\reporttype}{}}{
    \PackageError{urjc-report}{Report type}{Falta el parámetro 'type'}
}{}

% Variables relacionadas con el título de estudios (arg. 'degree')
\newcommand{\degreecode}{}
\newcommand{\degreename}{}
%% ETSIDI
\ifthenelse{\equal{\@urjc@degree}{GCID}}{
    \renewcommand{\degreecode}{GCID}
    \renewcommand{\degreename}{Grado en Ciencia e Ingeniería de Datos}
}{}
\ifthenelse{\equal{\@urjc@degree}{GDDV}}{
    \renewcommand{\degreecode}{GDDV}
    \renewcommand{\degreename}{Grado en Diseño y Desarrollo de Videojuegos}
}{}
\ifthenelse{\equal{\@urjc@degree}{GIC}}{
    \renewcommand{\degreecode}{GIC}
    \renewcommand{\degreename}{Grado en Ingeniería de Computadores}
}{}
\ifthenelse{\equal{\@urjc@degree}{GICIB}}{
    \renewcommand{\degreecode}{GICIB}
    \renewcommand{\degreename}{Grado en Ingeniería de la Ciberseguridad}
}{}
\ifthenelse{\equal{\@urjc@degree}{GIS}}{
    \renewcommand{\degreecode}{GIS}
    \renewcommand{\degreename}{Grado en Ingeniería del Software}
}{}
\ifthenelse{\equal{\@urjc@degree}{GII}}{
    \renewcommand{\degreecode}{GII}
    \renewcommand{\degreename}{Grado en Ingeniería Informática}
}{}
\ifthenelse{\equal{\@urjc@degree}{GIA}}{
    \renewcommand{\degreecode}{GIA}
    \renewcommand{\degreename}{Grado en Inteligencia Artificial}
}{}
\ifthenelse{\equal{\@urjc@degree}{MAT}}{
    \renewcommand{\degreecode}{MAT}
    \renewcommand{\degreename}{Grado en Matemáticas}
}{}
\ifthenelse{\equal{\degreecode}{}}{
    \PackageError{urjc-report}{Degree}{Falta el parámetro 'degree'}
}{}

% Variables relacionadas con el sexo del autor (arg. 'degree')
\newcommand{\authorsex}{\@urjc@authorsex}
\ifthenelse{\not \( \equal{\authorsex}{m} \or \equal{\authorsex}{f} \)}{
    \PackageError{urjc-report}{Author sex}{Falta el parámetro 'authorsex'}
}{}

% Variables relacionadas con el sexo del director (arg. 'degree')
\newcommand{\directorsex}{\@urjc@directorsex}
\ifthenelse{\not \( \equal{\directorsex}{m} \or \equal{\directorsex}{f} \)}{
    \PackageError{urjc-report}{Director sex}{Falta el parámetro 'directorsex'}
}{}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Variables
%
\makeatletter
\newcommand{\bibauthor}[1]{\gdef\@bibauthor{#1}}%
\newcommand{\@bibauthor}{\@latex@warning@no@line{No \noexpand\bibauthor given}}
\newcommand{\director}[1]{\gdef\@director{#1}}%
\newcommand{\@director}{\@latex@warning@no@line{No \noexpand\director given}}
\newcommand{\bibdirector}[1]{\gdef\@bibdirector{#1}}%
\newcommand{\@bibdirector}{\@latex@warning@no@line{No \noexpand\bibdirector given}}




\newcommand{\codirector}[3][]{%
    \ifthenelse{\equal{#1}{}}{%
        % Si el argumento opcional está vacío, establece sólo el nombre del codirector
        \gdef\@codirector{#2}%
        \gdef\@codirectorsex{}%
        \gdef\@bibcodirector{}%
    }{%
        % Si se proporciona el argumento opcional, establece tanto el nombre como el sexo del codirector
        \gdef\@codirector{#2}%
        \gdef\@codirectorsex{#1}%
        \gdef\@bibcodirector{#3}%
    }%
}





\newcommand{\@codirector}{} % Inicializar la macro del nombre del codirector para que esté vacía
\newcommand{\@codirectorsex}{} % Inicializar la macro codirector sex para que esté vacía
\newcommand{\@bibcodirector}{} % Inicializar la macro nombre del babero codirector para que esté vacía

\newcommand{\githuburl}[1]{\def\@githuburl{#1}}

\makeatother

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Idioma
%
% TODO Convertir el lenguaje en una opción del paquete
\RequirePackage[spanish,es-tabla,es-ucroman]{babel}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Geometría general de las páginas
%
\RequirePackage[
    top=3.5cm,
    bottom=3cm,
    left=2.5cm,
    right=2.5cm,
]{geometry}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Cabeceras y pies de página
%
\RequirePackage{fancyhdr}
\setlength{\headheight}{15.1pt}
\pagestyle{fancy}

% Estilos globales
\fancyhf{}
\fancyhead[L]{\textcolor{schoolcolor}{\sffamily\nouppercase{\rightmark}}}
\fancyhead[R]{\textcolor{schoolcolor}{\sffamily\thepage}}
\renewcommand{\headrulewidth}{0.5pt}

% Estilos en páginas "plain" (e.g. primera de capítulo)
\fancypagestyle{plain}{%
    \fancyhf{}
    \renewcommand{\headrule}{}
    \renewcommand{\footrule}{}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Estilos de capítulo, sección, ...
%
\RequirePackage{titlesec}

\titleformat{\chapter}%
    {\fontsize{38}{38}}%
    {\sffamily\fontsize{38}{38}\color{schoolcolor}\thechapter.}%
    {0.6em}%
    {\sffamily\fontsize{38}{38}\raggedleft\hspace*{\fill}}
    [\hrule]
\titlespacing*{\chapter}{0pt}{0pt}{25pt}

\titleformat{\section}%
    {}{\sffamily\huge\thesection.}{0.6em}{\sffamily\huge}
\titleformat{\subsection}%
    {}{\sffamily\Large\thesubsection.}{0.6em}{\sffamily\Large}
\titleformat{\subsubsection}%
    {}{\sffamily\large\thesubsubsection.}{0.6em}{\sffamily\large}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Estilos de la tabla de contenidos
%
\RequirePackage{titletoc}
\setcounter{tocdepth}{1}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fuentes
%
\RequirePackage{fontspec}  % Para importar fuentes externas
\RequirePackage{microtype} % Mejoras tipográficas generales
% TODO Cambiar los tipos de letra según la guía de estilos de la escuela
\setmainfont[
    Path=urjc-report/fonts/Montserrat/,
    Extension=.ttf,
    UprightFont=*-Regular,
    BoldFont=*-SemiBold,
    ItalicFont=*-Italic,
    BoldItalicFont=*-SemiBoldItalic,
]{Montserrat}

\setsansfont[
    Path=urjc-report/fonts/Barlow Condensed/,
    Extension=.ttf,
    UprightFont=*-Medium,
    BoldFont=*-Bold,
    ItalicFont=*-MediumItalic,
    BoldItalicFont=*-BoldItalic,
]{BarlowCondensed}

\setmonofont[
    Path=urjc-report/fonts/Fira Code/,
    Extension=.ttf,
    UprightFont=*-regular,
    BoldFont=*-bold,
]{firacode}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fórmulas matemáticas
%
\RequirePackage{amsmath}   % Mejoras presentación matemática
\RequirePackage{mathtools} % Más mejoras de presentación matemática

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Configuración de figuras y tablas
%
\RequirePackage{float}      % Mejorar colocación de elementos flotantes
\RequirePackage{tabularx}   % Tablas más configurables
\newcolumntype{C}{%
    >{\centering\arraybackslash}X%
    }                       % Para tener columnas tipo X centradas
\RequirePackage{booktabs}   % Configuraciones para tablas más bonitas
\RequirePackage{caption}    % Mejora de pies de figuras
\RequirePackage{subcaption} % Pies de subfiguras


\DeclareCaptionFormat{caption-urjc}{#1#2~\small #3}
\DeclareCaptionLabelFormat{caption-urjc}{\textbf{#1 #2}}
\DeclareCaptionLabelSeparator{caption-urjc}{.}

\captionsetup{
    format=caption-urjc,
    labelformat=caption-urjc,
    labelsep=caption-urjc,
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Configuración general de espaciados, geometrías y otros
%
\setlength{\parskip}{1em}
\linespread{1.2}
\setlength{\parindent}{0pt}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Configuración para PDF e hipervínculos
%
\RequirePackage[naturalnames]{hyperref}
\makeatletter
\hypersetup{
    pdfauthor={\@author},
    pdftitle={\@title},
    %pdfsubject={},   % TODO PONER ALGUNA OPCIÓN PARA DETERMINAR EL TEMA
    %pdfkeywords={},  % TODO QUE LAS KEYWORDS SE USEN TAMBIÉN AQUÍ
    pdfcreator={\@author},
    pdfproducer={},
    breaklinks=true,
    linktoc=all,
    plainpages=false,
    unicode=true,
    colorlinks=true,
    linkcolor={linkcolor},
}
\makeatother

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Estilos de los listados de código fuente
%
\RequirePackage{listings}
\renewcommand{\lstlistingname}{Listado}
\renewcommand*{\lstlistlistingname}{Índice de listados}

\makeatletter
\renewcommand\lstlistoflistings{\bgroup
  \let\contentsname\lstlistlistingname
  \def\l@lstlisting##1##2{\@dottedtocline{1}{1.5em}{2.3em}{##1}{##2}}
  \let\lst@temp\@starttoc \def\@starttoc##1{\lst@temp{lol}}%
  \tableofcontents \egroup}
\makeatother

\definecolor{sbase03}{HTML}{002B36}
\definecolor{sbase02}{HTML}{073642}
\definecolor{sbase01}{HTML}{586E75}
\definecolor{sbase00}{HTML}{657B83}
\definecolor{sbase0}{HTML}{839496}
\definecolor{sbase1}{HTML}{93A1A1}
\definecolor{sbase2}{HTML}{EEE8D5}
\definecolor{sbase3}{HTML}{FDF6E3}
\definecolor{syellow}{HTML}{B58900}
\definecolor{sorange}{HTML}{CB4B16}
\definecolor{sred}{HTML}{DC322F}
\definecolor{smagenta}{HTML}{D33682}
\definecolor{sviolet}{HTML}{6C71C4}
\definecolor{sblue}{HTML}{268BD2}
\definecolor{scyan}{HTML}{2AA198}
\definecolor{sgreen}{HTML}{859900}
\lstset{
    sensitive=true,
    aboveskip=\baselineskip,
    belowskip=\baselineskip,
    frame=lines,
    xleftmargin=\parindent,
    belowcaptionskip=1\baselineskip,
    basicstyle=\color{sbase00}\ttfamily,
    keywordstyle=\color{scyan},
    commentstyle=\color{sbase1},
    stringstyle=\color{sblue},
    numberstyle=\color{sviolet},
    identifierstyle=\color{sbase00},
    breaklines=true,
    showstringspaces=false,
    tabsize=2
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Listados condicionales
%
\RequirePackage[
    figure,table,lstlisting
    ]{totalcount}  % Contar las veces que aparecen entradas en listados

\newcommand\conditionalLoF{\iftotalfigures\listoffigures\fi}
\newcommand\conditionalLoT{\iftotaltables\listoftables\fi}
\newcommand\conditionalLoL{\iftotallstlistings\lstlistoflistings\fi}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Licencia de la memoria
%
\RequirePackage[%
    type={CC},%
    modifier={by-nc-sa},%
    version={4.0}%
]{doclicense}



\makeatletter
% Impresión de licencia modificada para que incluya más cosas. Es un
% clon de \docLicenseThis
\newcommand{\licencia}{%
    \setlength{\doclicense@hsize}{\linewidth-\doclicense@imagewidth-\doclicense@imagedistance}%
    \begin{center}
        \begin{minipage}{\doclicense@hsize}
            \ifthenelse{\isempty{\doclicense@hyphenation}}{}{%
                \@nameuse{\doclicense@hyphenation} 
            }%
            \doclicenseLongText Obra derivada de \href{\templaterepository}{\templaterepository}.%
        \end{minipage}
        \hfill
        \begin{minipage}{\doclicense@imagewidth}\doclicenseImage\end{minipage}
    \end{center}
    \vspace{-1.5em}
    Todo cambio respecto a la obra original es responsabilidad exclusiva del presente autor.\\
}
\makeatother
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Referencias y bibliografía
%
\RequirePackage[backend=biber,style=ieee]{biblatex}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Portada
%
\makeatletter         
\renewcommand\maketitle{{
    \sffamily
    \thispagestyle{empty}
    % Barra lateral izquierda y logo fondo
    \AddToShipoutPicture*{%
        \AtPageLowerLeft{%
            \makebox[1\paperwidth][r]{%
                \includegraphics[width=0.9\paperwidth]{urjc-report/logos/logo-urjc}
            }%
        }
        \put(0,0){%
            \colorbox{schoolcolor}{%
                \parbox[b][\paperheight]{2cm}{\vfill\hfill}
            }%
        }
    }
    \begin{adjustwidth}{1.5cm}{}
        {\large \MakeUppercase{\universityname}}\\*[1em]
        {\large \MakeUppercase{\textbf{\schoolname}}}\\*[1em]
        {\large \MakeUppercase{\reporttype}}\\*[1em]
        {\large \MakeUppercase{\textbf{\degreename}}}
        \vfill
        {\fontsize{38}{38}\selectfont\@title}\\*[0.3cm]
        \vfill
        \parbox[b]{\linewidth}{%
            \normalsize
            \textbf{\ifthenelse{\equal{\authorsex}{m}}{Autor}{Autora}}: \@author\\*[1em]
            \textbf{\ifthenelse{\equal{\directorsex}{m}}{Director}{Directora}}: \@director\\*[1em]
            \ifthenelse{\equal{\@codirectorsex}{m}}{%
                \textbf{Codirector}: \@codirector\\*[1em]
            }{\ifthenelse{\equal{\@codirectorsex}{f}}{%
                \textbf{Codirectora}: \@codirector\\*[1em]
            }{%
                % No hacer nada si el parámetro no es 'm' ni 'f
            }}
            Madrid, \@date
        }
    \end{adjustwidth}
    \normalfont
    \normalsize
}}
\makeatother

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Licencia
%
\makeatletter
\newcommand\makelicense{{
    \footnotesize
    \clearpage
    \thispagestyle{empty}
    ~\vfill
    \par{
        \textit{\@title}\\
        \reporttype, \today\\
        \textbf{\ifthenelse{\equal{\authorsex}{m}}%
            {Autor}%
            {Autora}%
        }: \@author\\
        \textbf{\ifthenelse{\equal{\directorsex}{m}}%
            {Director}%
            {Directora}%
        }: \@director
        \ifthenelse{\equal{\@codirectorsex}{m}}{%
                \\\textbf{Codirector}: \@codirector
            }{\ifthenelse{\equal{\@codirectorsex}{f}}{%
                \\\textbf{Codirectora}: \@codirector
            }{%
                % No hacer nada si el parámetro no es 'm' ni 'f
            }}
            \ifthenelse{\isundefined{\@githuburl}}{}{%
                    \ifthenelse{\equal{\@githuburl}{}}{}{%
                       \\\textbf{ GitHub }:    \url{\@githuburl},\\
                    }%
                }%
    }
    
    \par{
        \textbf{\schoolname}\\
        \schooladdress
    }
    \newline
    \hrule
    \par{
        Si deseas citar este trabajo, la entrada completa en \hologo{BibTeX} es la siguiente:

        \texttt{%
            @mastersthesis\{citekey,\\
                title   = \{\@title\},\\
                author  = \{\@bibauthor~ and \@bibdirector \ifx\@codirectorsex\@empty\else~ and \@bibcodirector \fi \},\\
                school  = \{\schoolname\},\\
                year    = \{\the\year\},\\
                month   = \{\the\month\},\\
                type    = \{\reporttype\},\\
                \ifthenelse{\isundefined{\@githuburl}}{}{%
                    \ifthenelse{\equal{\@githuburl}{}}{}{%
                        url    = \{\url{\@githuburl\}},\\
                    }%
                }%
            \}
        }
    }
    \newline
    \hrule
    \vspace*{-0.5cm}\par{\licencia}
 }}
\makeatother

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Agradecimientos
%
\makeatletter
\newcommand{\acknowledgements}[1]{\gdef\@acknowledgements{#1}}%
\newcommand{\@acknowledgements}{}
\newcommand\makeacknowledgements{{
    \ifthenelse{\equal{\@acknowledgements}{}}{}{
        \clearpage
        \thispagestyle{empty}
        \chapter*{Agradecimientos}
        \@acknowledgements
    }
}}
\makeatother

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Resumen y abstract
%
\makeatletter
\newcommand{\abstract}[2]{%
    \ifthenelse{\equal{#1}{spanish}}{\gdef\@abstractsp{#2}}{}%
    \ifthenelse{\equal{#1}{english}}{\gdef\@abstracten{#2}}{}%
}%
\newcommand{\keywords}[2]{%
    \ifthenelse{\equal{#1}{spanish}}{\gdef\@keywordssp{#2}}{}%
    \ifthenelse{\equal{#1}{english}}{\gdef\@keywordsen{#2}}{}%
}%

\newcommand\makeresumen{{
    \clearpage
    \thispagestyle{empty}
    \chapter*{Resumen}
    \@abstractsp

    \textbf{Palabras clave}: \@keywordssp
}}

\newcommand\makeabstract{{
    \clearpage
    \thispagestyle{empty}
    \chapter*{Abstract}
    \@abstracten

    \textbf{Keywords}: \@keywordsen
}}
\makeatother

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Glosario
%
\RequirePackage[acronym,section,nowarn]{glossaries}
% Hacemos que no haya salto de página entre glosario y siglas
\renewcommand*{\glsclearpage}{}
\makeglossaries

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Cubierta trasera
%
\makeatletter         
\newcommand{\makebackcover}{
    \clearpage
    \thispagestyle{empty}
    \pagecolor{schoolcolor}
    \AddToShipoutPicture*{%
        \put(0,0){%
            \colorbox{black}{%
                \parbox[b][12cm]{\paperwidth}{\vfill\hfill}
            }%
        }
    }
    \vspace*{\fill}
    \begin{center}
        \includegraphics[width=8cm]{\schoollogo}
    \end{center}
}
\makeatother

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Elementos del comienzo del documento
%
\makeatletter
\AtBeginDocument{%
    \maketitle
    \makelicense
    \makeacknowledgements
    \makeresumen
    \makeabstract
    
    \frontmatter

    \begingroup
        \tableofcontents
        \conditionalLoF
        \conditionalLoT
        \conditionalLoL
    \endgroup

    \mainmatter
}
\makeatother

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Elementos del fin del documento
%
\makeatletter
\AtEndDocument{
    \backmatter

    \printbibliography
    \chapter*{Índice de términos}
    \printglossaries
    %\printindex  TODO Hacer el índice (por supuesto opcional)
    \makebackcover
}
\makeatother

\endinput