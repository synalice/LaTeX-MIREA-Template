\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mirearticle}[2023/02/12 Класс-шаблон для небольших работ, где функционал класса mirea избыточен]
\LoadClass[14pt]{extarticle}

% Шрифт Times New Roman и моно
\RequirePackage{fontspec}
\setmainfont{Times New Roman}
\setmonofont[Scale=0.8]{JetBrains Mono}
% Отступы по ГОСТУ
\RequirePackage[
	a4paper,
%	top=2cm,
%	bottom=2cm,
%	left=3cm,
%	right=1.5cm,
]{geometry}
% Поддержка русского языка
\RequirePackage[russian]{babel}
% Делать отступ для первого абзатца
\RequirePackage{indentfirst}