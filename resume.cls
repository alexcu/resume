% =========================================================================
% resume.cls --- Formatting for simple sectioned resume style
%.           --- Compiled by Alex Cummaudo, 2013.
% =========================================================================
\typeout{Document Class `Alex Cummaudo Resume' <Modified: 2018, Alex Cummaudo>.}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}[2018/09/18]

%%
%% BASE CLASS
%%
\LoadClass[11pt]{article}

%%
%% RESTRICTED GEOMETRY
%%
\RequirePackage[top=0.8in, bottom=0.8in, right=0.8in, left=2in]{geometry}
\RequirePackage{changepage}

%%
%% ADDED PACKAGES
%%
\RequirePackage{xcolor}
\RequirePackage{titlesec}
\usepackage{hyperref}
\usepackage{bold-extra}
\usepackage{calc}

%%
%% BASELINE STRETCH
%%
\usepackage{setspace}
\renewcommand{\baselinestretch}{1.1}

%%
%% RESUME SETTINGS
%%
% Don't indent any paragraphs
\setlength\parindent{0pt} 
% Make sections bold and inside the left margin
\titleformat{\section}[leftmargin]{\bfseries}{}{}{} 
% Push in section headers by an inch
\titlespacing*{\section}{1.2in}{3mm}{0mm}

% Kill itemize spacing
\usepackage{enumitem}
\setlist[itemize]{leftmargin=*}

% Shrink spacing
\let\OLDitemize\itemize
\renewcommand\itemize{\OLDitemize\addtolength{\itemsep}{-0.4em}}

% Make item dot points a chevron
\definecolor{labelitemcolor}{rgb}{0.6,0.6,0.6}
\def\labelitemi{\color{labelitemcolor}>}

% Set default color
\definecolor{defaultfontcolor}{rgb}{0.15, 0.15, 0.15}
\color{defaultfontcolor}

% Header and footer
\usepackage{color}
\usepackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
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
  % Moves the main header out by 1.2 inches for the section margins
  \begin{adjustwidth}{-1.2in}{0}
    \parbox[b]{10cm}{{\Huge\bfseries \@author} \\ {\Large \@title}}
    \hfill
    % You may need to adjust 2.42cm
    \parbox[b]{5cm}{\flushright{\small \phone \\ \email \\ \website}}\\ 

    \vspace{-10mm}

    \begin{center}
      \line(1,0){\linewidth} % Adds a horizontal line
    \end{center}

  \end{adjustwidth}
}
\makeatother

%%
%% EXTRAS
%%
% Pretty C++/C# Commands
\usepackage{relsize}
\newcommand{\Cpp}{C\nolinebreak\hspace{-.025em}\raisebox{.1ex}{\footnotesize\bf ++}\hspace{0.1ex}}
\newcommand{\Csh}{C\nolinebreak\hspace{-.025em}\raisebox{.1ex}{\footnotesize\bf \#}\hspace{0.1ex}}

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
\newcommand{\award}[4] {
  {\fontseries{b} \normalsize #1 \hfill #4}

  {\small #2}\\
  {\footnotesize Awarded by #3}
  \bigskip
}
\newcommand{\education}[6] {
  {\fontseries{b} \normalsize #1 \hfill {#2}--{#3}}\\
  {\small #4}\\
  {\footnotesize #5}
  
  {\scriptsize #6}
  \bigskip
}
\newcommand{\job}[6] {
  {\fontseries{b} \normalsize #1 \hfill {#2}--{#3}}\\
  {
    \small
    #4\\
    {\footnotesize #5}
    \begin{itemize}
      #6
    \end{itemize}
  }
  \bigskip
}
\newcommand{\project}[5] {
  {\fontseries{b} \normalsize #1 \hfill #2 }\\
  {
    \small
    {\scriptsize #3 \small \hfill #4}\vspace{6pt}
    \begin{itemize}
      #5
    \end{itemize}
  }
  \bigskip
}
\newcommand{\publication}[5] {
  {\fontseries{b} \normalsize #1 \hfill #2 }\\
  {
    \small
    {\small \textit{#3} \\ \footnotesize #4 \\ \scriptsize DOI: \href{http://doi.org/#5}{#5} }
  }
  \bigskip
}
\newcommand{\tagsep} {
  \vspace{\tagsepsize}\\
}
\newcommand{\skillset}[2] {
  {
    \\\textcolor{gray}{\footnotesize \uppercase \bfseries #1}\vspace{0.6ex}\\
    {\mdseries #2}
  }
}