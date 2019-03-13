% =========================================================================
% resume.cls --- Formatting for simple sectioned resume style
%.           --- Compiled by Alex Cummaudo, 2013.
% =========================================================================
\typeout{Document Class `Alex Cummaudo Resume' <Modified: 2018, Alex Cummaudo>.}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}[2019/03/10]

%%
%% BASE CLASS
%%
\LoadClass[11pt]{article}

%%
%% RESTRICTED GEOMETRY
%%
\RequirePackage[top=0.7in, bottom=0.7in, right=0.6in, left=0.6in]{geometry}
\RequirePackage{changepage}

%%
%% ADDED PACKAGES
%%
\RequirePackage{xcolor}
\RequirePackage{titlesec}
\usepackage{hyperref}
\usepackage{bold-extra}
\usepackage{calc}
\usepackage{multicol}
\usepackage{fontawesome}
\usepackage{etoolbox}

%%
%% BASELINE STRETCH
%%
\usepackage{setspace}
\renewcommand{\baselinestretch}{1.2}

%%
%% RESUME SETTINGS
%%

% Set default color
\definecolor{defaultfontcolor}{rgb}{0.15, 0.15, 0.15}
\color{defaultfontcolor}
% Pastel theme
\definecolor{themepurple}{HTML}{8B4393}
\definecolor{themeblue}{HTML}{459BD6}
\definecolor{themegreen}{HTML}{77B956}
\definecolor{themered}{HTML}{CE4845}
\definecolor{themeorange}{HTML}{F3BB4B}
\definecolor{themeyellow}{HTML}{E6883B}

% Don't indent any paragraphs
\setlength\parindent{0pt} 
% Make sections bold and inside the left margin
\titleformat{\section}{
  \large\center\bfseries
}{}{0pt}{
  \color{theme}
  \rule{0.75\textwidth}{1pt}\\
  \faChevronRight{}~~} 
\titleformat{\subsection}{
  \footnotesize\bfseries\color{gray}
}{}{0pt}{\MakeUppercase}

% Push in section headers by an inch
\titlespacing{\section}{0mm}{0mm}{0mm}
\titlespacing{\subsection}{0mm}{0mm}{1pt}

% Kill itemize spacing
\usepackage{enumitem}
\setlist[itemize]{leftmargin=*}

% Shrink spacing
\let\OLDitemize\itemize
\renewcommand\itemize{\OLDitemize\addtolength{\itemsep}{-0.4em}}

% Make item dot points a chevron
\def\chevron{{\large\textcolor{theme}{\faChevronCircleRight}}}
\def\labelitemi{\chevron}
\def\themeddotfill{{\tiny\textcolor{theme}{\dotfill}}}

% Header and footer
\usepackage{color}
\usepackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\footnotesize
\rfoot{\color{gray} \footnotesize{Alex Cummaudo | {\bfseries \thepage}}}
\setlength{\footskip}{10pt}

% Semibold & Venturis Font
\usepackage[sfdefault,light]{roboto}
\usepackage[T1]{fontenc}

%%
%% RESUME COMMANDS
%%
\makeatletter
\def\@maketitle{%
  \begin{minipage}[b][][t]{\linewidth}
    \begin{minipage}[t]{0.4\linewidth}
      \vspace{-7.5mm}
      {\Huge \bfseries \@author \smallskip}\\
      {\Large \@title}
    \end{minipage}
    \begin{minipage}[t]{0.6\linewidth}  
      \hfill
      \small
      \color{darkgray}
      \begin{tabular}{lc}
          \ifdefempty{\phone}{\\}{
          \phone{} & \textcolor{themegreen}{\large \faPhone}\\
          }
          \location{} & \textcolor{themeyellow}{\large \faMapMarker}\\
          \postnominals{} & \textcolor{themeorange}{\large \faGraduationCap}
      \end{tabular}
      \begin{tabular}{lc}
          \email{} & \textcolor{themered}{\large \faEnvelope}\\
          \website{} & \textcolor{themepurple}{\large \faShareSquare}\\
          \linkedin{} & \textcolor{themeblue}{\large \faLinkedin}
      \end{tabular}
    \end{minipage}
  \end{minipage}
  \vspace{-8mm}
}
\makeatother

%%
%% EXTRAS
%%
% Dates
\newcommand{\singledate}[2]{\footnotesize\bfseries\textcolor{theme}{\uppercase{#1}}}
\newcommand{\daterange}[2]{\footnotesize\bfseries\textcolor{theme}{\uppercase{{#1}--{#2}}}}

% Pretty C++/C# Commands
\usepackage{relsize}
\newcommand{\Cpp}{C\nolinebreak\hspace{-.025em}\raisebox{.1ex}{\footnotesize ++}\hspace{0.1ex}}
\newcommand{\Csh}{C\nolinebreak\hspace{-.025em}\raisebox{.1ex}{\footnotesize \#}\hspace{0.1ex}}

% Tag
\usepackage{tikz}
\usetikzlibrary{positioning}
\definecolor{tagcolor}{rgb}{0.122, 0.435, 0.698}
\tikzstyle{tagstyle} = [
  fill=tagcolor,
  text=white,
  inner sep=.5em,
  anchor=text,
  text centered,
  rectangle,
  rounded corners=.25em,
  minimum height=15pt,
  right=0.1ex
]
\def \tagsepsize {0.8ex}
\newcommand\tag[2][]{\tikz[overlay]\node[tagstyle,#1] {\textcolor{white}{#2}};\phantom{#2}\hspace{2.0ex}}
\tikzstyle{headtagstyle} = [
  fill=white,
  text=gray,
  inner sep=.5em,
  anchor=text,
  text centered,
  rectangle,
  rounded corners=.25em,
  minimum height=15pt,
  right=0.1ex
]
\newcommand\taghead[2][]{\tikz[overlay]\node[headtagstyle,#1] {\bfseries #2};\phantom{#2}\hspace{1.0ex}}

%%
%% SECTION COMMANDS
%%
\newcommand{\award}[2] {
  {\fontseries{b} \normalsize #1}
  {\small #2}\\
}
\newcommand{\education}[6] {
  \chevron{} {\fontseries{b} \normalsize #1 ~ \daterange{#2}{#3}}\\
  {\small #4}\\
  {\footnotesize #5}

  \smallskip
}
\newcommand{\job}[6] {
  {\fontseries{b} \normalsize #4 ~ \daterange{#2}{#3}}\\
  {
    \small
    #1
    %{\footnotesize #5}
    \begin{multicols}{2}
      \raggedright
      \subsection{Responsibilities}
      \begin{itemize}
        #5
      \end{itemize}
      \subsection{Achievements}
      \begin{itemize}
        #6
      \end{itemize}
    \end{multicols}
  }
  \smallskip
}
\newcommand{\project}[5] {
  {\fontseries{b} \normalsize #1}\\
  {
    \small
    {\scriptsize #3 \small \dotfill #4}\vspace{6pt}
    \begin{itemize}
      #5
    \end{itemize}
  }
}
\newcommand{\publication}[5] {
  {\fontseries{b} \normalsize #1 \hfill \singledate{#2} }\\
  {
    \small
    {\small \textit{#3} \\ \footnotesize #4 \\ \scriptsize DOI: \href{http://doi.org/#5}{#5} }
  }
}
\newcommand{\tagsep} {
  \vspace{\tagsepsize}\\
}
\newcommand{\skillset}[2] {
  {
    \vspace{0.6ex}\\{\mdseries #2}
  }
}