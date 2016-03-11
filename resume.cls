\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}[2013/06/15 Alex's Resume Class]

%% BASE CLASS
\LoadClass[11pt]{article}

%% RESTRICTED GEOMETRY
\RequirePackage[top=0.8in, bottom=0.8in, right=0.8in, left=2in]{geometry}
\RequirePackage{changepage}

%% ADDED PACKAGES
\RequirePackage{xcolor}
\RequirePackage{titlesec}
\usepackage{hyperref}
\usepackage{bold-extra}
\usepackage{calc}

%% BASELINE STRETCH
\usepackage{setspace}
\renewcommand{\baselinestretch}{1}

%% RESUME SETTINGS
\setlength\parindent{0pt} % Don't indent any paragraphs
\titleformat{\section}[leftmargin]{\bfseries}{}{}{} % Make sections bold and inside the left margin
\titlespacing*{\section}{1.2in}{3mm}{0mm} % Push in section headers by an inch

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
\newcommand{\makeheader}[3]
{
    \begin{adjustwidth}{-1.2in}{0} % Moves the main header out by 1.2 inches for the section margins


        \parbox[b]{10cm}{{\Huge\bfseries Software Engineer} \\ {\Large Alex Cummaudo}}
        \hfill
        \parbox[b]{5cm}{\flushright{\small #1\\#2\\#3}}\\ % You may need to adjust 2.42cm
        %{\color{gray} \LARGE Resume}%

        \vspace{-10mm}

        \begin{center}
            \line(1,0){\linewidth} % Adds a horizontal line
        \end{center}

    \end{adjustwidth}
}

%%
%% EXTRAS
%%

%% PRETTY C++\C# COMMAND
\usepackage{relsize}
\newcommand{\Cpp}{C\nolinebreak\hspace{-.025em}\raisebox{.1ex}{\footnotesize\bf ++}\hspace{0.1ex}}
\newcommand{\Csh}{C\nolinebreak\hspace{-.025em}\raisebox{.1ex}{\footnotesize\bf \#}\hspace{0.1ex}}

%% TAG
\documentclass{article}
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
\newcommand\tag[2][]{\tikz[overlay]\node[tagstyle,#1] {#2};\phantom{#2}\hspace{1.0ex}}
