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

% Header and footer
\usepackage{color}
\usepackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\rfoot{\color{gray} \footnotesize{Alex Cummaudo | {\bfseries \thepage}}}
\setlength{\footskip}{10pt}

% Semibold & Venturis Font
\usepackage[lf]{venturis} %% lf option gives lining figures as default;
              %% remove option to get oldstyle figures as default
\renewcommand*\familydefault{\sfdefault} %% Only if the base font of the document is to be sans serif

%%
%% RESUME COMMANDS
%%
\newcommand{\makeheader}[3]
{
    \begin{adjustwidth}{-1.2in}{0} % Moves the main header out by 1.2 inches for the section margins


        \parbox[b]{10cm}{{\Huge Software Engineer} \\ {\Large Alex Cummaudo}}
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
\newcommand{\Cpp}{C\nolinebreak\hspace{-.05em}\raisebox{.2ex}{\footnotesize\bf +}\nolinebreak\hspace{-.10em}\raisebox{.2ex}{\footnotesize\bf +}\hspace{0.1ex}}
\newcommand{\Csh}{C\nolinebreak\hspace{-.05em}\raisebox{.3ex}{\footnotesize\bf \#}\hspace{0.1ex}}