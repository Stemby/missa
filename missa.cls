% missa.cls
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{missa}

\RequirePackage{xkeyval}
%\RequirePackage{ifthen}
\RequirePackage[a5paper]{geometry}[2010-02-12] % I have to declare a page format: why?
\RequirePackage{color}
\RequirePackage[staffsize=15.87]{lilypond}

\definecolor{DartmouthGreen}{rgb}{0,0.4392,0.2353} % RGB (0, 112, 60)
\definecolor{Violet}{rgb}{0.498,0,1} % RGB (127, 0, 255)
\definecolor{ClassicRose}{rgb}{0.9843,0.8,0.9059} % RGB (251, 204, 231)

\newcommand{\missa@style}{leaflet} % default style
\newcommand{\missa@litcolor}{DartmouthGreen} % liturgical colour
\newcommand{\missa@rite}{roman} % rite

% Styles
\DeclareOptionX{leaflet}{}
\DeclareOptionX{booklet}{\renewcommand{\missa@style}{booklet}}

\define@choicekey+{missa.cls}{litcolor}[\val\nr]{%
green,violet,white,red,rose,black}[green]{%
  \ifcase\nr\relax
    \renewcommand{\missa@litcolor}{DartmouthGreen}
  \or
    \renewcommand{\missa@litcolor}{Violet}
  \or
    \renewcommand{\missa@litcolor}{#1}
  \or
    \renewcommand{\missa@litcolor}{#1}
  \or
    \renewcommand{\missa@litcolor}{ClassicRose}
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

\LoadClass[11pt]{article}

% Input style
\RequirePackage{missa\missa@style}

% Paragraphs: no indent
\setlength{\parindent}{0pt}
