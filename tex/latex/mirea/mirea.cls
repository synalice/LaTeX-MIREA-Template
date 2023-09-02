\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mirea}[2023/04/17 Класс-шаблон для отчетов для МИРЭА]
\LoadClass[14pt]{extreport}

% Шрифт Times New Roman и моно
\RequirePackage{fontspec}
\setmainfont{Times New Roman}
\setmonofont[Scale=0.8]{JetBrains Mono}
% Отступы по ГОСТУ
\RequirePackage[
	a4paper,
	top=2cm,
	bottom=2cm,
	left=3cm,
	right=1.5cm,
]{geometry}
% Поддержка русского языка
\RequirePackage[russian]{babel}
% Содержание обычным шрифтом
\RequirePackage[titles]{tocloft}
\renewcommand\cftchapfont{\mdseries}
\renewcommand\cftchappagefont{\mdseries}
% Точки в содержании для \chapter
\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}}
% Переименовывание "оглавления" в "содержание", поцентру и жирным
\addto\captionsrussian{\renewcommand{\contentsname}{\hfill\textbf{СОДЕРЖАНИЕ}\hfill}}
% Убрать горизонтальные и вертикальные отступы в содержании
\setlength{\cftbeforechapskip}{0pt}
\setlength{\cftsecindent}{0pt}
\setlength{\cftsubsecindent}{0pt}
\setlength{\cftsubsubsecindent}{0pt}
% Убрать отступы в содержании на новой строке у длинных заголовков
\setlength{\cftchapnumwidth}{0pt}
\renewcommand{\cftchapaftersnumb}{\hspace{1.5em}}
\setlength{\cftsecnumwidth}{0pt}
\renewcommand{\cftsecaftersnumb}{\hspace{2.3em}}
\setlength{\cftsubsecnumwidth}{0pt}
\renewcommand{\cftsubsecaftersnumb}{\hspace{3.2em}}
\setlength{\cftsubsubsecnumwidth}{0pt}
\renewcommand{\cftsubsubsecaftersnumb}{\hspace{4.1em}}
% Добавить больше точек в содержании
\renewcommand{\cftdotsep}{3}
% Стили заголовков
% https://www.overleaf.com/learn/latex/Sections_and_chapters#titlesec_commands
\RequirePackage[compact]{titlesec}
\titleformat{\chapter}[block]{\bfseries\normalsize}{\thechapter}{0.5em}{\centering}
\titlespacing{\chapter}{0pt}{-1cm}{0pt}
\titleformat{\section}[block]{\bfseries\normalsize}{\hspace{1.25cm}\thesection}{0.5em}{}
\titlespacing{\section}{0pt}{0pt}{0pt}
\titleformat{\subsection}[block]{\bfseries\normalsize}{\hspace{1.25cm}\thesubsection}{0.5em}{}
\titlespacing{\subsection}{0pt}{0pt}{0pt}

\titleformat{name=\chapter,numberless}[block]{\bfseries\normalsize}{}{0em}{\centering}
\titlespacing{name=\chapter,numberless}{0pt}{-1cm}{0pt}
\titleformat{name=\section,numberless}[block]{\bfseries\normalsize}{\hspace{1.25cm}}{0em}{}
\titlespacing{name=\section,numberless}{0pt}{0pt}{0pt}
\titleformat{name=\subsection,numberless}[block]{\bfseries\normalsize}{\hspace{1.25cm}}{0em}{}
\titlespacing{name=\subsection,numberless}{0pt}{0pt}{0pt}

