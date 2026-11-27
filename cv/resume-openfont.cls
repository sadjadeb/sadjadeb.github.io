% Intro Options
\ProvidesClass{resume-openfont}
\NeedsTeXFormat{LaTeX2e}
\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
    \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\LoadClass{article}
\pagenumbering{gobble}

%--------------------------------------------------------------
% Package Imports

\RequirePackage[english]{babel}
% page setup 
\RequirePackage{fancyhdr}
% Set boundaries
\RequirePackage[top=1.5cm, bottom=1cm, left=1.5cm, right=1.2cm]{geometry}
% remove ugly boxes around links
\usepackage[hidelinks]{hyperref}
% setup custom titles
\RequirePackage{titlesec}
% For skills table
\RequirePackage{enumitem}
% Using tables like the profile section
\RequirePackage{tabularx}
% make underlying constants: credits to Alex Beattie for noticing and suggesting fix
\RequirePackage{ulem}

% Needed to use icons from font-awesome
\RequirePackage{fontawesome5}

\usepackage{multicol}
\usepackage{xcolor}
\usepackage{tikz}
\usepackage{amsmath}

% Body gray; section/subsection titles stay black
\definecolor{bodytext}{HTML}{474747}
\definecolor{headingtext}{HTML}{000000}
\AtBeginDocument{\color{bodytext}}

% Set up font
\usepackage[default, type1]{sourcesanspro} 

%--------------------------------------------------------------
% Reformatting default sections
% section
\renewcommand{\section}[1]{
\vspace{9pt}
\hspace{-15pt}
\color{headingtext}\Large{\textbf{#1}}
\fontsize{11pt}{13pt}%
\selectfont
\color{bodytext}%
\hrulefill \\
\vspace{11pt}
\raggedright}

% remove header footer stuff like page numbers 
\newcommand{\resetHeaderAndFooter}{%
\fancyhf{}%
\fancyfoot{}%
\renewcommand{\headrulewidth}{0pt}%
\renewcommand{\footrulewidth}{0pt}%
}

% Command to simulate new line, to fix spacing glitches
\newcommand{\fakeNewLine}{\newline \vspace{-\baselineskip}}


%--------------------------------------------------------------
% Subheadings command - create different types of heading
\newcommand{\runsubsection}[1]{%
\fontsize{10pt}{13pt}%
\selectfont%
\color{headingtext}\bfseries%
#1%
\normalfont\color{bodytext}}%

\newcommand{\bulletheader}[1]{%
\fontsize{10pt}{12pt}%
\selectfont%
\color{headingtext}\bfseries%
#1%
\normalfont\color{bodytext}}%

% Descriptors command
\newcommand{\descript}[1]{%
\raggedright%
% \scshape%
\fontsize{10pt}{13pt}%
\selectfont{#1}%
\normalfont}

% Location command
\newcommand{\location}[1]{%
\raggedright%
\fontsize{10pt}{12pt}%
\selectfont{#1}%
\normalfont}


% Colored link command
\newcommand{\customLink}[2]{%
\href{#1}{\color[HTML]{2774F2}{#2}}%
}
% \newcommand{\customLink}[2]{%
% \href{#1}{\underline{#2}}%
% }

% Command for table 
\newcommand{\singleItem}[2]{\normalsize{\textbf{#1} #2}}
\newcommand{\doubleItem}[4]{\singleItem{#1}{#2} & \singleItem{#3}{#4}}

%--------------------------------------------------------------
% Section separators command
\newcommand{\sectionsep}[0]{\vspace{7pt}}

%--------------------------------------------------------------
% Bullet Lists with fewer gaps command
\newenvironment{bullets}[1][]
{
\vspace{-1mm}
\begin{itemize}[#1]
\fontsize{10pt}{13pt}\selectfont
\itemsep1pt 
\parskip1.5pt 
\parsep1.5pt
}
{
\end{itemize}
\vspace{-\topsep}
}