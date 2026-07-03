%%
%% Customizações do abnTeX2 para a Universidade Estadual de Montes Claros - Unimontes
%% Adaptado para Curso de Graduação em Sistemas de Informação (Resolução CEPEX 182)
%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{unimontes-si-abntex2}[2026/03/05 v1.3 Modelo Unimontes adaptado para SI e CEPEX 182]

\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{abntex2}%
}
\ProcessOptions\relax
\LoadClass{abntex2}

% ---
% ALTERANDO A CAPA
% ---
\renewcommand{\imprimircapa}{%
  \begin{capa}%
    \vspace*{-1cm}\hspace*{-1.5cm} 
    {\mbox{\begin{minipage}{2cm}
        \centerline{\includegraphics[scale=0.22]{Images/estadominas.jpeg}}
    \end{minipage}}} \hspace{-.6cm} 
    \begin{minipage}{11.5cm}
        \begin{center}
            {\textbf{\large Universidade Estadual de Montes Claros}}\\
            {\textsc{\small Centro de Ci\^{e}ncias Exatas e Tecnol\'{o}gicas}}\\
            {\textsc{\small Curso de Bacharelado em Sistemas de Informa\c{c}\~{a}o}}\\
        \end{center}
    \end{minipage}
    {\mbox{\begin{minipage}{2cm}
        \centerline{\includegraphics[scale=0.065]{Images/unimontes.png}}
    \end{minipage}}} 

    \vspace{2cm}
    \center
    {\ABNTEXchapterfont\large\imprimirautor}
    \vfill
    \begin{center}
        \ABNTEXchapterfont\bfseries\LARGE\imprimirtitulo
    \end{center}
    \vfill
    \large\imprimirlocal
    \par
    \large\imprimirdata
    \vspace*{1cm}
  \end{capa}
}

% ---
% Novo list of para QUADROS
% ---
\newcommand{\quadroname}{Quadro}
\newcommand{\listofquadrosname}{Lista de quadros}
\newfloat[chapter]{quadro}{loq}{\quadroname}
\newlistof{listofquadros}{loq}{\listofquadrosname}
\newlistentry{quadro}{loq}{0}
\setfloatadjustment{quadro}{\centering}
\counterwithout{quadro}{chapter}
\renewcommand{\cftquadroname}{\quadroname\space} 
\renewcommand*{\cftquadroaftersnum}{\hfill--\hfill}
\setfloatlocations{quadro}{hbtp}

% ---
% FOLHA DE ROSTO (Adequada à CEPEX 182)
% ---
\makeatletter
\renewcommand{\folhaderostocontent}{
  \begin{center}
    % Autor em Caixa Alta e Negrito
    {\ABNTEXchapterfont\large\textbf{\MakeUppercase{\imprimirautor}}}

    \vspace*{\fill}\vspace*{\fill}

    % Título em Caixa Alta e Negrito
    \begin{center}
        \ABNTEXchapterfont\bfseries\Large\MakeUppercase{\imprimirtitulo}
    \end{center}

    \vspace*{\fill}

    \abntex@ifnotempty{\imprimirpreambulo}{%
      \hspace{.45\textwidth}
      \begin{minipage}{.5\textwidth}
          \SingleSpacing
          \imprimirpreambulo
      \end{minipage}%
      \vspace*{\fill}
    }%

    \hspace{.45\textwidth}
    \begin{minipage}{.5\textwidth}
        \SingleSpacing
        {\imprimirorientadorRotulo~\imprimirorientador\par}
    \end{minipage}%
 
    \abntex@ifnotempty{\imprimircoorientador}{%
        \hspace{.45\textwidth}
        \begin{minipage}{.5\textwidth}
            {\imprimircoorientadorRotulo~\imprimircoorientador}%
        \end{minipage}%
    }%

    \vspace*{\fill}

    {\large\imprimirlocal}
    \par
    {\large\imprimirdata}
    \vspace*{1cm}
  \end{center}
}
\makeatother