% Полуторный отступ между строками. \RequirePackage[onehalfspacing]{setspace} выставляет не совсем то расстояние мужду строк, подробнее: https://tex.stackexchange.com/questions/65849/confusion-onehalfspacing-vs-spacing-vs-word-vs-the-world
\renewcommand{\baselinestretch}{1.5}
% Делать отступ для первого абзатца
\RequirePackage{indentfirst}
% Размер отступов абзатцей
\setlength{\parindent}{1.25cm}
% Для вставки изображений
\RequirePackage{graphicx}
% Футер для титульника
\RequirePackage{fancyhdr}
\fancypagestyle{titlepagefooter}{
	\renewcommand{\headrulewidth}{0pt}
	\fancyfoot[C]{Москва \the\year}
}
\renewcommand{\headrulewidth}{0pt}
% Для поля подписи в титульнике
\RequirePackage{amsmath}
% Убирает номер заголовка из нумераций
\RequirePackage{chngcntr}
\counterwithout{equation}{chapter}
\counterwithout{table}{chapter}
\counterwithout{figure}{chapter}
% Настройка формата подписей к таблицам и рисункам
\RequirePackage{caption}
\captionsetup[table]{labelsep=endash,format=hang,singlelinecheck=false,font={stretch=1}}
\captionsetup[figure]{labelsep=endash,format=hang,name=Рисунок,font={stretch=1}}
% Переименуем список литературы
\addto{\captionsrussian}{\renewcommand{\bibname}{ИНФОРМАЦИОННЫЕ ИСТОЧНИКИ}}
% Добавим библиографию в содержание
\RequirePackage[nottoc,numbib]{tocbibind}
% Без этой строчки, при использовании пакета в основном файле,
% при компиляции появляется огромное кол-во ужасающих ошибок...
% ...я не имею ни малейшего понятия, откуда они, но добавление пакета здесь решает проблему
\RequirePackage{tikz}
% Делает правый край параграфов аккуратнее и крассивее
\RequirePackage{microtype}
% Чтобы текст не вылезал за пределы параграфа. Может вызывать ошебки,
% начинающиеся на "Underfull \hbox", но мы их смело игнорируем, визуально
% они никак не проявляются, связаны только с внутренней лаботой LaTeX.
\setlength{\emergencystretch}{100pt}
% Меняем нумерацию информационных источников с "[1]" на "1."
\renewcommand\@biblabel[1]{#1.}
% Единственные фото на странице должны быть сверху
\setlength{\@fptop}{0pt}
% Делаем внешний вид списков аналогичный параграфам
\RequirePackage{enumitem}
\setlist{
	nosep,
	labelindent=\parindent,
	leftmargin=0pt,
	align=left,
	labelwidth=0pt,
	itemindent=!
}
% В списках меняем точку на "–"
\renewcommand\labelitemi{--}
% Переназначим окружение \thebibliography, чтобы в неём были нужные отступы
\renewenvironment{thebibliography}[1]
{
	\chapter{\bibname}
	\list
	{
		\@biblabel{\@arabic\c@enumiv}
	}
	{
		\leftmargin0pt
		\labelwidth0pt
		\itemindent\parindent
		\itemsep0pt
		\parsep0pt
		\@openbib@code
		\usecounter{enumiv}
		\let\p@enumiv\@empty
		\renewcommand\theenumiv{\@arabic\c@enumiv}
	}
	\sloppy
	\clubpenalty4000
	\@clubpenalty
	\clubpenalty
	\widowpenalty4000
	\sfcode`\.\@m
}
{
	\def\@noitemerr
	{\@latex@warning{Empty `thebibliography' environment}}%
	\endlist
}

% Дефолтный стиль класса
\newif\ifinf
\DeclareOption{inf}{\inftrue}
% Благодаря данной строке, если ничего не указать в качестве опций класса (\documentclass[<опции>]{<класс>}), то будет использован стиль отчета по информатике 
\ExecuteOptions{inf}
% Меняем структуру документа, если нужна работа для Введения в професииональную деательность, вместо отчёта по информатике
\newif\ifvvpd
\DeclareOption{vvpd}{\vvpdtrue\inffalse}
% Меняем структуру документа, если нужен отчет по СИАОД, вместо отчёта по информатике
\newif\ifsiaod
\DeclareOption{siaod}{\siaodtrue\inffalse}
% Меняем структуру документа, если нужен отчет по Java, вместо отчёта по информатике
\newif\ifjava
\DeclareOption{java}{\javatrue\inffalse}
% Меняем структуру документа, если нужна работа без титульного листа и содержания
\newif\ifempty
\DeclareOption{empty}{\emptytrue\inffalse}
% Без данной строки указанные выше \DeclareOption не будут работать
\ProcessOptions\relax

% Отчёт по информатике
\ifinf
	% Переменные для титульного листа
	\newcommand\institution[1]{\def\@institution{#1}}
	\newcommand\faculty[1]{\def\@faculty{#1}}
	\newcommand\worktype[1]{\def\@worktype{#1}}
	\newcommand\workname[1]{\def\@workname{#1}}
	\newcommand\subject[1]{\def\@subject{#1}}
	\newcommand\examiner[1]{\def\@examiner{#1}}
	% Макро \@author и команда \author по умолчанию заданы ЛаТеКом, поэтому мы удалим их, чтобы, если пользователь шаблона не задал поле автора в своем файле, в титульном листе не отображались лишние строки текста.
	\let\@author\undefined
	\renewcommand\author[1]{\def\@author{#1}}
	% Вставляем в начала любого документа с этим шаблоном титульник и содержание
	\AtBeginDocument{
		\input{titlepage.tex}
		\tableofcontents
		% Пропускаем титульный лист, начинам отсчёт с цифры 2	
		\setcounter{page}{2}
	}
\fi

% Отчет для СИАОД
\ifsiaod
	% Междустрочный интервал в титульнике меньше, чем везде 
	\renewenvironment{titlepage}
	{
		\RequirePackage[onehalfspacing]{setspace}
	}{}
	% Переменные для титульного листа
	\newcommand\worknum[1]{\def\@worknum{#1}}
	\newcommand\topic[1]{\def\@topic{#1}}
	% Макро \@author и команда \author по умолчанию заданы ЛаТеКом, поэтому мы удалим их, чтобы, если пользователь шаблона не задал поле автора в своем файле, в титульном листе не отображались лишние строки текста.
	\let\@author\undefined
	\renewcommand\author[1]{\def\@author{#1}}
	% Вставляем в начала любого документа с этим шаблоном титульник и содержание
	\AtBeginDocument{
		\input{titlepage_siaod.tex}
		\tableofcontents
		% Пропускаем титульный лист, начинам отсчёт с цифры 2	
		\setcounter{page}{2}
	}
\fi

% Письменная работа по ВВПД
\ifvvpd
	% Междустрочный интервал в титульнике меньше, чем везде 
	\renewenvironment{titlepage}
	{
		\RequirePackage[onehalfspacing]{setspace}
	}{}
	% Переменные для титульного листа
	\newcommand\institution[1]{\def\@institution{#1}}
	\newcommand\faculty[1]{\def\@faculty{#1}}
	\newcommand\worktype[1]{\def\@worktype{#1}}
	\newcommand\topic[1]{\def\@topic{#1}}
	\newcommand\examiner[1]{\def\@examiner{#1}}
	% Макро \@author и команда \author по умолчанию заданы ЛаТеКом, поэтому мы удалим их, чтобы, если пользователь шаблона не задал поле автора в своем файле, в титульном листе не отображались лишние строки текста.
	\let\@author\undefined
	\renewcommand\author[1]{\def\@author{#1}}
	% Вставляем в начала любого документа с этим шаблоном титульник и содержание
	\AtBeginDocument{
		\input{titlepage_vvpd.tex}
		\tableofcontents
		% Пропускаем титульный лист, начинам отсчёт с цифры 2	
		\setcounter{page}{2}
	}
\fi

% Отчет для Java
\ifjava
% Междустрочный интервал в титульнике меньше, чем везде 
\renewenvironment{titlepage}
{
	\RequirePackage[onehalfspacing]{setspace}
}{}
% Переменные для титульного листа
\newcommand\teacher[1]{\def\@teacher{#1}}
\newcommand\group[1]{\def\@group{#1}}
% Макро \@author и команда \author по умолчанию заданы ЛаТеКом, поэтому мы удалим их, чтобы, если пользователь шаблона не задал поле автора в своем файле, в титульном листе не отображались лишние строки текста.
\let\@author\undefined
\renewcommand\author[1]{\def\@author{#1}}
% Вставляем в начала любого документа с этим шаблоном титульник и содержание
\AtBeginDocument{
	\input{titlepage_java.tex}
	\tableofcontents
	% Пропускаем титульный лист, начинам отсчёт с цифры 2	
	\setcounter{page}{2}
}
\fi

% Работа без титульного листа и содержания
\ifempty
\fi