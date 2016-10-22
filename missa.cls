% missa.cls
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{missa}

% Load article class
\LoadClass[11pt]{article}

% Packages
\RequirePackage{xkeyval}
\RequirePackage[a5paper]{geometry}[2010-02-12] % I have to declare a page format: why?
\RequirePackage{color}
\RequirePackage{pict2e}[2009/06/01] % for response sign
\RequirePackage{bbding} % for cross
\RequirePackage[jerusalem]{bibleref}
\RequirePackage{verse}
\RequirePackage[staffsize=15.87,between-system-space=16]{lilypond}
\RequirePackage{fixltx2e} % for \MakeRobust
\RequirePackage{adforn} % for ornament break

% New colours
\definecolor{DartmouthGreen}{rgb}{0,0.4392,0.2353} % RGB (0, 112, 60)
\definecolor{Violet}{rgb}{0.498,0,1} % RGB (127, 0, 255)
\definecolor{ClassicRose}{rgb}{0.9843,0.8,0.9059} % RGB (251, 204, 231)

% Internal commands
\newcommand{\missa@style}{leaflet} % default style
\newcommand{\missa@litcolor}{DartmouthGreen} % liturgical colour
\newcommand{\missa@titlecolor}{white} % title colour
\newcommand{\missa@rite}{roman} % rite

% Response sign
\newcommand\Response{{%
\setbox0\hbox{R}
\unitlength\ht0
\picture(0,0)\linethickness{.075\unitlength}
\polyline(0.2,-0.3)(.7,1.2)(0.2,1.35)
\endpicture\box0}}

% Ornament break
\newcommand{\ornamentbreak}{%
    \begin{center}
    \textcolor{\missa@litcolor}{\adforn{21}\adforn{10}\adforn{49}}
    \end{center}%
}

