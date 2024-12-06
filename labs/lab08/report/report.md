---
## Front matter
title: "Отчет по лабораторной работе №8"
subtitle: "Дисциплина: архитектура компьютера"
author: "Горбунова Яна Сергеевна"

## Generic otions
lang: ru-RU
toc-title: "Содержание"

## Bibliography
bibliography: bib/cite.bib
csl: pandoc/csl/gost-r-7-0-5-2008-numeric.csl

## Pdf output format
toc: true # Table of contents
toc-depth: 2
lof: true # List of figures
lot: true # List of tables
fontsize: 12pt
linestretch: 1.5
papersize: a4
documentclass: scrreprt
## I18n polyglossia
polyglossia-lang:
  name: russian
  options:
	- spelling=modern
	- babelshorthands=true
polyglossia-otherlangs:
  name: english
## I18n babel
babel-lang: russian
babel-otherlangs: english
## Fonts
mainfont: IBM Plex Serif
romanfont: IBM Plex Serif
sansfont: IBM Plex Sans
monofont: IBM Plex Mono
mathfont: STIX Two Math
mainfontoptions: Ligatures=Common,Ligatures=TeX,Scale=0.94
romanfontoptions: Ligatures=Common,Ligatures=TeX,Scale=0.94
sansfontoptions: Ligatures=Common,Ligatures=TeX,Scale=MatchLowercase,Scale=0.94
monofontoptions: Scale=MatchLowercase,Scale=0.94,FakeStretch=0.9
mathfontoptions:
## Biblatex
biblatex: true
biblio-style: "gost-numeric"
biblatexoptions:
  - parentracker=true
  - backend=biber
  - hyperref=auto
  - language=auto
  - autolang=other*
  - citestyle=gost-numeric
## Pandoc-crossref LaTeX customization
figureTitle: "Рис."
tableTitle: "Таблица"
listingTitle: "Листинг"
lofTitle: "Список иллюстраций"
lotTitle: "Список таблиц"
lolTitle: "Листинги"
## Misc options
indent: true
header-includes:
  - \usepackage{indentfirst}
  - \usepackage{float} # keep figures where there are in the text
  - \floatplacement{figure}{H} # keep figures where there are in the text
---

# Цель работы

Приобретение навыков написания программ с использованием циклов и обработкой
аргументов командной строки.

# Задание

1. Реализация циклом в NASM
2. Обработка аргументов командной строки
3. Самостоятельное написание программы по материалам лабораторной работы

# Теоретическое введение

Стек — это структура данных, организованная по принципу LIFO («Last In — First Out»
или «последним пришёл — первым ушёл»). Стек является частью архитектуры процессора и
реализован на аппаратном уровне. Для работы со стеком в процессоре есть специальные
регистры (ss, bp, sp) и команды.
Основной функцией стека является функция сохранения адресов возврата и передачи
аргументов при вызове процедур. Кроме того, в нём выделяется память для локальных
переменных и могут временно храниться значения регистров.

# Выполнение лабораторной работы

## Реализация циклов в NASM

Создаю каталог для программ лабораторной работы №8 (рис. -@fig:001).

