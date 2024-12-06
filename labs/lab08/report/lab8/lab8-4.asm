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