% \makecolorbox and \framecolorbox
\RequirePackage{xparse,calc}
\DeclareDocumentCommand\makecolorbox{o m O{\width} O{c} m}{%
  \IfNoValueTF{#1}{\colorbox{#2}}{\colorbox[#1]{#2}}%
    {\makebox[#3][#4]{#5}}}
\DeclareDocumentCommand\framecolorbox{o m m O{\width} O{c} m}{%
  \IfNoValueTF{#1}{\fcolorbox{#2}{#3}}{\fcolorbox[#1]{#2}{#3}}%
    {\makebox[#4][#5]{#6}}}

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
\MakeRobust{\bibleverse}
\MakeRobust{\footnote}
\MakeRobust{\linebreak}
\newcommand{\moment}[2][]{\subsection{#2\put@reference{#1}}}
\newcommand{\singing}[1][]{\textcolor{\missa@litcolor}{\footnotesize\itshape In canto:}\put@reference{#1}}
\DeclareRobustCommand\put@reference[1]{%
  {\unskip\nobreak\hfil\penalty50 \hspace{2em}\null\nobreak\hfil
   \mbox{\color{black}\normalfont\reference{#1}}%
   \parfillskip=0pt \par}}

\newcommand{\priest}[2][S]{\textcolor{\missa@litcolor}{#1}\nobreak\hspace{1em}#2}
\newcommand{\all}[2][T]{\textcolor{\missa@litcolor}{#1}\nobreak\hspace{1em}{\bfseries#2}}
\newcommand{\lector}[2][L]{\textcolor{\missa@litcolor}{#1}\nobreak\hspace{1em}#2}
\newcommand{\bride}[2][Sposa]{\textcolor{\missa@litcolor}{#1}\nobreak\hspace{1em}{\bfseries#2}}
\newcommand{\groom}[2][Sposo]{\textcolor{\missa@litcolor}{#1}\nobreak\hspace{1em}{\bfseries#2}}
\newcommand{\bridegrooms}[2][Sposi]{\textcolor{\missa@litcolor}{#1}\nobreak\hspace{1em}{\bfseries#2}}

\newcommand{\infshs}{Nel nome del Padre, del Figlio e dello Spirito~Santo.} % In the name of the Father, and of the Son, and of the Holy Spirit.
\newcommand{\tlbwy}{Il Signore sia con voi.} % The Lord be with you.
\newcommand{\aawy}{E con il tuo spirito.} % And also with you.
\newcommand{\luyh}{In alto i nostri cuori.} % Lift up your hearts.
\newcommand{\wltuthl}{Sono rivolti al Signore.} % We lift them up to the Lord.
\newcommand{\lugtttlog}{Rendiamo grazie al Signore nostro Dio.} % Let us give thanks to the Lord, our God.
\newcommand{\iirtghtap}{È cosa buona giusta.} % It is right to give him thanks and praise. % It doesnt' work (encoding problem with È)
\newcommand{\amen}{Amen.}
\newcommand{\kyrie}{Kyrie, el\'eison.}
\newcommand{\threekyrie}{Kyrie el\'eison, Kyrie el\'eison, Kyrie el\'eison.}
\newcommand{\christe}{Christe, el\'eison.}
\newcommand{\alleluia}{Alleluia.}
\newcommand{\lup}{Preghiamo.} % Let us pray.
\newcommand{\twotl}{Parola di Dio.} % The Word of the Lord.
\newcommand{\tbtg}[1][.]{Rendiamo grazie a Dio#1} % Thanks be to God!
\newcommand{\gtyl}{Gloria a te, o Signore.} % Glory to you, Lord!
\newcommand{\tgotl}{Parola del Signore.} % The Gospel of the Lord.
\newcommand{\ptyljc}{Lode a te, o Cristo.} % Praise to you, Lord Jesus Christ!
\newcommand{\tcol}{Per Cristo nostro Signore.} % Through Christ our Lord.
\newcommand{\wpyawgyt}{Noi ti lodiamo e ti rendiamo grazie.} % We praise you and we give you thanks.

\newcommand{\intercession}[2][prega]{{\bfseries#2 \hfill #1 per noi}}

\newcommand{\blessing}{Vi benedica Dio onnipotente, Padre e Figlio \cross e Spirito Santo.} % May almighty God bless you, the Father, and the Son, and the Holy Spirit.

\newcommand{\gloria}{\input{prayers/gloria.tex}}
\newcommand{\creed}{\input{prayers/creed.tex}}
\newcommand{\sanctus}{\input{prayers/sanctus.tex}}
\newcommand{\sanctusla}{\input{prayers/sanctus-la.tex}}
\newcommand{\ourfather}{\input{prayers/ourfather.tex}}

\newcommand{\reading}[1][]{\input{readings/reading#1.tex}}
\newcommand{\gospel}[1][]{\input{readings/gospel#1.tex}}

\newcommand{\summary}[1]{\textcolor{\missa@litcolor}{\footnotesize#1}}
\newcommand{\commentary}[1]{{\footnotesize\itshape#1}}

\newcommand{\silence}{\textcolor{\missa@litcolor}{\footnotesize(\textit{Pausa~di~silenzio})}}
\newcommand{\otherwise}{\textcolor{\missa@litcolor}{\footnotesize\itshape Oppure:}}
\newcommand{\afterwards}{\textcolor{\missa@litcolor}{\footnotesize\itshape A seguire:}}
\newcommand{\petitions}{\textcolor{\missa@litcolor}{\footnotesize(\textit{Altre~intenzioni})}}

\newcommand{\R}{\textcolor{\missa@litcolor}{\normalfont\bfseries \Response}}
\newcommand{\cross}{\textcolor{\missa@litcolor}{\Cross}{ }}

\newcommand{\reference}[1]{{\footnotesize#1}}
\newcommand{\cantemus}[1]{CD~#1}

\renewcommand{\thefootnote}{\fnsymbol{footnote}}

% Environments
\setlength{\leftmargini}{0pt}
\newenvironment{lyrics}
  {\setlength{\vindent}{2em}
    \begin{verse}
  }
  {\end{verse}}

\newenvironment{refrain}
  {\setlength{\leftmargini}{2em}
    \setlength{\vleftskip}{1em}
    \itshape
    \begin{verse}
    \flagverse{\R}
  }
  {\end{verse}
    \setlength{\leftmargini}{0pt}
  }

% Input style
\RequirePackage{missa\missa@style}

% Paragraphs: no indent
\setlength{\parindent}{0pt}
\addtolength{\parskip}{0.4ex plus 0.1ex minus 0.1ex}