![Создание каталога](image/1.png){#fig:001 width=70%}

Копирую в созданный файл программу из листинга. (рис. -@fig:002).

![Копирование программы из листинга](image/2.png){#fig:002 width=70%}

Запускаю программу, она показывает работу циклов в NASM (рис. -@fig:003).

![Запуск программы](image/3.png){#fig:003 width=70%}

Заменяю программу изначальную так, что в теле цикла я изменяю значение регистра ecx (рис. -@fig:004).

![Изменение программы](image/4.png){#fig:004 width=70%}

Из-за того, что теперь регистр ecx на каждой итерации уменьшается на 2 значения, количество итераций уменьшается вдвое (рис. -@fig:005).

![Запуск измененной программы](image/5.png){#fig:005 width=70%}

Добавляю команды push и pop в программу (рис. -@fig:006).

![Добавление push и pop в цикл программы](image/6.png){#fig:006 width=70%}

Теперь количество итераций совпадает введенному N, но произошло смещение выводимых чисел на -1 (рис. -@fig:007).

![Запуск измененной программы](image/7.png){#fig:007 width=70%}

## Обработка аргументов командной строки

Создаю новый файл для программы и копирую в него код из следующего листинга (рис. -@fig:008).

![Копирование программы из листинга](image/8.png){#fig:008 width=70%}

Компилирую программу и запускаю, указав аргументы. Программой было обратоно то же количество аргументов, что и было введено (рис. -@fig:009).

![Запуск второй программы](image/9.png){#fig:009 width=70%}

Создаю новый файл для программы и копирую в него код из третьего листинга (рис. -@fig:010).

![Копирование программы из третьего листинга](image/10.png){#fig:010 width=70%}

Компилирую программу и запускаю, указав в качестве аргументов некоторые числа, программа их складывает (рис. -@fig:011).

![Запуск третьей программы](image/11.png){#fig:011 width=70%}

Изменяю поведение программы так, чтобы указанные аргументы она умножала, а не складывала (рис. -@fig:012).

![Изменение третьей программы](image/12.png){#fig:012 width=70%}

Программа действительно теперь умножает данные на вход числа (рис. -@fig:013).

![Запуск измененной третьей программы](image/13.png){#fig:013 width=70%}

## Задание для самостоятельной работы

Пишу программму, которая будет находить сумма значений для функции f(x) = 10x-4,
которая совпадает с моим девытым варинтом (рис. -@fig:014).

![Написание программы для самостоятельной работы](image/14.png){#fig:014 width=70%}

Код программы:
```NASM
%include 'in_out.asm'

SECTION .data
msg_func db "Функция: f(x) = 10(x - 1)", 0
msg_result db "Результат: ", 0

SECTION .text
GLOBAL _start

_start:
    mov eax, msg_func
    call sprintLF

    pop ecx         ; Получаем количество входных данных
    pop edx         ; Сохраняем какую-то дополнительную информацию
    sub ecx, 1      ; Уменьшаем количество на 1 (x - 1)
    mov esi, 0      ; Инициализация суммы результатов
    
next:
    cmp ecx, 0      ; Проверка, закончились ли входные данные
    jz _end
        
    pop eax         ; Получаем следующее значение x вперёд
    call atoi       ; Преобразуем строку в число

    sub eax, 1      ; Вычисление (x - 1)
    mov ebx, 10     ; Константа для умножения (10)

    mul ebx         ; Умножение на 10
    add esi, eax    ; Добавляем результат к сумме

    loop next       ; Переход к следующему элементу, если есть
  
_end: 
    mov eax, msg_result
    call sprint      ; Печатаем сообщение с результатом
    mov eax, esi     ; Перемещаем общую сумму в eax
    call iprintLF    ; Печатаем результат
    call quit        ; Завершаем программу
```

Проверяю работу программы, указав в качестве аргумента несколько чисел (рис. -@fig:015).

![Запуск программы для самостоятельной работы](image/15.png){#fig:015 width=70%}

# Выводы

В результате выполнения данной лабораторной работы я приобрела навыки написания программ с использованием циклов а также научилась обрабатывать аргументы командной строки.

# Список литературы

1. [Курс на ТУИС](https://esystem.rudn.ru/course/view.php?id=112)
2. [Лабораторная работа №8](https://esystem.rudn.ru/pluginfile.php/2089095/mod_resource/content/0/%D0%9B%D0%B0%D0%B1%D0%BE%D1%80%D0%B0%D1%82%D0%BE%D1%80%D0%BD%D0%B0%D1%8F%20%D1%80%D0%B0%D0%B1%D0%BE%D1%82%D0%B0%20%E2%84%968.%20%D0%9F%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5%20%D1%86%D0%B8%D0%BA%D0%BB%D0%B0.%20%D0%9E%D0%B1%D1%80%D0%B0%D0%B1%D0%BE%D1%82%D0%BA%D0%B0%20%D0%B0%D1%80%D0%B3%D1%83%D0%BC%D0%B5%D0%BD%D1%82%D0%BE%D0%B2%20%D0%BA%D0%BE%D0%BC%D0%B0%D0%BD%D0%B4%D0%BD%D0%BE%D0%B9%20%D1%81%D1%82%D1%80%D0%BE%D0%BA%D0%B8.pdf)
3. [Программирование на языке ассемблера NASM Столяров А. В.](https://esystem.rudn.ru/pluginfile.php/2088953/mod_resource/content/2/%D0%A1%D1%82%D0%BE%D0%BB%D1%8F%D1%80%D0%BE%D0%B2%20%D0%90.%20%D0%92.%20-%20%D0%9F%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5%20%D0%BD%D0%B0%20%D1%8F%D0%B7%D1%8B%D0%BA%D0%B5%20%D0%B0%D1%81%D1%81%D0%B5%D0%BC%D0%B1%D0%BB%D0%B5%D1%80%D0%B0%20NASM%20%D0%B4%D0%BB%D1%8F%20%D0%9E%D0%A1%20Unix.pdf)
