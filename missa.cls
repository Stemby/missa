% missa.cls
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{missa}

%\RequirePackage{ifthen}
%\RequirePackage[a4paper]{geometry}[2010-02-12] % I have to declare a page format: why?
%\RequirePackage{color}

\newcommand{\missa@style}{leaflet} % default style

\DeclareOption{leaflet}{}
\DeclareOption{booklet}{\renewcommand{\missa@style}{booklet}}
\ProcessOptions\relax

% Input style
\input{missa\missa@style.def}

% Paragraphs: no indent
\setlength{\parindent}{0pt}