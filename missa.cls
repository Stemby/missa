% missa.cls
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{missa}

\RequirePackage{xkeyval}
%\RequirePackage{ifthen}
\RequirePackage[a5paper]{geometry}[2010-02-12] % I have to declare a page format: why?
\RequirePackage{color}
\RequirePackage[jerusalem]{bibleref}
\RequirePackage[staffsize=15.87]{lilypond}

% New colours
\definecolor{DartmouthGreen}{rgb}{0,0.4392,0.2353} % RGB (0, 112, 60)
\definecolor{Violet}{rgb}{0.498,0,1} % RGB (127, 0, 255)
\definecolor{ClassicRose}{rgb}{0.9843,0.8,0.9059} % RGB (251, 204, 231)

% Internal commands
\newcommand{\missa@style}{leaflet} % default style
\newcommand{\missa@litcolor}{DartmouthGreen} % liturgical colour
\newcommand{\missa@titlecolor}{white} % title colour
\newcommand{\missa@rite}{roman} % rite

% Options
\DeclareOptionX{leaflet}{}
\DeclareOptionX{booklet}{\renewcommand{\missa@style}{booklet}}
\DeclareOptionX{biblerefstyle}[jerusalem]{\biblerefstyle{#1}}

\define@choicekey+{missa.cls}{litcolor}[\val\nr]{%
green,violet,white,red,rose,black}[green]{%
  \ifcase\nr\relax
    \renewcommand{\missa@litcolor}{DartmouthGreen}
  \or
    \renewcommand{\missa@litcolor}{Violet}
  \or
    \renewcommand{\missa@litcolor}{#1}
    \renewcommand{\missa@titlecolor}{black}
  \or
    \renewcommand{\missa@litcolor}{#1}
  \or
    \renewcommand{\missa@litcolor}{ClassicRose}
    \renewcommand{\missa@titlecolor}{black}
  \or
    \renewcommand{\missa@litcolor}{#1}
  \fi
}{%
  \ClassWarning{missa}{erroneous input ignored}%
}

\define@choicekey+{missa.cls}{rite}{roman,ambrosian}[roman]{%
  \renewcommand{\missa@rite}{#1}
}{%
  \ClassWarning{missa}{erroneous input ignored}%
}

\ProcessOptionsX

% Commands
\newcommand{\priest}[2][S]{\textcolor{\missa@litcolor}{#1}\nobreak\hspace{1em}#2}
\newcommand{\all}[2][T]{\textcolor{\missa@litcolor}{#1}\nobreak\hspace{1em}{\bfseries#2}}
\newcommand{\lector}[2][L]{\textcolor{\missa@litcolor}{#1}\nobreak\hspace{1em}#2}

\newcommand{\amen}{Amen.}
\newcommand{\kyrie}{Kyrie, el\'eison.}
\newcommand{\christe}{Christe, el\'eison.}
\newcommand{\alleluia}{Alleluia.}
\newcommand{\tbtg}{Rendiamo grazie a Dio.}

\newcommand{\gloria}{\input{gloria.tex}}
\newcommand{\creed}{\input{creed.tex}}
\newcommand{\sanctus}{\input{sanctus.tex}}


\newcommand{\silence}{\textcolor{\missa@litcolor}{\footnotesize\itshape(Pausa di silenzio)}}
\newcommand{\otherwise}{\textcolor{\missa@litcolor}{\footnotesize\itshape Oppure:}}

\newcommand{\R}{\textcolor{\missa@litcolor}{\bfseries R}}

\newcommand{\reference}[1]{{\footnotesize#1}}
\newcommand{\cantemus}[1]{CD~#1}

\LoadClass[11pt]{article}

% Input style
\RequirePackage{missa\missa@style}

% Paragraphs: no indent
\setlength{\parindent}{0pt}
