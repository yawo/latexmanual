%%%%%%%%%%%%%%%  Identification

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{manual}[2016/12/20 manual class]



%%%%%%%%%%%%%% Options
\DeclareOption{ysmall}{%
	\setlength{\paperheight}{22cm}%
	\setlength{\paperwidth}{17cm}% 
}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\LoadClass{book}
%%%%%%%%%%%%%%% Preliminary declarations
\RequirePackage[utf8]{inputenc}
\RequirePackage{minitoc}
\RequirePackage{etoolbox}
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}
%\RequirePackage{quattrocento}
\RequirePackage[a4paper,bindingoffset=0.2in,%
left=5mm,right=10mm,top=15mm,bottom=10mm,%
footskip=.25in]{geometry}

\RequirePackage[francais]{babel}
\RequirePackage{fancyhdr}
\RequirePackage{graphicx}

\RequirePackage[rightcaption]{sidecap}
\RequirePackage[x11names]{xcolor}
\RequirePackage{tcolorbox}
\RequirePackage[explicit]{titlesec}




%%%%%%%%%%%%%%% More declarations
\pagestyle{fancy}
\renewrobustcmd{\headrulewidth}{0.2pt}
\renewrobustcmd{\sectionmark}[1]{\markright{#1}}
\lhead{\nouppercase{\rightmark}}
%\rhead{\nouppercase{\leftmark}}

\newlength\chapnumb
\setlength\chapnumb{4cm}
\newrobustcmd{\chaptertitlefont}{\fontsize{50}{110}\normalfont\sffamily}

\titleformat{\chapter}[block]
{\normalfont\sffamily}{}{0pt}
{\parbox[b]{\chapnumb}{%
		\fontsize{130}{140}\selectfont\bfseries\textcolor{SlateGray4}\thechapter}%
	\parbox[b]{\dimexpr\textwidth-\chapnumb\relax}{%
		\raggedleft%
		\hfill{\chaptertitlefont#1}\\
		\rule{\dimexpr\textwidth-\chapnumb\relax}{0.4pt}}}
\titleformat{name=\chapter,numberless}[block]
{\normalfont\sffamily}{}{0pt}
{\parbox[b]{\chapnumb}{%
		\mbox{}}%
	\parbox[b]{\dimexpr\textwidth-\chapnumb\relax}{%
		\raggedleft%
		\hfill{\chaptertitlefont#1}\\
		\rule{\dimexpr\textwidth-\chapnumb\relax}{0.4pt}}}

\titleformat
{\section}% command
[display]% shape
{\bfseries\Huge}% format
{ }% label
{0.5ex}% sep
{#1}% before-code
[]% after-code

	
\makeatletter
\renewrobustcmd\thesection{}
\renewrobustcmd{\thefigure}{}
\addto\captionsfrench{%
	\renewrobustcmd{\figurename}{}%
	\renewrobustcmd{\chaptername}{}%
}
\renewrobustcmd\thesubsection{\@arabic\c@section.\@arabic\c@subsection}
\makeatother	
\mtcselectlanguage{french}



% redef chapter
% > head, automatic numbering, minitoc,sumary
\newrobustcmd{\ychapter}[2]{%heading,summary
	\begin{minipage}[b]{\textwidth}
		\centering
		\chapter{#1}
	\end{minipage}

	\indent
	{\itshape #2}
	\hfill 
	\vspace{100pt}
	\begin{minipage}[b]{\textwidth}
		\centering
		\minitoc
	\end{minipage}


	\clearpage
}


% redef section
% > no header.


% def yqote
%\includegraphics[width=.5\paperwidth, height=.5\paperheight]{#2}
\graphicspath{ {images/} }
\newrobustcmd{\yquote}[4]{% name,image,quote,bio
	\section[#1]{}
	\begin{figure}
	
		\begin{tcolorbox}[width=\textwidth,colback=black,arc=2pt,auto outer arc]
			\centering
			\resizebox{.6\paperheight}{!}{%
			\includegraphics{#2}%	
			}
		\end{tcolorbox}		
		\caption{#3}
	\end{figure}
	\begin{center}
		\includegraphics[scale=.1]{yseparator}
	\end{center}
	\begin{center}
		{\textbf{\Huge #1}}
	\end{center}
	
	\vspace{20pt}
	\paragraph{\large #4}
	\clearpage
}

\newrobustcmd{\ypic}[2]{
	\begin{center}
		\vspace{30pt}
		\begin{tcolorbox}[width=.5\textwidth,colback=black,arc=2pt,auto outer arc]
			\centering
			\resizebox{.2\paperheight}{!}{%
				\includegraphics{#1}%	
			}
		\end{tcolorbox}		
		\caption{\textbf{\rmfamily #2}}
	
	\end{center}
	\vspace{30pt}
}



