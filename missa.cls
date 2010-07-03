%missa.cls
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{missa}

%\LoadClass[11pt,draft]{article}
\LoadClass[11pt]{article}

% No page numbers
\pagestyle{empty}

\newcommand{\m@rgin}{1.5cm}

\RequirePackage[b4j,landscape,margin={\m@rgin}]{geometry}[2010-02-12]

\RequirePackage{color}

\RequirePackage{flowfram}
\setlength{\columnsep}{\m@rgin}
\ffvadjustfalse
\Ncolumn{3}
\insertvrule{flow}{1}{flow}{2}
\insertvrule{flow}{2}{flow}{3}

% Paragraphs: no indent
\setlength{\parindent}{0pt}