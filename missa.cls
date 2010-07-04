%missa.cls
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{missa}

\LoadClass[11pt,draft]{article}
%\LoadClass[11pt]{article}

% No page numbers
\pagestyle{empty}

\newcommand{\m@rgin}{1.5cm}

\RequirePackage[b4j,landscape,margin={\m@rgin}]{geometry}[2010-02-12]

\RequirePackage{color}

\RequirePackage{flowfram}
\newflowframe[1]{101.33mm}{\textheight}{0pt}{0pt}[E]
\newflowframe[1]{111.33mm}{\textheight}{111.33mm}{0pt}[F]
%\newflowframe[1]{101.33mm}{\textheight}{222.66mm}{0pt}[A]
\newflowframe[2]{101.33mm}{\textheight}{0pt}{0pt}[B]
%\newflowframe[2]{111.33mm}{\textheight}{111.33mm}{0pt}[C]
%\newflowframe[2]{101.33mm}{\textheight}{222.66mm}{0pt}[D]

\insertvrule{flow}{1}{flow}{2}
%\insertvrule{flow}{2}{flow}{3}
%\insertvrule{flow}{4}{flow}{5}
%\insertvrule{flow}{5}{flow}{6}

% Paragraphs: no indent
\setlength{\parindent}{0pt}